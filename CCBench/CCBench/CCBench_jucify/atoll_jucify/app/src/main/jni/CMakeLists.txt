cmake_minimum_required(VERSION 3.4.1)

add_library(atoll
        SHARED
        leak.cpp)

target_link_libraries(atoll
                     android
                     log)