#include <android/log.h>
#include <jni.h>
#include <stdlib.h>
#include <cctype>

extern "C"
JNIEXPORT void JNICALL
Java_org_cao_armeabi_1v7a_MainActivity_send(JNIEnv *env, jobject thiz, jstring data) {
    // TODO: implement send()
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d",
                                                "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("leak");
    (*env).CallStaticIntMethod(jniLog, logDId, tag, data);

    return;
}