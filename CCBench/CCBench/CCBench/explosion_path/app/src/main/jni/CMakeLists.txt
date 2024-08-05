cmake_minimum_required(VERSION 3.4.1)

add_library(explosion_path2
        SHARED
        leak.cpp
        )

target_link_libraries(explosion_path2
                     android
                     log)

