#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>


int main()
{
    void * handle = dlopen("./libexperiment1.so", RTLD_LAZY);
	if (handle == NULL) {
		printf(" [!] Could not dlopen file! (%s)\n", dlerror());
		return 0;
	}

	typedef void (*sort_t)();
	sort_t sort = (sort_t)dlsym(handle, "_Z10bubbleSortv");

	if (sort == NULL) {
		printf(" [!] Couldn't find sort function\n");
	} else {
		printf(" [+] Found sort function, good (%p)\n", sort);
	}

	sort();
    printf("finish!");
}
