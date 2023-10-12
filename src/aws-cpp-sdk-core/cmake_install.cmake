# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/libaws-cpp-sdk-core.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-core.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-core.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-core.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-core.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/aws-cpp-sdk-core.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonSerializableWebServiceRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonStreamingWebServiceRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonWebServiceRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/AmazonWebServiceResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Aws.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Core_EXPORTS.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Globals.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/NoResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Region.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/SDKConfig.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/Version.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/VersionConfig.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/auth" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSAuthSigner.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSAuthSignerProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSBearerToken.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSCredentials.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSCredentialsProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/AWSCredentialsProviderChain.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/SSOCredentialsProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/STSCredentialsProvider.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/auth/signer" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthBearerSigner.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthEventStreamV4Signer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthSignerBase.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthSignerCommon.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthSignerHelper.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSAuthV4Signer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer/AWSNullSigner.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/auth/signer-provider" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer-provider/AWSAuthSignerProviderBase.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer-provider/BearerTokenAuthSignerProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/signer-provider/DefaultAuthSignerProvider.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/auth/bearer-token-provider" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/bearer-token-provider/AWSBearerTokenProviderBase.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/bearer-token-provider/AWSBearerTokenProviderChainBase.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/bearer-token-provider/DefaultBearerTokenProviderChain.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/bearer-token-provider/SSOBearerTokenProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/auth/bearer-token-provider/StaticBearerTokenProvider.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/client" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSAsyncOperationTemplate.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSClient.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSClientAsyncCRTP.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSError.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSErrorMarshaller.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSJsonClient.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSUrlPresigner.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AWSXmlClient.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AdaptiveRetryStrategy.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/AsyncCallerContext.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/ClientConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/CoreErrors.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/DefaultRetryStrategy.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/GenericClientConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/RequestCompression.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/RetryStrategy.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/client/SpecifiedRetryableErrorsRetryStrategy.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/internal" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/internal/AWSHttpResourceClient.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/net" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/net/Net.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/net/SimpleUDP.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/http" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/HttpClient.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/HttpClientFactory.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/HttpRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/HttpResponse.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/HttpTypes.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/Scheme.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/URI.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/Version.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/http/standard" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/standard/StandardHttpRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/standard/StandardHttpResponse.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/config" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/AWSConfigFileProfileConfigLoader.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/AWSProfileConfig.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/AWSProfileConfigLoader.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/AWSProfileConfigLoaderBase.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/ConfigAndCredentialsCacheManager.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/EC2InstanceProfileConfigLoader.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/config/defaults" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/config/defaults/ClientConfigurationDefaults.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/endpoint" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/AWSEndpoint.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/AWSPartitions.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/BuiltInParameters.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/ClientContextParameters.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/DefaultEndpointProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/EndpointParameter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/EndpointProviderBase.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/endpoint/internal" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/endpoint/internal/AWSEndpointAttribute.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/monitoring" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/CoreMetrics.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/DefaultMonitoring.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/HttpClientMetrics.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/MonitoringFactory.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/MonitoringInterface.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/monitoring/MonitoringManager.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/platform" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/Android.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/Environment.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/FileSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/OSVersionInfo.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/Platform.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/Security.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/platform/Time.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/ARN.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/Array.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/Cache.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/ConcurrentCache.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/DNS.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/DateTime.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/Document.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/EnumParseOverflowContainer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/FileSystemUtils.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/GetTheLights.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/HashingUtils.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/Outcome.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/RAIICounter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/ResourceManager.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/StringUtils.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/UUID.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/UnreferencedParam.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/event" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventDecoderStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventEncoderStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventHeader.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventMessage.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStreamBuf.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStreamDecoder.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStreamEncoder.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStreamErrors.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/event/EventStreamHandler.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/base64" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/base64/Base64.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/crypto" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/CRC32.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Cipher.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/ContentCryptoMaterial.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/ContentCryptoScheme.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/CryptoBuf.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/CryptoStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/EncryptionMaterials.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Factories.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/HMAC.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Hash.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/HashResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/KeyWrapAlgorithm.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/MD5.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/SecureRandom.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Sha1.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Sha256.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/Sha256HMAC.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/json" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/json/JsonSerializer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/xml" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/xml/XmlSerializer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/logging" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/AWSLogging.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/CRTLogSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/CRTLogging.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/ConsoleLogSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/DefaultCRTLogSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/DefaultLogSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/ErrorMacros.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/FormattedLogSystem.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/LogLevel.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/LogMacros.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/LogSystemInterface.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/logging/NullLogSystem.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/memory" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/AWSMemory.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/MemorySystemInterface.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/component-registry" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/component-registry/ComponentRegistry.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/memory/stl" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSAllocator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSArray.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSDeque.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSList.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSMap.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSMultiMap.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSQueue.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSSet.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSStack.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSStreamFwd.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSString.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSStringStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/AWSVector.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/memory/stl/SimpleStringStream.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/ratelimiter" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/ratelimiter/DefaultRateLimiter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/ratelimiter/RateLimiterInterface.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/stream" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/stream/ConcurrentStreamBuf.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/stream/PreallocatedStreamBuf.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/stream/ResponseStream.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/stream/SimpleStreamBuf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/threading" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/threading/Executor.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/threading/ReaderWriterLock.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/threading/Semaphore.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/threading/ThreadTask.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/external/cjson" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/external/cjson/cJSON.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/external/tinyxml2" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/external/tinyxml2/tinyxml2.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/smithy" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/Smithy_EXPORTS.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/smithy/tracing" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/Gauge.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/Histogram.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/Meter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/MeterProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/MonotonicCounter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/NoopMeterProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/NoopTelemetryProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/NoopTracerProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/TelemetryProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/TraceSpan.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/Tracer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/TracerProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/TracingUtils.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/smithy/tracing/UpDownCounter.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/http/curl" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/curl/CurlHandleContainer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/http/curl/CurlHttpClient.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/core/utils/crypto/commoncrypto" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/src/aws-cpp-sdk-core/include/aws/core/utils/crypto/commoncrypto/CryptoImpl.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core/aws-cpp-sdk-core-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core/aws-cpp-sdk-core-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/CMakeFiles/Export/fc6f4b3ef2d33a80c76629402df5ad57/aws-cpp-sdk-core-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core/aws-cpp-sdk-core-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core/aws-cpp-sdk-core-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/CMakeFiles/Export/fc6f4b3ef2d33a80c76629402df5ad57/aws-cpp-sdk-core-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/CMakeFiles/Export/fc6f4b3ef2d33a80c76629402df5ad57/aws-cpp-sdk-core-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-core" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/aws-cpp-sdk-core-config.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/src/aws-cpp-sdk-core/aws-cpp-sdk-core-config-version.cmake"
    )
endif()

