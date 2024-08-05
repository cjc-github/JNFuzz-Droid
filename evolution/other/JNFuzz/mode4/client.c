#include "spsc.h"

#include <stdio.h>

#define BUFFER_SIZE 1024 * 1024 *128

int main(int argc, char** argv)
{
	spsc_ring ring;
	if (spsc_create_pub(&ring, BUFFER_SIZE) == -1) return 1;

	puts("Enter text: ");
	char buf[512];
	fgets(buf,512,stdin);
	if (spsc_write(&ring, buf, 511) == 0)
	{
		puts("Failed to write.");
	}
	return 0;
}
