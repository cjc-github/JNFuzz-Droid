cmake_minimum_required(VERSION 3.4.1)

add_library(weak
        SHARED
        leak.cpp
        )

target_link_libraries(weak
                     android
                     log)

