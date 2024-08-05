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
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d",
                                                "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("leak");
    (*env).CallStaticIntMethod(jniLog, logDId, tag, msg);
    return;
}