cmake_minimum_required(VERSION 3.4.1)

add_library(native_method_overloading1
        SHARED
        leak.cpp)

target_link_libraries(native_method_overloading1
                     android
                     log)