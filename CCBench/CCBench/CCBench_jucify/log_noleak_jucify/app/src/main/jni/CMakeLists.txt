cmake_minimum_required(VERSION 3.4.1)

add_library(log_noleak
        SHARED
        leak.cpp
        )

target_link_libraries(log_noleak
                     android
                     log)
