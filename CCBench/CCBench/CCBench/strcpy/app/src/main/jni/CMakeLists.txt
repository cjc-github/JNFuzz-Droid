cmake_minimum_required(VERSION 3.4.1)

add_library(strcpy
        SHARED
        leak.cpp)

target_link_libraries(strcpy
                     android
                     log)