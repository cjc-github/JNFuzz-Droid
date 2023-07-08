cmake_minimum_required(VERSION 3.4.1)

add_library(armeabi_v7a
        SHARED
        leak.cpp)

target_link_libraries(armeabi_v7a
                     android
                     log)