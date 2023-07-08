#include <android/log.h>
#include <jni.h>
#include <stddef.h>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


const char *getCharFromString(JNIEnv *env, jstring string) {
    if (string == NULL)
        return NULL;

    return env->GetStringUTFChars(string, 0);
}

extern "C" JNIEXPORT void JNICALL Java_org_cao_condition1_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data,jint x) {
    const char *messages=getCharFromString(env,data);
    if(x>0)
    {
        //LOGE("%s",messages);
        jstring jstring1=env->NewStringUTF(messages);
        jclass jniLog = (*env).FindClass("android/util/Log");
        jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
        jstring tag = (*env).NewStringUTF("Test");
        (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);
    }
    env->ReleaseStringUTFChars(data,messages);
    return;
}