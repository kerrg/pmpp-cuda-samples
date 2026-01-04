cmake_minimum_required(VERSION 3.18)

# 1. Set the architecture BEFORE the project() call
set(CMAKE_CUDA_ARCHITECTURES 52)

# 2. Add the CUDA language to the project
project(Chap02 LANGUAGES CXX CUDA)

# Disable C++ exceptions
add_compile_options(-fno-exceptions)
list(APPEND CMAKE_CUDA_FLAGS "-Xcompiler=-fno-exceptions")

add_executable(Chap02 main.cu)
add_executable(Grouped grouped.cu)

# Add the local SafeInt library to the include path for both targets
target_include_directories(Chap02 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/SafeInt)
target_include_directories(Grouped PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/SafeInt)

set_target_properties(Chap02 PROPERTIES
        CUDA_STANDARD 17
        CUDA_STANDARD_REQUIRED ON
)