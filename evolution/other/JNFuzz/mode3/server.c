#include "vm.h"
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define BUFFER_SIZE 1024 * 1024 *128

JavaVM *vm = NULL;
JNIEnv *env = NULL;

int main(int argc, char** argv)
{


    jstring str0 = "/data/local/tmp/libexperiment1.so";
    printf(" [+] Loading target: [%s] \n", str0);
    void *handle0 = dlopen(str0, RTLD_LAZY);
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
    typedef void (*jni0_t)(JNIEnv *env, jobject obj,jstring i1);
    jni0_t jni0 = dlsym(handle0, "Java_org_cao_experiment1_MainActivity_send");

    if(jni0 == NULL)
    {
        printf(" [!] Could not dlsym the file! (%s) \n", dlerror());
        return -2;
    }else{
        printf(" [+] Found the function (%p)\n", jni0);
    }

    jclass class0 = (*env)->FindClass(env, "org/cao/experiment1/MainActivity");
    if(class0 == NULL){
        printf(" [!] Could not find the class on the class path\n");
        return -3;
    }else{
        printf(" [+] Found the Class: [%p]\n", class0);
    }

    jobject obj0 = (*env)->AllocObject(env, class0);

    printf("Fuzz testing ...\n");
	jstring par0 = (*env)->NewStringUTF(env,"358240051111110");
    jni0(env,class0, par0);

    printf(" [+] Cleaning up VM\n");
    (*vm)->DestroyJavaVM(vm);

    printf(" [+] Closing target library\n");
    dlclose(handle0);

    return 0;
}
