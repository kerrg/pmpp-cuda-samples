cmake_minimum_required(VERSION 3.18)

# 1. Set the architecture BEFORE the project() call
set(CMAKE_CUDA_ARCHITECTURES 52)

# Set the vcpkg toolchain file if using the submodule
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg")
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
        CACHE STRING "Vcpkg toolchain file")
endif()

# 2. Add the CUDA language to the project
project(Chap03 LANGUAGES CXX CUDA)

# Find the JPEG library (provided by vcpkg)
find_package(JPEG REQUIRED)

# Per-target exception settings are now used.
# 'StandardCpp' will have exceptions enabled by default.

add_executable(Chap03 main.cu)
# Disable exceptions for this target
target_compile_options(Chap03 PRIVATE -fno-exceptions)
set_property(TARGET Chap03 APPEND PROPERTY CUDA_FLAGS "-Xcompiler=-fno-exceptions")

# Link the JPEG library to your executable
target_link_libraries(Chap03 PRIVATE ${JPEG_LIBRARIES})
target_include_directories(Chap03 PRIVATE ${JPEG_INCLUDE_DIR})

set_target_properties(Chap03 PROPERTIES
        CUDA_STANDARD 17
        CUDA_STANDARD_REQUIRED ON
)