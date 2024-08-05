cmake_minimum_required(VERSION 3.4.1)

add_library(while1
        SHARED
        leak.cpp
        )

target_link_libraries(while1
                     android
                     log)
