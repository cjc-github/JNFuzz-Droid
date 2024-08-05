#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <time.h>

#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

const char *getCharFromString(JNIEnv *env, jstring string) {
    if (string == NULL)
        return NULL;

    return env->GetStringUTFChars(string, 0);
}

void disp(const char *data)
{
    while (1) {
        LOGE("%s", data);
    }
}

extern "C" JNIEXPORT void JNICALL Java_org_cao_while1_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data){
    const char *mess=getCharFromString(env,data);
    disp(mess);
    env->ReleaseStringUTFChars(data,mess);
    return;
}