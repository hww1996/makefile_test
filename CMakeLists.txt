cmake_minimum_required(VERSION 2.8)
include_directories(include)
aux_source_directory(src src_list)
add_executable(fuck ${src_list} main.cpp)