#include <android/log.h>
#include <jni.h>
#include <string.h>

#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


extern "C" JNIEXPORT void JNICALL
Java_org_cao_strcpy_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data) {
    char *p1 = new char[15];
    strcpy(p1, env->GetStringUTFChars(data, 0));
    // LOGE("%s", p1);
    jstring jstring1=env->NewStringUTF(p1);
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("Test");
    (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);
    return;
}