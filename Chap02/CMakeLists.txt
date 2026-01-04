cmake_minimum_required(VERSION 3.18)

# 1. Set the architecture BEFORE the project() call
set(CMAKE_CUDA_ARCHITECTURES 52)

# 2. Add the CUDA language to the project
project(Chap02 LANGUAGES C CUDA)

# 3. Add your source file
add_executable(Chap02 main.cu)

# 4. Optional: Set C++ and CUDA standards
set_target_properties(Chap02 PROPERTIES
        CUDA_STANDARD 17
        CUDA_STANDARD_REQUIRED ON
)