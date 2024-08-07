#include <jni.h>
#include <android/log.h>
#include <time.h>

#define LOG_TAG "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

extern "C" {
JNIEXPORT void JNICALL
Java_org_cao_weak_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data) {
    const char *message;
    if (data != NULL) {
        message = env->GetStringUTFChars(data, 0);
    }
    LOGE("%s", message); //not find
    env->ReleaseStringUTFChars(data, message);
    return;
}
}