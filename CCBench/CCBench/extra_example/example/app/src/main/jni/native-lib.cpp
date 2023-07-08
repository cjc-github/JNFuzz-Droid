#include <android/log.h>
#include <jni.h>
#include <cmath>
#include <time.h>
#include <stdlib.h>

#define LOG_TAG    "native-lib"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

void leaksensitive(const char *mess, int len) {
    LOGE("len=%d",len);
    if (sqrt(5 + len) >= 4) {
        LOGE("%s", mess); //Sink
    }
}
//Static register
extern "C" JNIEXPORT void JNICALL
Java_com_test_example_utilActivity_fun1(JNIEnv *env, jclass clazz, jstring data, jint length) {
    // TODO: implement fun1()
    const char *mess = env->GetStringUTFChars(data, 0);
    leaksensitive(mess, length);
    env->ReleaseStringUTFChars(data, mess);
    return;
}

void native_fun(JNIEnv *env, jobject thiz, jstring s) {
    const char *mess = env->GetStringUTFChars(s, 0);
    srand((int) time(0));
    int c = rand() % 100;
    leaksensitive(mess, c);
    env->ReleaseStringUTFChars(s, mess);
    return;
}

static JNINativeMethod gMethods[] = {
        {"fun2", "(Ljava/lang/String;)V", (void *) native_fun},
};

//Dynamic register
jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    JNIEnv *env = NULL;
    vm->GetEnv(reinterpret_cast<void **>(&env), JNI_VERSION_1_4);
    jclass clazz = env->FindClass("com/test/example/utilActivity");
    env->RegisterNatives(clazz, gMethods, 1);
    return JNI_VERSION_1_4;
}