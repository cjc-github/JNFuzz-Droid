cmake_minimum_required(VERSION 3.4.1)

add_library(thread
        SHARED
        leak.cpp)

target_link_libraries(thread
                     android
                     log)