#include "spsc.h"
#include "vm.h"
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

#define BUFFER_SIZE 1024 * 1024 *128

JavaVM *vm = NULL;
JNIEnv *env = NULL;

jint getjni_int(char * data, int x)
{
    jint i = 0;
    i += ((data[x] & 0xff) << 24);
    i += ((data[x+1] & 0xff) << 16);
    i += ((data[x+2] & 0xff) << 8);
    i += ((data[x+3] & 0xff));
    if (data[x]<0)
    {
        return i-4294967296;
    }else{
        return i;
    }
}

jlong getjni_long(char * data, int x)
{
    jlong i = 0;
    i += ((data[x] & 0xff) << 56);
    i += ((data[x+1] & 0xff) << 48);
    i += ((data[x+2] & 0xff) << 40);
    i += ((data[x+3] & 0xff) << 32);
    i += ((data[x+4] & 0xff) << 24);
    i += ((data[x+5] & 0xff) << 16);
    i += ((data[x+6] & 0xff) << 8);
    i += ((data[x+7] & 0xff));
    if (data[x]<0)
    {
        return i-9223372036854775808*2;
    }else{
        return i;
    }
}


jbyte getjni_byte(char * data, int x)
{
    return data[x];
}

jboolean getjni_boolean(char *data, int x)
{
    int i=data[x];
    if(i>0)
    {
        return true;
    }else{
        return false;
    }
}

jchar getjni_char(char *data, int x)
{
    jchar i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    return i;
}

jshort getjni_short(char *data, int x)
{
    jshort i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    if(data[x]<0)
    {
        return i-65536;
    }else{
        return i;
    }
}

union charFloat{
    char str[8];
    float value;
};

union charDouble{
    char str[8];
    double value;
};

jfloat getjni_float(char *data, int x)
{
    union charFloat f;
    f.str[3]=data[x];
    f.str[2]=data[x+1];
    f.str[1]=data[x+2];
    f.str[0]=data[x+3];
    return f.value;
}

jdouble getjni_double(char *data, int x)
{
    union charDouble dou;
    dou.value=0.0;
    dou.str[7]=data[x];
    dou.str[6]=data[x+1];
    dou.str[5]=data[x+2];
    dou.str[4]=data[x+3];
    dou.str[3]=data[x+4];
    dou.str[2]=data[x+5];
    dou.str[1]=data[x+6];
    dou.str[0]=data[x+7];
    return dou.value;
}

jobject getGlobalContext(JNIEnv *env) {
    jobject application = NULL;
    jclass activity_thread_clz = (*env)->FindClass(env,"android/app/ActivityThread");
    if (activity_thread_clz != NULL) {
        jmethodID currentApplication = (*env)->GetStaticMethodID(env,activity_thread_clz, "currentApplication", "()Landroid/app/Application;");
        if (currentApplication != NULL) {
            application = (*env)->CallStaticObjectMethod(env,activity_thread_clz, currentApplication);
        } else {
            printf("Cannot find method: currentApplication() in ActivityThread.");
        }
        (*env)->DeleteLocalRef(env,activity_thread_clz);
    } else {
        printf("Cannot find class: android.app.ActivityThread");
    }
    return application;
}

jobject getIntent(JNIEnv *env){
    jobject jobj = NULL;
    jclass intentclass = (*env)->FindClass(env, "android/content/Intent");
    if(intentclass == NULL)
    {
        return NULL;
    }
    jmethodID jid=(*env)->GetMethodID(env, intentclass, "<init>", "()V");
    
    jobj = (*env)->NewObject(env, intentclass, jid);
    return jobj;
}

jobjectArray getStringArray(JNIEnv *env,char* data)
{
    jclass cls = (*env)->FindClass(env, "java/lang/String");
    jobjectArray str_array = (*env)->NewObjectArray(env, 10, cls, 0);
    jstring jstr;
    for(int i=0; i<10; i++){
        jstr = (*env)->NewStringUTF(env, data);
        (*env)->SetObjectArrayElement(env, str_array, i, jstr);
        (*env)->DeleteLocalRef(env, jstr);
    }
    return str_array;
}

jobject getBundle(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = (*env)->FindClass(env, "android/os/Bundle");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = (*env)->GetMethodID(env, bundle, "<init>", "()V");
    
    jobj = (*env)->NewObject(env,bundle,jid);
    return jobj;
}

jobject getObject(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = (*env)->FindClass(env, "android/lang/Object");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = (*env)->GetMethodID(env, bundle, "<init>", "()V");
    
    jobj = (*env)->NewObject(env,bundle,jid);
    return jobj;
}

jobject getPendingIntent(JNIEnv *env, jobject obj){
    jobject jobj = NULL;
    jclass pcls =(*env)->FindClass(env, "android/app/PendingIntent");
    if (pcls!=NULL){
        return jobj;
    }
    jclass jcls=(*env)->FindClass(env,"android.app.PendingIntent");
    if(jcls==NULL){
        return NULL;
    }
    jmethodID getbroad=(*env)->GetMethodID(env, jcls,"getBroadcast","(Landroid/content/Context;ILandroid/content/Intent;I)Landroid.app.PendingIntent;");
    
    jobject context=getGlobalContext(env);
    jobject intent=getIntent(env);
    
    jobj=(*env)->CallObjectMethod(env,obj, getbroad, context,0,intent,0);
    return jobj;
}

void getjni_string(char *dest, char *src, int start, int n)
{
    char *p=dest;
    char *q=src;
    char *temp=NULL;
    int len=strlen(src);

    if(start>=len || start<0){
      return;
    }
    temp=q+start;
    if(n>strlen(temp)){
       n=strlen(temp);
    }
    q+=start;
    while(n--) *(p++)=*(q++);
    *(p++)='\0';
}

int main(int argc, char** argv)
{


    jstring str0 = "/data/local/tmp/libdynamic_register_multiple.so";
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
    typedef void (*jni0_t)(JNIEnv *env, jclass class,jstring i1);
    jni0_t jni0 = dlsym(handle0, "native_send");

    if(jni0 == NULL)
    {
        printf(" [!] Could not dlsym the file! (%s) \n", dlerror());
        return -2;
    }else{
        printf(" [+] Found the function (%p)\n", jni0);
    }

    jclass class0 = (*env)->FindClass(env, "org/arguslab/native_dynamic_register_multiple/MainActivity");
    if(class0 == NULL){
        printf(" [!] Could not find the class on the class path\n");
        return -3;
    }else{
        printf(" [+] Found the Class: [%p]\n", class0);
    }

    spsc_ring ring;
    if (spsc_create_sub(&ring, BUFFER_SIZE) == -1) return 1;

    printf("Fuzz testing ...\n");
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
            jstring par0 = (*env)->NewStringUTF(env,"358240051111110");
            jni0(env,class0, par0);
            (*env)->DeleteLocalRef(env, par0);
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
