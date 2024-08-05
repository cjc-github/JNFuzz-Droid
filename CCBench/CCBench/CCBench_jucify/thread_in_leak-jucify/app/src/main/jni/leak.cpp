#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>
#include <unistd.h>
#include <pthread.h>
#include <assert.h>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

JavaVM *gJavaVM = NULL;
jclass cls=NULL;
jmethodID mid=NULL;
jstring msg=NULL;

//other thread
static void* native_thread_exec(void *arg)
{
    JNIEnv *env;
    gJavaVM->AttachCurrentThread(&env,NULL);
    for(int i = 0 ; i < 5; i++)
    {
        usleep(2);
        LOGE("pthread id:%d num=%d",pthread_self(),i);
    }
    gJavaVM->DetachCurrentThread();
    return ((void *)0);
}

extern "C"
JNIEXPORT void JNICALL
Java_org_cao_thread_1in_1leak_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    cls=env->FindClass("android/util/Log");
    mid=(*env).GetStaticMethodID(cls, "d","(Ljava/lang/String;Ljava/lang/String;)I");
    msg = data;
    env->GetJavaVM(&gJavaVM);
    pthread_t id;
    LOGE("create thread\n");
    if(pthread_create(&id,NULL,native_thread_exec,NULL)!=0)
    {
        LOGE("thread create fail");
        return;
    }
    //main thread
    for(int i = 0 ; i < 5; i++)
    {
        usleep(20);
        jstring tag = (*env).NewStringUTF("leak");
        (*env).CallStaticIntMethod(cls, mid, tag, msg);
    }
    LOGE("thread finish");
}
