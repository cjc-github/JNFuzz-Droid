cmake_minimum_required(VERSION 3.4.1)

add_library(math_library
        SHARED
        leak.cpp
        )

target_link_libraries(math_library
                     android
                     log)

