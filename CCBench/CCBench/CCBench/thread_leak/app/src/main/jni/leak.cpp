#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>
#include <unistd.h>
#include <pthread.h>


#define LOG_TAG    "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)


const char *getCharFromString(JNIEnv *env, jstring string) {
    if (string == NULL)
        return NULL;

    return env->GetStringUTFChars(string, 0);
}

int retStatus;

void *run_by_thread(void *arg) {
    int cnt = 3, i;
    int *threadNum = (int *) arg;
    for (i = 0; i < cnt; ++i) {
        sleep(1);
        LOGI("thread %d: %d", *threadNum, i);
    }
    if (1 == *threadNum) {
        retStatus = 100;
        return (void *) &retStatus;
    } else if (2 == *threadNum) {
        retStatus = 200;
        pthread_exit((void *) &retStatus);
    }
}

extern "C"
JNIEXPORT void JNICALL
Java_org_cao_thread_1leak_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    // TODO: implement send()
    pthread_t th1, th2;
    int threadNum1 = 1, threadNum2 = 2;
    int ret;
    pthread_create(&th1, NULL, run_by_thread, (void *) &threadNum1);
    pthread_create(&th2, NULL, run_by_thread, (void *) &threadNum2);
    void *status;
    ret = pthread_join(th1, &status);
    int *st = (int *) status;
    LOGI("thread 1 end %d %d", ret, *st);
    ret = pthread_join(th2, &status);
    st = (int *) status;
    LOGI("thread 2 end %d %d", ret, *st);
    LOGI("%s", getCharFromString(env, data)); // Sink
    return;
}