cmake_minimum_required(VERSION 3.4.1)

add_library(thread_no_leak
        SHARED
        leak.cpp)

target_link_libraries(thread_no_leak
                     android
                     log)