# Set the minimum CMake version and project settings
cmake_minimum_required(VERSION 3.10)

project(VecVecOp LANGUAGES C CXX)

# Enable C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set CMake policies
cmake_policy(SET CMP0075 NEW)

# LLVM and MLIR paths
set(LLVM_DIR /usr/local/Cellar/llvm/19.1.4/lib/cmake/llvm)
set(MLIR_DIR /usr/local/Cellar/llvm/19.1.4/lib/cmake/mlir)

# libedit paths
set(LibEdit_INCLUDE_DIRS /usr/local/include)
set(LibEdit_LIBRARIES /usr/local/lib/libedit.dylib)

# Find LLVM and MLIR packages
find_package(LLVM REQUIRED CONFIG)
find_package(MLIR REQUIRED CONFIG)

# Include directories
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(include)  # Ensure 'include' folder for headers
include_directories(lib)      # Ensure 'lib' folder for implementation files

# Link directories
link_directories(${LLVM_LIBRARY_DIRS})
link_directories(${MLIR_LIBRARY_DIRS})
link_directories(/usr/local/Cellar/llvm/19.1.4/lib/c++)

# Collect source files in lib/ directory
file(GLOB_RECURSE LIB_SOURCES lib/*.cpp)

# Add the executable target
add_executable(VecVecOp ${LIB_SOURCES})

# Link libraries
target_link_libraries(VecVecOp PRIVATE
  MLIRIR
  MLIRSupport
  MLIRAnalysis
  MLIRExecutionEngine
  ${LLVM_LIBS}
  /usr/local/Cellar/llvm/19.1.4/lib/c++/libc++.dylib
  /usr/local/Cellar/llvm/19.1.4/lib/c++/libc++abi.dylib
)

# Specify LLVM and MLIR definitions
list(APPEND CMAKE_MODULE_PATH "${LLVM_DIR}")
list(APPEND CMAKE_MODULE_PATH "${MLIR_DIR}")

# Include LLVM and MLIR in the build
llvm_map_components_to_libnames(LLVM_LIBS
  Core
  Support
  ExecutionEngine
)

# Installation (optional)
install(TARGETS VecVecOp
  RUNTIME DESTINATION bin
)

# Enable testing (optional)
enable_testing()
add_test(NAME VecVecOpTest
  COMMAND VecVecOp ${CMAKE_SOURCE_DIR}/test/example.mlir
)

