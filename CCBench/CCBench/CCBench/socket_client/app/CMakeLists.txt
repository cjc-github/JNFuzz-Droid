cmake_minimum_required(VERSION 3.4.1)

add_library(leak SHARED
        src/main/jni/socket-client.cpp
        )

target_link_libraries(leak
                     android
                     log)

