# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/libtesting-resources.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtesting-resources.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtesting-resources.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-mqtt"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/lib"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-s3"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-auth"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-http"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-io"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-compression"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-cal"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-sdkutils"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-checksums"
      -delete_rpath "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common"
      -add_rpath "$ORIGIN"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtesting-resources.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtesting-resources.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/testing-resources.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/AwsCppSdkGTestSuite.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/AwsTestHelpers.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/MemoryTesting.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/ProxyConfig.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/TestingEnvironment.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/Testing_EXPORTS.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/external/gtest" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-assertion-result.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-aws-helper.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-death-test.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-matchers.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-message.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-param-test.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-printers.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-spi.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-test-part.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest-typed-test.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest_pred_impl.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/gtest_prod.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/external/gtest/internal" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-death-test-internal.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-filepath.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-internal.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-param-util.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-port-arch.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-port.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-string.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/gtest-type-util.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/external/gtest/internal/custom" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/custom/gtest-port.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/custom/gtest-printers.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/external/gtest/internal/custom/gtest.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/platform" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/platform/PlatformTesting.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/mocks/aws/auth" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/aws/auth/MockAWSHttpResourceClient.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/mocks/aws/client" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/aws/client/MockAWSClient.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/mocks/event" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/event/MockEventStreamDecoder.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/event/MockEventStreamHandler.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/mocks/http" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/http/MockHttpClient.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing/mocks/monitoring" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/tests/testing-resources/include/aws/testing/mocks/monitoring/TestingMonitoring.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources/testing-resources-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources/testing-resources-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/CMakeFiles/Export/16337948be2f6199048dea998d28187b/testing-resources-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources/testing-resources-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources/testing-resources-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/CMakeFiles/Export/16337948be2f6199048dea998d28187b/testing-resources-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/CMakeFiles/Export/16337948be2f6199048dea998d28187b/testing-resources-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/testing-resources" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/testing-resources-config.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/tests/testing-resources/testing-resources-config-version.cmake"
    )
endif()

