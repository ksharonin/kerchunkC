# Install script for directory: /Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/libaws-cpp-sdk-s3.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-s3.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-s3.dylib")
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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-s3.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaws-cpp-sdk-s3.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/aws-cpp-sdk-s3.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/s3" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3Client.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3ClientConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3EndpointProvider.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3EndpointRules.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3ErrorMarshaller.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3Errors.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3Request.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3ServiceClientModel.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/S3_EXPORTS.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aws/s3/model" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AbortIncompleteMultipartUpload.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AbortMultipartUploadRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AbortMultipartUploadResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AccelerateConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AccessControlPolicy.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AccessControlTranslation.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsAndOperator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsExportDestination.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsS3BucketDestination.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/AnalyticsS3ExportFileFormat.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ArchiveStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Bucket.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketAccelerateStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketCannedACL.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketLifecycleConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketLocationConstraint.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketLoggingStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketLogsPermission.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/BucketVersioningStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CORSConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CORSRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CSVInput.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CSVOutput.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Checksum.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ChecksumAlgorithm.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ChecksumMode.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CloudFunctionConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CommonPrefix.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CompleteMultipartUploadRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CompleteMultipartUploadResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CompletedMultipartUpload.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CompletedPart.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CompressionType.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Condition.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CopyObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CopyObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CopyObjectResultDetails.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CopyPartResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CreateBucketConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CreateBucketRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CreateBucketResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CreateMultipartUploadRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/CreateMultipartUploadResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DefaultRetention.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Delete.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketAnalyticsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketCorsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketEncryptionRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketIntelligentTieringConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketInventoryConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketLifecycleRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketMetricsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketOwnershipControlsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketPolicyRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketReplicationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteBucketWebsiteRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteMarkerEntry.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteMarkerReplication.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteMarkerReplicationStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectTaggingResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeleteObjectsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeletePublicAccessBlockRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/DeletedObject.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Destination.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/EncodingType.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Encryption.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/EncryptionConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Error.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ErrorDocument.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Event.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/EventBridgeConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ExistingObjectReplication.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ExistingObjectReplicationStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ExpirationStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ExpressionType.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/FileHeaderInfo.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/FilterRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/FilterRuleName.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAccelerateConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAccelerateConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAclRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAclResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAnalyticsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketAnalyticsConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketCorsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketCorsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketEncryptionRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketEncryptionResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketIntelligentTieringConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketIntelligentTieringConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketInventoryConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketInventoryConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLifecycleConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLifecycleConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLocationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLocationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLoggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketLoggingResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketMetricsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketMetricsConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketNotificationConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketNotificationConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketOwnershipControlsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketOwnershipControlsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketPolicyRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketPolicyResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketPolicyStatusRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketPolicyStatusResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketReplicationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketReplicationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketRequestPaymentRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketRequestPaymentResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketTaggingResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketVersioningRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketVersioningResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketWebsiteRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetBucketWebsiteResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectAclRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectAclResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectAttributesParts.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectAttributesRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectAttributesResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectLegalHoldRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectLegalHoldResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectLockConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectLockConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectRetentionRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectRetentionResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectTaggingResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectTorrentRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetObjectTorrentResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetPublicAccessBlockRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GetPublicAccessBlockResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/GlacierJobParameters.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Grant.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Grantee.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/HeadBucketRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/HeadObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/HeadObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IndexDocument.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Initiator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InputSerialization.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IntelligentTieringAccessTier.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IntelligentTieringAndOperator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IntelligentTieringConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IntelligentTieringFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/IntelligentTieringStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InvalidObjectState.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryDestination.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryEncryption.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryFormat.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryFrequency.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryIncludedObjectVersions.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryOptionalField.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventoryS3BucketDestination.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/InventorySchedule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/JSONInput.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/JSONOutput.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/JSONType.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LambdaFunctionConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LifecycleConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LifecycleExpiration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LifecycleRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LifecycleRuleAndOperator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LifecycleRuleFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketAnalyticsConfigurationsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketAnalyticsConfigurationsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketIntelligentTieringConfigurationsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketIntelligentTieringConfigurationsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketInventoryConfigurationsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketInventoryConfigurationsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketMetricsConfigurationsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketMetricsConfigurationsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListBucketsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListMultipartUploadsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListMultipartUploadsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectVersionsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectVersionsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectsV2Request.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListObjectsV2Result.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListPartsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ListPartsResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/LoggingEnabled.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MFADelete.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MFADeleteStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetadataDirective.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetadataEntry.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Metrics.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetricsAndOperator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetricsConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetricsFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MetricsStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/MultipartUpload.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/NoncurrentVersionExpiration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/NoncurrentVersionTransition.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/NotificationConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/NotificationConfigurationDeprecated.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/NotificationConfigurationFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Object.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectAttributes.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectCannedACL.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectIdentifier.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockEnabled.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockLegalHold.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockLegalHoldStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockMode.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockRetention.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockRetentionMode.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectLockRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectOwnership.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectPart.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectStorageClass.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectVersion.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ObjectVersionStorageClass.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OptionalObjectAttributes.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OutputLocation.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OutputSerialization.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Owner.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OwnerOverride.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OwnershipControls.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/OwnershipControlsRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ParquetInput.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Part.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Payer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Permission.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PolicyStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Progress.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ProgressEvent.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Protocol.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PublicAccessBlockConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketAccelerateConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketAclRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketAnalyticsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketCorsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketEncryptionRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketIntelligentTieringConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketInventoryConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketLifecycleConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketLoggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketMetricsConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketNotificationConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketOwnershipControlsRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketPolicyRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketReplicationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketRequestPaymentRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketVersioningRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutBucketWebsiteRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectAclRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectAclResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectLegalHoldRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectLegalHoldResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectLockConfigurationRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectLockConfigurationResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectRetentionRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectRetentionResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectTaggingRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutObjectTaggingResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/PutPublicAccessBlockRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/QueueConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/QueueConfigurationDeprecated.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/QuoteFields.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RecordsEvent.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Redirect.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RedirectAllRequestsTo.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicaModifications.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicaModificationsStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationRuleAndOperator.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationRuleFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationRuleStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationTime.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationTimeStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ReplicationTimeValue.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RequestCharged.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RequestPayer.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RequestPaymentConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RequestProgress.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RestoreObjectRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RestoreObjectResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RestoreRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RestoreRequestType.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RestoreStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/RoutingRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Rule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/S3KeyFilter.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/S3Location.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SSEKMS.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SSES3.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ScanRange.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SelectObjectContentHandler.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SelectObjectContentRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SelectParameters.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ServerSideEncryption.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ServerSideEncryptionByDefault.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ServerSideEncryptionConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/ServerSideEncryptionRule.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SourceSelectionCriteria.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SseKmsEncryptedObjects.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/SseKmsEncryptedObjectsStatus.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Stats.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/StatsEvent.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/StorageClass.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/StorageClassAnalysis.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/StorageClassAnalysisDataExport.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/StorageClassAnalysisSchemaVersion.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Tag.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Tagging.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/TaggingDirective.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/TargetGrant.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Tier.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Tiering.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/TopicConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/TopicConfigurationDeprecated.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Transition.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/TransitionStorageClass.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/Type.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/UploadPartCopyRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/UploadPartCopyResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/UploadPartRequest.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/UploadPartResult.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/VersioningConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/WebsiteConfiguration.h"
    "/Users/katrinasharonin/Downloads/kerchunkC/aws-sdk-cpp/generated/src/aws-cpp-sdk-s3/include/aws/s3/model/WriteGetObjectResponseRequest.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3/aws-cpp-sdk-s3-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3/aws-cpp-sdk-s3-targets.cmake"
         "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/CMakeFiles/Export/772549d45dee698542912080ccbe0609/aws-cpp-sdk-s3-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3/aws-cpp-sdk-s3-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3/aws-cpp-sdk-s3-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/CMakeFiles/Export/772549d45dee698542912080ccbe0609/aws-cpp-sdk-s3-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3" TYPE FILE FILES "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/CMakeFiles/Export/772549d45dee698542912080ccbe0609/aws-cpp-sdk-s3-targets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/aws-cpp-sdk-s3" TYPE FILE FILES
    "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/aws-cpp-sdk-s3-config.cmake"
    "/Users/katrinasharonin/Downloads/kerchunkC/generated/src/aws-cpp-sdk-s3/aws-cpp-sdk-s3-config-version.cmake"
    )
endif()

