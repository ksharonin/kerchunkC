/**
 * @file iter_chunk.h
 * @brief abstract multi-index chunk interaction from main, handle list wrangling
 * @version 0.1
 */

#include <iostream>
#include <string.h>
#include <bit>
#include <cstdint>
#include <vector>
#include <variant>
#include <cstring>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>

# ifndef ITER_CHUNK_META
# define ITER_CHUNK_META

/**
 * @brief iterate through given chunk list and display start/end indices
 * and bucket name to verify object origin
 * 
 * @param chunk_indices 
 * @param json_path 
 */
std::tuple< std::vector<int>, 
            std::vector<int>, 
            std::vector<const 
            Aws::String>, 
            std::vector<const Aws::String>
          > iterChunkMetaData(std::vector<int> chunk_indices, std::string json_path) {
    
    std::string s3Path;
    int startByte;
    int numBytes;
    std::string bucketName_x;
    std::string objectName_x;

    // output vecs - correspond with indices
    std::vector<int> all_start_bytes;
    std::vector<int> all_num_bytes;
    std::vector<const Aws::String> all_buckets;
    std::vector<const Aws::String> all_objects;

    for (int i: chunk_indices) {
        bucketName_x = "";
        objectName_x = "";
        std::tie(s3Path, startByte, numBytes) = readChunkMeta(json_path, i);
        extractBucketAndKey(s3Path, bucketName_x, objectName_x);
        const Aws::String bucketName(bucketName_x.c_str());
        const Aws::String objectName(objectName_x.c_str());

        all_start_bytes.push_back(startByte);
        all_num_bytes.push_back(numBytes);
        all_buckets.push_back(bucketName);
        all_objects.push_back(objectName);

        std::cout << "startByte of chunk index: " << i << " is: " << startByte << std::endl;
        std::cout << "numBytes of chunk index: " << i << " is: " << numBytes << std::endl;
        std::cout << "bucketName of: " << i << " is: " << bucketName_x << std::endl;
        std::cout << "objectName of: " << i << "is: " << objectName_x << std::endl;
    }

    return std::make_tuple(all_start_bytes, all_num_bytes, all_buckets, all_objects);

}

#endif

void  iterChunkRead(std::vector<int> hardcoded_chunk_indices,
                    std::vector<int> all_start_bytes,
                    std::vector<int> all_num_bytes,
                    std::vector<const Aws::String> all_buckets,
                    std::vector<const Aws::String> all_objects,
                    Aws::S3::S3Client client,
                    std::string compressor_id,
                    std::string filter_id, 
                    std::vector<int> chunks,
                    std::string order,
                    std::string dtype,
                    std::vector<int> hardcoded_test_visit
                       ) {
    // dispatch KerchunkRead with corresonding metadata
    for (int i = 0; i < hardcoded_chunk_indices.size(); i++) {
        // extract with corresponding index in position
        int startByte = all_start_bytes[i];
        int numBytes = all_num_bytes[i];
        const Aws::String bucketName = all_buckets[i];
        const Aws::String objectName = all_objects[i];

        std::cout << std::endl;
        std::cout << "Converting binary stream to decoded/decompressed chunks for chunk at index: " << i << "..." << std::endl;
        primaryKerchunkRead(bucketName, 
                            objectName, 
                            client, 
                            startByte, 
                            numBytes, 
                            compressor_id.c_str(),
                            filter_id.c_str(),
                            chunks,
                            order[0],
                            dtype,
                            hardcoded_test_visit
                            );

        std::cout << std::endl;
        std::cout << "Done for index!" << std::endl;

    }

    if (TIMER_S3_READ_ON) {
        std::cout << std::endl; 
        std::cout << "VS. Single Accumlated Chunk Request" << std::endl; 
        int sum_of_numbytes = std::accumulate(all_num_bytes.begin(), all_num_bytes.end(), 0);
        primaryKerchunkRead(all_buckets[0], 
                        all_objects[0], 
                        client, 
                        all_start_bytes[0], 
                        sum_of_numbytes, 
                        compressor_id.c_str(),
                        filter_id.c_str(),
                        chunks,
                        order[0],
                        dtype,
                        hardcoded_test_visit
                        );
    }

}
