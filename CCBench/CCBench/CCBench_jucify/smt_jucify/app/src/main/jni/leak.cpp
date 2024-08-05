#include <android/log.h>
#include <jni.h>

#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

extern "C" JNIEXPORT void JNICALL
Java_org_cao_smt1_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data) {
    const char *mess = env->GetStringUTFChars(data, 0);
    for (int i = 0; i < 100; i++) {
        if (i * i * i + i * i == 499280) {
            if (i >= 80) {
                // LOGE("%s", mess);
                jstring jstring1=env->NewStringUTF(mess);
                jclass jniLog = (*env).FindClass("android/util/Log");
                jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
                jstring tag = (*env).NewStringUTF("Test");
                (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);
            }
        }
    }
    env->ReleaseStringUTFChars(data, mess);
    return;
}