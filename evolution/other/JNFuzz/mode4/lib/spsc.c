#include "spsc.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/file.h>
#include <sys/mman.h>

#define SPSC_HEADER_BYTE_1 0x52
#define SPSC_HEADER_BYTE_2 0x42
#define SPSC_VERSION 1


//找到最接近的二进制幂数（大于n）
static inline size_t get_next_power_of_two(const size_t n)
{
	size_t x = 1;
	while (x < n) x <<= 1;
	return x;
}

//锁定队列
static int spsc_flock(spsc_ring* ring,const char *pathname, int mode)
{
	char* lock_suffix = mode == READ_MODE ? ".read.lock" : ".write.lock";
	char* lock_path = (char*) malloc(strlen(pathname) + strlen(lock_suffix) + 1);
	strcpy(lock_path, pathname);
	strcat(lock_path, lock_suffix);
	int permissions = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP;
	int fd = open(lock_path, O_RDWR | O_CREAT, permissions);
	free(lock_path);
	if (fd == -1)
	{
		perror("[spsc] open");
		return -1;
	}

	if (flock(fd, LOCK_EX | LOCK_NB) == -1)
	{
		perror("[spsc] flock");
		return -1;
	}

	ring->flock_fd = fd;
	return 0;
}

static inline void spsc_funlock(spsc_ring* ring)
{
	close(ring->flock_fd);
}

//申请内存
static int spsc_create(spsc_ring* ring,const char *pathname,  const size_t size)
{
	int permissions = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP;
	int fd = open(pathname, O_RDWR | O_CREAT, permissions);
	if (fd == -1)
	{
		perror("[spsc] open");
		return -1;
	}

	int protection = PROT_READ | PROT_WRITE;
	int visibility = MAP_SHARED;
	size_t rounded_size = get_next_power_of_two(size);

	// allocate double the rounded_size here, to allow reading/writing without checking for overflow.
	size_t mmap_size = sizeof(spsc_ring_data) + rounded_size * 2;
	if (posix_fallocate(fd, 0, mmap_size + 1) != 0)
	{
		perror("[spsc] fallocate");
		close(fd);
		return -1;
	}

	void* addr = mmap(NULL, mmap_size, protection, visibility, fd, 0);
	if (addr == MAP_FAILED)
	{
		perror("[spsc] mmap");
		close(fd);
		return -1;
	}

	if (flock(fd, LOCK_EX) == -1)
	{
		perror("[spsc] flock");
		close(fd);
		return -1;
	}

	spsc_ring_data* spsc_data = (spsc_ring_data*) addr;
	char* header = spsc_data->_header;
	if (header[0] != SPSC_HEADER_BYTE_1 || header[1] != SPSC_HEADER_BYTE_2)
	{
		header[0] = SPSC_HEADER_BYTE_1;
		header[1] = SPSC_HEADER_BYTE_2;
		spsc_data->_rpos = 0;
		spsc_data->_wpos = 0;
		spsc_data->_version = SPSC_VERSION;
		spsc_data->_size = rounded_size;
	}
	else if (spsc_data->_size != rounded_size)
	{
		puts("[spsc] create: Existing buffer does not match specified size");
		munmap(spsc_data, sizeof(spsc_ring_data));
		flock(fd, LOCK_UN);
		close(fd);
		return -1;
	}
	
	flock(fd, LOCK_UN);
	close(fd);
	ring->_data = spsc_data;
	return 0;
}

int spsc_create_sub(spsc_ring* ring,  const size_t size)
{
	const char *pathname="test_jni";
	if (spsc_flock(ring, pathname, READ_MODE) == -1) return -1;
	if (spsc_create(ring, pathname, size) == -1)
	{
		spsc_funlock(ring);
		return -1;
	}

	ring->mode = READ_MODE;
	return 0;
}

//创建队列
int spsc_create_pub(spsc_ring* ring, const size_t size)
{
	const char *pathname="test_jni";
	if (spsc_flock(ring, pathname, WRITE_MODE) == -1) return -1;
	if (spsc_create(ring, pathname, size) == -1)
	{
		spsc_funlock(ring);
		return -1;
	}

	ring->mode = WRITE_MODE;
	return 0;
}

static inline size_t _read(spsc_ring_data* data, size_t offset, char* dest, const size_t n)
{
	memcpy(dest, data->_buf + offset, n);
	return n;
}

//读取队列
size_t spsc_read(spsc_ring* ring, void* dest, const size_t n)
{
	if (ring->mode != READ_MODE) return 0;

	spsc_ring_data* data = ring->_data;
	size_t rpos;
	size_t wpos;

	__atomic_load(&data->_rpos, &rpos, __ATOMIC_RELAXED);
	__atomic_load(&data->_wpos, &wpos, __ATOMIC_ACQUIRE);
	if (rpos == wpos)
	{
		return 0;
	}

	size_t size = data->_size;
	size_t data_offset = sizeof(MSG_SIZE_T);
	char msg_size_bytes[data_offset];
	rpos += _read(data, rpos & (size - 1), msg_size_bytes, data_offset);
	
	MSG_SIZE_T msg_size = *(MSG_SIZE_T*) msg_size_bytes;

	size_t read = msg_size > n ? n : msg_size;
	_read(data, rpos & (size - 1), (char*) dest, read);

	rpos += msg_size;
	__atomic_store(&data->_rpos, &rpos, __ATOMIC_RELEASE);
	return read;
}

static inline size_t _write(spsc_ring_data* data, size_t offset, const char* src, const size_t n)
{
	memcpy(data->_buf + offset, src, n);
	return n;
}

//写入队列
MSG_SIZE_T spsc_write(spsc_ring* ring, const void* buf, const MSG_SIZE_T n)
{
	if (ring->mode != WRITE_MODE) return 0;

	spsc_ring_data* data = ring->_data;
	size_t wpos;
	__atomic_load(&data->_wpos, &wpos, __ATOMIC_RELAXED);

	size_t rpos;
	__atomic_load(&data->_rpos, &rpos, __ATOMIC_ACQUIRE);

	size_t size = data->_size;
	size_t data_offset = sizeof(MSG_SIZE_T);
	if (wpos + data_offset + n - rpos > size)
	{
		return 0;
	}

	char* msg_size_bytes = (char*) &n;
	wpos += _write(data, wpos & (size - 1), msg_size_bytes, data_offset);
	wpos += _write(data, wpos & (size - 1), (char*) buf, n);

	__atomic_store(&data->_wpos, &wpos, __ATOMIC_RELEASE);
	return n;
}

//队列长度
size_t inline spsc_size(const spsc_ring* ring)
{
	size_t wpos;
	size_t rpos;
	__atomic_load(&ring->_data->_wpos, &wpos, __ATOMIC_ACQUIRE);
	__atomic_load(&ring->_data->_rpos, &rpos, __ATOMIC_ACQUIRE);
	return wpos - rpos;
}

//队列容量
size_t inline spsc_capacity(const spsc_ring* ring)
{
	return ring->_data->_size;
}

//取消内存
void spsc_destroy(spsc_ring* ring)
{
	munmap(ring->_data, sizeof(spsc_ring_data));
	spsc_funlock(ring);
}
