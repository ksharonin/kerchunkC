# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/libaws-c-mqtt.1.0.0.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-mqtt.1.0.0.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-mqtt.1.0.0.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-http"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-io"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-cal"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-compression"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common"
      -add_rpath "$ORIGIN"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-mqtt.1.0.0.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-mqtt.1.0.0.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/libaws-c-mqtt.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/mqtt" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/client.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/exports.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/mqtt.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/mqtt/v5" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/v5/mqtt5_client.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/v5/mqtt5_listener.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/v5/mqtt5_packet_storage.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/v5/mqtt5_types.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/mqtt/private" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-mqtt/include/aws/mqtt/private/mqtt_client_test_helper.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared/aws-c-mqtt-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared/aws-c-mqtt-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/CMakeFiles/Export/38b3788590416226b20920b2346a7ac4/aws-c-mqtt-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared/aws-c-mqtt-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared/aws-c-mqtt-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/CMakeFiles/Export/38b3788590416226b20920b2346a7ac4/aws-c-mqtt-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/CMakeFiles/Export/38b3788590416226b20920b2346a7ac4/aws-c-mqtt-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-mqtt/cmake" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt/aws-c-mqtt-config.cmake")
endif()

