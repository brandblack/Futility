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

# Include any dependencies generated for this target.
include examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/depend.make

# Include the progress variables for this target.
include examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/progress.make

# Include the compile flags for this target's objects.
include examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/flags.make

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/flags.make
examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o: ../examples/exampleTAU_Stubs/exampleTAU_Stubs.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nfherrin/research/MPACT/Futility/Futilitybuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o"
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs && /home/nfherrin/research/env/gcc-5.4.0/toolset/mpich-3.2.1/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/nfherrin/research/MPACT/Futility/examples/exampleTAU_Stubs/exampleTAU_Stubs.f90 -o CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.i"
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs && /home/nfherrin/research/env/gcc-5.4.0/toolset/mpich-3.2.1/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/nfherrin/research/MPACT/Futility/examples/exampleTAU_Stubs/exampleTAU_Stubs.f90 > CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.i

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.s"
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs && /home/nfherrin/research/env/gcc-5.4.0/toolset/mpich-3.2.1/bin/mpif90 $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/nfherrin/research/MPACT/Futility/examples/exampleTAU_Stubs/exampleTAU_Stubs.f90 -o CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.s

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.requires:

.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.requires

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.provides: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.requires
	$(MAKE) -f examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/build.make examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.provides.build
.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.provides

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.provides.build: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o


# Object files for target Futility_exampleTAU_Stubs
Futility_exampleTAU_Stubs_OBJECTS = \
"CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o"

# External object files for target Futility_exampleTAU_Stubs
Futility_exampleTAU_Stubs_EXTERNAL_OBJECTS =

examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o
examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/build.make
examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: src/libUtils.a
examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: src/trilinos_interfaces/libTrilinosUtils.a
examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: src/libCUtils.a
examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nfherrin/research/MPACT/Futility/Futilitybuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking Fortran executable Futility_exampleTAU_Stubs.exe"
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Futility_exampleTAU_Stubs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/build: examples/exampleTAU_Stubs/Futility_exampleTAU_Stubs.exe

.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/build

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/requires: examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/exampleTAU_Stubs.f90.o.requires

.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/requires

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/clean:
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs && $(CMAKE_COMMAND) -P CMakeFiles/Futility_exampleTAU_Stubs.dir/cmake_clean.cmake
.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/clean

examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/depend:
	cd /home/nfherrin/research/MPACT/Futility/Futilitybuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nfherrin/research/MPACT/Futility /home/nfherrin/research/MPACT/Futility/examples/exampleTAU_Stubs /home/nfherrin/research/MPACT/Futility/Futilitybuild /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs /home/nfherrin/research/MPACT/Futility/Futilitybuild/examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/exampleTAU_Stubs/CMakeFiles/Futility_exampleTAU_Stubs.dir/depend

