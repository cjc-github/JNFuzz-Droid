#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


extern "C" JNIEXPORT void JNICALL Java_org_cao_atoll_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data){
    const char *mess=env->GetStringUTFChars(data,0);
    long long x=atoll(mess);
    LOGE("%lld",x);//leak
    env->ReleaseStringUTFChars(data,mess);
    return;
}