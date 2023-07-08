cmake_minimum_required(VERSION 3.4.1)

add_library(global_imei
        SHARED
        leak.cpp)

target_link_libraries(global_imei
                     android
                     log)