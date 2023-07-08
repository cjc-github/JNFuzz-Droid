#include <jni.h>
#include <stdlib.h>
#include <stdio.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <android/log.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <cstring>

#define LOG_TAG "leak"
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)

#define SERVERPORT 3336
#define MAXDATASIZE 1024

const char *getCharFromString(JNIEnv *env, jstring string) {
    if (string == NULL)
        return NULL;

    return env->GetStringUTFChars(string, 0);
}

void client(JNIEnv *env,jstring data) {
    const char *message = getCharFromString(env, data);
    //客户端socket句柄
    int client_fd;

    //数据
    char buf[MAXDATASIZE];

    //服务器地址
    struct sockaddr_in server_addr;

    //创建socket
    if ((client_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
        LOGI("socket create fail!");
        return;
    }

    //置空服务器地址信息
    memset(&server_addr, 0, sizeof(server_addr));

    //填充服务器地址信息
    server_addr.sin_family = AF_INET;//ip v4
    server_addr.sin_port = htons(SERVERPORT);
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");


    //连接服务器
    if (connect(client_fd, (sockaddr *) &server_addr, sizeof(server_addr)) == -1) {
        LOGI("socket connect fail");
        return;
    }

    size_t len = sizeof(message);
    //发送信息到客户端,字节长度为4
    if (send(client_fd, message, 15, 0) == -1) {

        LOGI("send fail");
        //关闭连接
        close(client_fd);
        //关闭子进程
        exit(0);
    }
    //LOGE("%s",message);
    jstring jstring1=env->NewStringUTF(message);
    jclass jniLog = (*env).FindClass("android/util/Log");
    jmethodID logDId = (*env).GetStaticMethodID(jniLog, "d", "(Ljava/lang/String;Ljava/lang/String;)I");
    jstring tag = (*env).NewStringUTF("Test");
    (*env).CallStaticIntMethod(jniLog, logDId, tag, jstring1);

    //关闭socket
    close(client_fd);
    env->ReleaseStringUTFChars(data,message);
    return;
}

extern "C"
void Java_org_cao_socket_1client_MainActivity_startClient(JNIEnv *env, jobject instance,jstring data) {
    client(env,data);
    return;
}