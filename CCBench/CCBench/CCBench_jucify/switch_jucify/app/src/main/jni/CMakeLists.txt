cmake_minimum_required(VERSION 3.4.1)

add_library(switch1
        SHARED
        leak.cpp
        )

target_link_libraries(switch1
                     android
                     log)
