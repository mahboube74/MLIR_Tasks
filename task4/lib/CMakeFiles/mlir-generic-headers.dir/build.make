# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib

# Utility rule file for mlir-generic-headers.

# Include any custom commands dependencies for this target.
include CMakeFiles/mlir-generic-headers.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mlir-generic-headers.dir/progress.make

CMakeFiles/mlir-generic-headers.dir/codegen:
.PHONY : CMakeFiles/mlir-generic-headers.dir/codegen

mlir-generic-headers: CMakeFiles/mlir-generic-headers.dir/build.make
.PHONY : mlir-generic-headers

# Rule to build all files generated by this target.
CMakeFiles/mlir-generic-headers.dir/build: mlir-generic-headers
.PHONY : CMakeFiles/mlir-generic-headers.dir/build

CMakeFiles/mlir-generic-headers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mlir-generic-headers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mlir-generic-headers.dir/clean

CMakeFiles/mlir-generic-headers.dir/depend:
	cd /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/mlir-generic-headers.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/mlir-generic-headers.dir/depend

