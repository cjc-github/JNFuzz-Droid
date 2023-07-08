cmake_minimum_required(VERSION 3.4.1)

add_library(armeabi
        SHARED
        leak.cpp)

target_link_libraries(armeabi
                     android
                     log)