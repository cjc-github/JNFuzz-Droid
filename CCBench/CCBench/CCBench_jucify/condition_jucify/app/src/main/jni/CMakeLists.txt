cmake_minimum_required(VERSION 3.4.1)

add_library(condition1
        SHARED
        leak.cpp
        )

target_link_libraries(condition1
                     android
                     log)
