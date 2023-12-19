/**
 * @file print_helpers.h
 * @brief methods to print outputs during program
 * @note controlled with global verbose print on
 * @version 0.1
 */

#include <iostream>
#include <string.h>
#include <bit>
#include <cstdint>
#include <vector>
#include <variant>
#include <cstring>
// #include <aws/core/Aws.h>
// #include <aws/s3/S3Client.h>
// #include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <zlib.h>
#include "custom_structs.h"
#include "config.h"

#ifndef PRINT_S3BYTES_BINARY
#define PRINT_S3BYTES_BINARY
/**
 * @brief print stream bytes in binary from single specified s3 object, assumes configd/set client
 * expects given byterange/wont calculate on the fly
 * @param bucketName, objectName, bytesRange, client
 * @return void
 */
// void _debugGetByteS3Stream(Aws::String bucketName, 
//                     Aws::String objectName, 
//                     char bytesRange[],
//                     Aws::S3::S3Client client) {

//     if (!DEBUG_PRINT_ON) {
//         return;
//     }

//     Aws::S3::Model::GetObjectRequest request;

//     // set bucket + key
//     request.SetBucket(bucketName);
//     request.SetKey(objectName);

//     // read bytes from req
//     request.WithRange(bytesRange);

//     auto getObjectOutcome = client.GetObject(request);

//     if (!getObjectOutcome.IsSuccess()) {
//         const Aws::S3::S3Error &err = getObjectOutcome.GetError();
//         std::cerr << "Error: GetObject: " <<
//                 err.GetExceptionName() << ": " << err.GetMessage() << std::endl;
//         throw std::runtime_error("");
//     }
//     else {
//         Aws::IOStream& byteStream = getObjectOutcome.GetResultWithOwnership().GetBody();
//         std::cout << std::endl;
//         std::cout << "Successfully retrieved '" << objectName << "' from '"
//                 << bucketName << "'." << std::endl;
//         std::cout << std::endl;
//         // w buffer write to console
//         char byte;
//         while (byteStream.get(byte)) {
//             std::bitset<8> binary(byte);
//             std::cout << binary << " ";
//         }
//         std::cout << std::endl;

//         // return byteStream;
//         return;
//     }

// }

#endif

#ifndef PRINT_INTARR_FINAL
#define PRINT_INTARR_FINAL

void _debugPrintIntArr(std::vector<int16_t> input) {
    if (!DEBUG_PRINT_ON) {
        return;
    }
    for (const auto& element : input) {
        std::cout << element << " ";
    }
    std::cout << std::endl;
}

#endif

#ifndef PRINT_AFTER_DECOMP
#define PRINT_AFTER_DECOMP

void _debugPrintAfterDecompression(uLong startIndex, uLong endIndex, DecompressionResult *dresult){
    if (!DEBUG_PRINT_ON) {
        return;
    }
    std::cout << std::endl;
    std::cout << "After decompression, print bytes from index " << static_cast<unsigned long>(startIndex) << " to " << static_cast<unsigned long>(endIndex) << " as binary bytes..." << std::endl;
    std::cout << std::endl;
    uLong rangeToPrint = endIndex - startIndex + 1; 
    for (uLong i = startIndex; i <= endIndex; i++) {
        Bytef byte = dresult->buffer[i];
        for (int bit = 7; bit >= 0; bit--) {
            std::cout << ((byte >> bit) & 1); 
        }
        std::cout << " "; 
    }
    std::cout << std::endl;
}

#endif


#ifndef PRINT_AFTER_UNSHUFFLE
#define PRINT_AFTER_UNSHUFFLE

void _debugPrintAfterUnshuffle(uLong startIndex, uLong endIndex, unsigned char* dest) {
    if (!DEBUG_PRINT_ON) {
        return;
    }
    std::cout << std::endl;
    std::cout << "After Shuffle, print bytes from index " << static_cast<unsigned long>(startIndex) << " to " << static_cast<unsigned long>(endIndex) << " as binary bytes..." << std::endl;
    std::cout << std::endl;

    // b print 
    for (int i = startIndex; i <= endIndex; i++) {
        for (int j = 7; j >= 0; j--) {
            char bit = (dest[i] & (1 << j)) ? '1' : '0';
            std::cout << bit;
        }
            std::cout << ' ';
    }
    std::cout << std::endl;
}

#endif