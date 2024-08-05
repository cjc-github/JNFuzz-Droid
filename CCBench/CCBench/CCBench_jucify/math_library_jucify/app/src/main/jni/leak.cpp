#include <android/log.h>
#include <jni.h>
#include <cmath>
#include <time.h>
#include <stdlib.h>

#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


extern "C" JNIEXPORT void JNICALL
Java_org_cao_math_1library_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data) {
    const char *mess = env->GetStringUTFChars(data, 0);
    int c;
    srand((int) time(0));
    c = rand() % 100;
    if (sqrt(4 + c) >= 2) {
        // LOGE("%s", mess);
        jstring jstring1=env->NewStringUTF(mess);
        jclass jniLog = (*env).FindClass("android/util/Log");
        jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
        jstring tag = (*env).NewStringUTF("Test");
        (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);
    }
    env->ReleaseStringUTFChars(data, mess);
    return;
}