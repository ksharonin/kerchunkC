# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-s3

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/libaws-c-s3.1.0.0.dylib"
    "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/libaws-c-s3.0unstable.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-s3.1.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-s3.0unstable.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-auth"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-sdkutils"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-http"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-io"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-cal"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-compression"
        -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common"
        -add_rpath "$ORIGIN"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/libaws-c-s3.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/s3" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-s3/include/aws/s3/exports.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-s3/include/aws/s3/s3.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-s3/include/aws/s3/s3_client.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-s3/include/aws/s3/s3_endpoint_resolver.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared/aws-c-s3-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared/aws-c-s3-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/CMakeFiles/Export/ddfa4edf93f389e54465ebe5de0df25c/aws-c-s3-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared/aws-c-s3-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared/aws-c-s3-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/CMakeFiles/Export/ddfa4edf93f389e54465ebe5de0df25c/aws-c-s3-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/CMakeFiles/Export/ddfa4edf93f389e54465ebe5de0df25c/aws-c-s3-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-s3/cmake" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3/aws-c-s3-config.cmake")
endif()

