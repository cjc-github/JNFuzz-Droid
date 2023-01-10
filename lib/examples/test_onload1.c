#include "spsc.h"
#include "vm.h"
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define BUFFER_SIZE 1024 * 1024 *128

JavaVM *vm = NULL;
JNIEnv *env = NULL;


int main(int argc, char** argv)
{


    jstring str0 = "/data/local/tmp/libdynamic_register_multiple.so";
    printf(" [+] Loading target: [%s] \n", str0);
    void *handle0 = dlopen(str0, RTLD_NOW);
    if(handle0 == NULL){
        printf(" [!] Could not dlopen the file! (%s)\n", dlerror());
    }

    printf(" [+] Native Harness\n");
    int status = init_jvm(&vm, &env);
    if (status == 0) {
        printf(" [+] Initialization success (vm=%p, env=%p)\n", vm, env);
    } else {
        printf(" [!] Initialization failure (%i)\n", status);
        return 1;
    }
    typedef jint (*jni0_t)(JavaVM *vm,void *reservered);
    jni0_t jni0 = dlsym(handle0, "JNI_OnLoad");

    if(jni0 == NULL)
    {
        printf(" [!] Could not dlsym the file! (%s) \n", dlerror());
        return -2;
    }else{
        printf(" [+] Found the function (%p)\n", jni0);
    }


    spsc_ring ring;
    if (spsc_create_sub(&ring, BUFFER_SIZE) == -1) return 1;

    printf("Fuzz testing ...\n");
    jni0(vm,NULL);
    char buf[512];
    while (1)
    {

        size_t n_read = spsc_read(&ring, buf, 511);
        if (n_read > 0)
        {
            buf[n_read] = '\0';
            printf("Received message: %s\n", buf);
            char* data=buf;
            if(strlen(data)>=0){
            	jni0(vm,NULL);
            }

        }
    }

    //关闭vm
    printf(" [+] Cleaning up VM\n");
    (*vm)->DestroyJavaVM(vm);

    printf(" [+] Closing target library\n");
    dlclose(handle0);

    return 0;
}
