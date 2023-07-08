cmake_minimum_required(VERSION 3.4.1)

add_library(interrupt_cfg
        SHARED
        leak.cpp)

target_link_libraries(interrupt_cfg
                     android
                     log)