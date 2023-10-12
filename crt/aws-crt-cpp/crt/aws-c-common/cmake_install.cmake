# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/allocator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/array_list.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/array_list.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/assert.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics_fallback.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics_gnu.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics_gnu_old.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/atomics_msvc.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/byte_buf.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/byte_order.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/byte_order.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/cache.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/clock.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/clock.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/command_line_parser.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/common.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/condition_variable.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/cpuid.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/date_time.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/device_random.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/encoding.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/encoding.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/environment.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/error.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/error.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/exports.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/fifo_cache.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/hash_table.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/json.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/lifo_cache.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/linked_hash_table.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/linked_list.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/linked_list.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/log_channel.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/log_formatter.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/log_writer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/logging.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/lru_cache.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/macros.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.cbmc.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.fallback.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.gcc_arm64_asm.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.gcc_builtin.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.gcc_overflow.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.gcc_x64_asm.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/math.msvc.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/mutex.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/package.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/platform.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/predicates.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/priority_queue.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/process.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/promise.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/ref_count.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/ring_buffer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/ring_buffer.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/rw_lock.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/statistics.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/stdbool.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/stdint.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/string.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/string.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/system_info.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/task_scheduler.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/thread.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/thread_scheduler.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/time.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/uri.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/uuid.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/xml_parser.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/zero.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/zero.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common/posix" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/posix/common.inl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/generated/include/aws/common/config.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/testing" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/testing/aws_test_harness.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/common/external" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/include/aws/common/external/ittnotify.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/libaws-c-common.1.0.0.dylib"
    "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/libaws-c-common.1.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-common.1.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-c-common.1.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "$ORIGIN"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/libaws-c-common.dylib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared/aws-c-common-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared/aws-c-common-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/CMakeFiles/Export/76145af4dc32cc6d64d6fb9960c38039/aws-c-common-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared/aws-c-common-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared/aws-c-common-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/CMakeFiles/Export/76145af4dc32cc6d64d6fb9960c38039/aws-c-common-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake/shared" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/CMakeFiles/Export/76145af4dc32cc6d64d6fb9960c38039/aws-c-common-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/aws-c-common/cmake" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/crt/aws-crt-cpp/crt/aws-c-common/aws-c-common-config.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsCFlags.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsCheckHeaders.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsSharedLibSetup.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsTestHarness.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsLibFuzzer.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsSanitizers.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsSIMD.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsFindPackage.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsFeatureTests.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/crt/aws-crt-cpp/crt/aws-c-common/cmake/AwsCRuntime.cmake"
    )
endif()

