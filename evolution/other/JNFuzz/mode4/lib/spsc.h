#pragma once

#include <stdint.h>
#include <stdio.h>

#define MSG_SIZE_T uint32_t

#define READ_MODE 1
#define WRITE_MODE 2

/**
 * Internal structure representing the data stored in the shared memory file.
 */
typedef struct spsc_ring_data
{
	char _header[2];
	int _version;
	size_t _size;
	char __pad0[64];

	size_t _rpos;
	char __pad1[64];

	size_t _wpos;
	char __pad2[64];

	char _buf[];
} spsc_ring_data;

/**
 * Structure holding runtime information of the ring.
 */
typedef struct spsc_ring
{
	/**
	 * Reference to shared memory data.
	 */
	spsc_ring_data* _data;
	/**
	 * Indicator to check whether this structure is used for publishing or subscribing.
	 */
	int mode;
	/**
	 * File descriptor for the held read/write lock.
	 */
	int flock_fd;
} spsc_ring;

/**
 * Creates a subscriber for a shared memory spsc ring located at the specified path. A new file is created if it doesn't exist.
 * @param ring pointer to a spsc_ring structure
 * @param pathname path to the shared memory file
 * @param size max size of the ring in bytes
 * @return 0 if successful, otherwise an error code is returned.
 */
int spsc_create_sub(spsc_ring* ring, const size_t size);

/**
 * Creates a publisher for a shared memory spsc ring located at the specified path. A new file is created if it doesn't exist.
 * @param ring pointer to a spsc_ring structure
 * @param pathname path to the shared memory file
 * @param size max size of the ring in bytes
 * @return 0 if successful, otherwise an error code is returned.
 */
int spsc_create_pub(spsc_ring* ring, const size_t size);

/**
 * Reads the next entry from the ring into the specified location.
 * @param ring pointer to a spsc_ring structure
 * @param dest pointer to a location to copy bytes to
 * @param n number of bytes to copy, must be less than or equal to the size of dest.
 * @return the number of bytes copied, or 0 if there is nothing left to read.
 */
size_t spsc_read(spsc_ring* ring, void* dest, const size_t n);

/**
 * Writes an entry into the ring, copying from the specified location.
 * @param ring pointer to a spsc_ring structure
 * @param src pointer to a location to copy bytes from
 * @param n number of bytes to copy, must be less than or equal to the size of src
 * @return the number of bytes copied, or 0 if the ring is full.
 */
MSG_SIZE_T spsc_write(spsc_ring* ring, const void* src, const MSG_SIZE_T n);

/**
 * Gets an approximate size of the ring. The returned number depends on whether the publishing thread or subscribing thread called the method. The behvaiour is undefined for any other calling thread.
 * @param ring pointer to a spsc_ring structure
 * @return an approximate size of the ring.
 */
size_t spsc_size(const spsc_ring* ring);

/**
 * Gets the maximum size of the ring.
 * @return the maximum size of the ring.
 */
size_t spsc_capacity(const spsc_ring* ring);

/**
 * Destructor for spsc_ring.
 * @param ring pointer to a spsc_ring structure
 */
void spsc_destroy(spsc_ring* ring);
