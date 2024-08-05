cmake_minimum_required(VERSION 3.4.1)

add_library(arm64_v8a
        SHARED
        leak.cpp)

target_link_libraries(arm64_v8a
                     android
                     log)