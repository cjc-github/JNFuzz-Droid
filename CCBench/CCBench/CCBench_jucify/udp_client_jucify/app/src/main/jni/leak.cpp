#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/types.h>
#include <unistd.h>
#include <android/log.h>

#define LOG_TAG "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

int UDP_PORT = 5678;

const char *getCharFromString(JNIEnv *env, jstring string) {
    if (string == NULL)
        return NULL;

    return env->GetStringUTFChars(string, 0);
}

void upd_client(JNIEnv *env,jstring data) {

    const char *buf = getCharFromString(env, data);

    //客户端socket句柄
    int client_fd;

    //服务器地址信息
    struct sockaddr_in server_addr;

    //设置服务器地址信息
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(UDP_PORT);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    //创建socket
    client_fd = socket(AF_INET, SOCK_DGRAM, 0);


    socklen_t length = sizeof(server_addr);
    //发送udp包,将sizeof(buf)改成15
    if (sendto(client_fd, buf, 15, 0, (struct sockaddr *) &server_addr, length) == -1) {
        LOGI("send to fail!");
        return;
    }
    // LOGE("%s",buf);
    jstring jstring1=env->NewStringUTF(buf);
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("Test");
    (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);

    close(client_fd);
    env->ReleaseStringUTFChars(data,buf);
    return;
}

extern "C"
void Java_org_cao_udp_1client_MainActivity_startUdpClient(JNIEnv *env, jobject instance,jstring data) {
    upd_client(env,data);
    return;
}