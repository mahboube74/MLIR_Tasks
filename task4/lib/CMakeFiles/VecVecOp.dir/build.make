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

# Include any dependencies generated for this target.
include CMakeFiles/VecVecOp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/VecVecOp.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/VecVecOp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/VecVecOp.dir/flags.make

CMakeFiles/VecVecOp.dir/codegen:
.PHONY : CMakeFiles/VecVecOp.dir/codegen

CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o: CMakeFiles/VecVecOp.dir/flags.make
CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o: CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp
CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o: CMakeFiles/VecVecOp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o -MF CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o.d -o CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o -c /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp

CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.i"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp > CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.i

CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.s"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp -o CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.s

CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o: CMakeFiles/VecVecOp.dir/flags.make
CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o: VecVecDialect.cpp
CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o: CMakeFiles/VecVecOp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o -MF CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o.d -o CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o -c /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecDialect.cpp

CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.i"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecDialect.cpp > CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.i

CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.s"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecDialect.cpp -o CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.s

CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o: CMakeFiles/VecVecOp.dir/flags.make
CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o: VecVecOps.cpp
CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o: CMakeFiles/VecVecOp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o -MF CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o.d -o CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o -c /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecOps.cpp

CMakeFiles/VecVecOp.dir/VecVecOps.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/VecVecOp.dir/VecVecOps.cpp.i"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecOps.cpp > CMakeFiles/VecVecOp.dir/VecVecOps.cpp.i

CMakeFiles/VecVecOp.dir/VecVecOps.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/VecVecOp.dir/VecVecOps.cpp.s"
	/usr/local/opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/VecVecOps.cpp -o CMakeFiles/VecVecOp.dir/VecVecOps.cpp.s

# Object files for target VecVecOp
VecVecOp_OBJECTS = \
"CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o" \
"CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o" \
"CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o"

# External object files for target VecVecOp
VecVecOp_EXTERNAL_OBJECTS =

VecVecOp: CMakeFiles/VecVecOp.dir/CMakeFiles/3.31.2/CompilerIdCXX/CMakeCXXCompilerId.cpp.o
VecVecOp: CMakeFiles/VecVecOp.dir/VecVecDialect.cpp.o
VecVecOp: CMakeFiles/VecVecOp.dir/VecVecOps.cpp.o
VecVecOp: CMakeFiles/VecVecOp.dir/build.make
VecVecOp: /usr/local/opt/llvm/lib/libMLIRIR.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRSupport.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRAnalysis.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRExecutionEngine.a
VecVecOp: /usr/local/Cellar/llvm/19.1.4/lib/c++/libc++.dylib
VecVecOp: /usr/local/Cellar/llvm/19.1.4/lib/c++/libc++abi.dylib
VecVecOp: /usr/local/opt/llvm/lib/libMLIRBuiltinToLLVMIRTranslation.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRExecutionEngineUtils.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRLLVMToLLVMIRTranslation.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIROpenMPToLLVMIRTranslation.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIROpenMPDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIROpenACCMPCommon.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRTargetLLVMIRExport.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRDLTIDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRLLVMIRTransforms.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRFuncDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRTransforms.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRTransformUtils.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRSubsetOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRValueBoundsOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRDestinationStyleOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRRewrite.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRRewritePDL.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRPDLToPDLInterp.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRPDLInterpDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRPDLDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRPass.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRAnalysis.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRInferIntRangeInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRLoopLikeInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRPresburger.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRViewLikeInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRCopyOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRRuntimeVerifiableOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRNVVMDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRLLVMDialect.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRCallInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRControlFlowInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRDataLayoutInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRFunctionInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRInferTypeOpInterface.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRSideEffectInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRMemorySlotInterfaces.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRTranslateLib.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRParser.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRBytecodeReader.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRAsmParser.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRIR.a
VecVecOp: /usr/local/opt/llvm/lib/libMLIRSupport.a
VecVecOp: /usr/local/opt/llvm/lib/libLLVM.dylib
VecVecOp: CMakeFiles/VecVecOp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable VecVecOp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/VecVecOp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/VecVecOp.dir/build: VecVecOp
.PHONY : CMakeFiles/VecVecOp.dir/build

CMakeFiles/VecVecOp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/VecVecOp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/VecVecOp.dir/clean

CMakeFiles/VecVecOp.dir/depend:
	cd /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib /Users/mahboubemahdavi/Documents/compiler/iree/llvm-project/build/project/lib/CMakeFiles/VecVecOp.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/VecVecOp.dir/depend

