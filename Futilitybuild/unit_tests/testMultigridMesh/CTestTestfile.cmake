# CMake generated Testfile for 
# Source directory: /home/nfherrin/research/MPACT/Futility/unit_tests/testMultigridMesh
# Build directory: /home/nfherrin/research/MPACT/Futility/Futilitybuild/unit_tests/testMultigridMesh
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Futility_testMultigridMesh "/home/nfherrin/research/MPACT/Futility/Futilitybuild/unit_tests/testMultigridMesh/Futility_testMultigridMesh.exe")
set_tests_properties(Futility_testMultigridMesh PROPERTIES  FAIL_REGULAR_EXPRESSION "The following Teuchos::RCPNode objects were created" LABELS "Futility" PROCESSORS "1" REQUIRED_FILES "/home/nfherrin/research/MPACT/Futility/Futilitybuild/unit_tests/testMultigridMesh/Futility_testMultigridMesh.exe" TIMEOUT "1500")
