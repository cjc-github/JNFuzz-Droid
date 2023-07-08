#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


extern "C"
JNIEXPORT void JNICALL
Java_org_cao_arm64_1v8a_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    // TODO: implement send()
    const char *mess = env->GetStringUTFChars(data, 0);
    LOGE("%s", mess);
    env->ReleaseStringUTFChars(data, mess);
    return;
}