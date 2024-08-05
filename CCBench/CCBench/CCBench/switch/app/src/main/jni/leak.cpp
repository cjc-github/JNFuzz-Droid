#include <android/log.h>
#include <jni.h>
#include <cmath>
#include <time.h>
#include <stdlib.h>

#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

int play(int numb) {
    int total = 0;
    int percent = 0.8 * numb;
    srand(time(0));
    for (int i = 0; i < 10; i++) {
        int value = ((i * i) + numb) % 100;
        if (value > percent) {
            LOGE("Good Luck..");
        } else {
            LOGE("Bad Grade..");
        }
        total += value;
    }
    int res = (int) (total / 10);
    if (res > percent)
        return 1;
    return 0;
}    //play only return 0 or 1


extern "C"
JNIEXPORT void JNICALL
Java_org_cao_switch1_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    // TODO: implement send()
    const char *mess = env->GetStringUTFChars(data, 0);
    srand(time(0));
    int x = rand() % 20;
    switch (play(x)) {
        case 0:
            LOGE("Test0");
            break;
        case 1:
            LOGE("Test1");
            break;
        default:
            LOGE("%s", mess);
            break;
    }
    env->ReleaseStringUTFChars(data, mess);
    return;
}