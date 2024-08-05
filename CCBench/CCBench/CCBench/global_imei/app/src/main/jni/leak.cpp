#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>
#include <unistd.h>
#include <pthread.h>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

jstring msg=NULL;

extern "C"
JNIEXPORT void JNICALL
Java_org_cao_global_1imei_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    // TODO: implement send()
    msg=data;
    const char *mess=env->GetStringUTFChars(msg,0);
    LOGE("%s",mess);
    return;
}