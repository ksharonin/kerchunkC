# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/katrinasharonin/Downloads/kerchunkC

# Include any dependencies generated for this target.
include crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/compiler_depend.make

# Include the progress variables for this target.
include crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/progress.make

# Include the compile flags for this target's objects.
include crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/flags.make

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/flags.make
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/arm/crc32c_arm.c
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/katrinasharonin/Downloads/kerchunkC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -march=armv8-a+crc -MD -MT crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o -MF CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o.d -o CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o -c /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/arm/crc32c_arm.c

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.i"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -march=armv8-a+crc -E /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/arm/crc32c_arm.c > CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.i

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.s"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -march=armv8-a+crc -S /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/arm/crc32c_arm.c -o CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.s

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/flags.make
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc.c
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/katrinasharonin/Downloads/kerchunkC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o -MF CMakeFiles/aws-checksums.dir/source/crc.c.o.d -o CMakeFiles/aws-checksums.dir/source/crc.c.o -c /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc.c

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/aws-checksums.dir/source/crc.c.i"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc.c > CMakeFiles/aws-checksums.dir/source/crc.c.i

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/aws-checksums.dir/source/crc.c.s"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc.c -o CMakeFiles/aws-checksums.dir/source/crc.c.s

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/flags.make
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc_sw.c
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/katrinasharonin/Downloads/kerchunkC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o -MF CMakeFiles/aws-checksums.dir/source/crc_sw.c.o.d -o CMakeFiles/aws-checksums.dir/source/crc_sw.c.o -c /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc_sw.c

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/aws-checksums.dir/source/crc_sw.c.i"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc_sw.c > CMakeFiles/aws-checksums.dir/source/crc_sw.c.i

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/aws-checksums.dir/source/crc_sw.c.s"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums/source/crc_sw.c -o CMakeFiles/aws-checksums.dir/source/crc_sw.c.s

# Object files for target aws-checksums
aws__checksums_OBJECTS = \
"CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o" \
"CMakeFiles/aws-checksums.dir/source/crc.c.o" \
"CMakeFiles/aws-checksums.dir/source/crc_sw.c.o"

# External object files for target aws-checksums
aws__checksums_EXTERNAL_OBJECTS =

crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/arm/crc32c_arm.c.o
crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc.c.o
crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/source/crc_sw.c.o
crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/build.make
crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-c-common/libaws-c-common.1.0.0.dylib
crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib: crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/katrinasharonin/Downloads/kerchunkC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C shared library libaws-checksums.dylib"
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aws-checksums.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && $(CMAKE_COMMAND) -E cmake_symlink_library libaws-checksums.1.0.0.dylib libaws-checksums.1.0.0.dylib libaws-checksums.dylib

crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.dylib: crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.1.0.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.dylib

# Rule to build all files generated by this target.
crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/build: crt/aws-crt-cpp/crt/aws-checksums/libaws-checksums.dylib
.PHONY : crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/build

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/clean:
	cd /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums && $(CMAKE_COMMAND) -P CMakeFiles/aws-checksums.dir/cmake_clean.cmake
.PHONY : crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/clean

crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/depend:
	cd /Users/katrinasharonin/Downloads/kerchunkC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-checksums /Users/katrinasharonin/Downloads/kerchunkC /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums /Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : crt/aws-crt-cpp/crt/aws-checksums/CMakeFiles/aws-checksums.dir/depend

