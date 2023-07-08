cmake_minimum_required(VERSION 3.4.1)

add_library(method_overloading
        SHARED
        leak.cpp)

target_link_libraries(method_overloading
                     android
                     log)