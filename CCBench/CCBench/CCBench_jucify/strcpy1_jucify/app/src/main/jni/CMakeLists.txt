cmake_minimum_required(VERSION 3.4.1)

add_library(strcpy1
        SHARED
        leak.cpp)

target_link_libraries(strcpy1
                     android
                     log)