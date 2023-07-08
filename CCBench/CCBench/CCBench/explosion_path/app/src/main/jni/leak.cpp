#include <android/log.h>
#include <jni.h>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

int testrand(int max)
{
    int i;
    for(int i=0;i<max;i++)
    {
        //i=79
        if(i*i*i+i*i==499280)
        {
            if(i>=80){
                return 1;
            }else{
                return 0;
            }
        }
    }
    return 0;
}

extern "C" JNIEXPORT void JNICALL Java_org_cao_explosion_1path2_MainActivity_send(JNIEnv *env, jobject thisObj, jstring data){
    const char *mess=env->GetStringUTFChars(data,0);
    if(testrand(100)==1)
    {
        mess="666";
    }else{
        LOGE("true");
    }
    LOGE("%s",mess);
    env->ReleaseStringUTFChars(data,mess);
    return;
}