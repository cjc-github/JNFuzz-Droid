#include "spsc.h"

#include <stdio.h>

int main(int argc, char** argv)
{
	spsc_ring ring;
	printf("size=%zu\n",spsc_capacity(&ring));
	printf("size=%zu\n",spsc_size(&ring));
	spsc_destroy(&ring);
}
