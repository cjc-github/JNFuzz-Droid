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
    //LOGE("%lld",x);//leak
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("Test");
    jclass cls=(*env).FindClass("java/lang/String");
    jmethodID jmid=(*env).GetStaticMethodID(cls,"valueOf", "(J)Ljava/lang/String;");
    jstring str1= static_cast<jstring>((*env).CallStaticObjectMethod(cls, jmid, x));
    (*env).CallStaticIntMethod(jniLog, logDId, tag, str1);
    env->ReleaseStringUTFChars(data,mess);
    return;
}