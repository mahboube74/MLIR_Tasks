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

# Utility rule file for acc_gen.

# Include any custom commands dependencies for this target.
include CMakeFiles/acc_gen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/acc_gen.dir/progress.make

CMakeFiles/acc_gen.dir/codegen:
.PHONY : CMakeFiles/acc_gen.dir/codegen

acc_gen: CMakeFiles/acc_gen.dir/build.make
.PHONY : acc_gen

# Rule to build all files generated by this target.
CMakeFiles/acc_gen.dir/build: acc_gen
.PHONY : CMakeFiles/acc_gen.dir/build

CMakeFiles/acc_gen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/acc_gen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/acc_gen.dir/clean

CMakeFiles/acc_gen.dir/depend:
	cd /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/acc_gen.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/acc_gen.dir/depend

