# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/nfherrin/research/env/gcc-5.4.0/common_tools/cmake-3.10.2/bin/cmake

# The command to remove a file.
RM = /home/nfherrin/research/env/gcc-5.4.0/common_tools/cmake-3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nfherrin/research/MPACT/Futility

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nfherrin/research/MPACT/Futility/Futilitybuild

# Utility rule file for ContinuousBuild.

# Include the progress variables for this target.
include CMakeFiles/ContinuousBuild.dir/progress.make

CMakeFiles/ContinuousBuild:
	/home/nfherrin/research/env/gcc-5.4.0/common_tools/cmake-3.10.2/bin/ctest -D ContinuousBuild

ContinuousBuild: CMakeFiles/ContinuousBuild
ContinuousBuild: CMakeFiles/ContinuousBuild.dir/build.make

.PHONY : ContinuousBuild

# Rule to build all files generated by this target.
CMakeFiles/ContinuousBuild.dir/build: ContinuousBuild

.PHONY : CMakeFiles/ContinuousBuild.dir/build

CMakeFiles/ContinuousBuild.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ContinuousBuild.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ContinuousBuild.dir/clean

CMakeFiles/ContinuousBuild.dir/depend:
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nfherrin/research/MPACT/Futility /home/nfherrin/research/MPACT/Futility /home/nfherrin/research/MPACT/Futility/Futilitybuild /home/nfherrin/research/MPACT/Futility/Futilitybuild /home/nfherrin/research/MPACT/Futility/Futilitybuild/CMakeFiles/ContinuousBuild.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ContinuousBuild.dir/depend

