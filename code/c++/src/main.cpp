/**
 * @file main.cpp
 * @brief c++ program that takes as input a JSON file, variable name, 
 * and chunk ID that returns the corresponding array with the right dimensions.
 * begin with harcoded values and evolve into dynamic parsing
 * @version 0.1
 */

#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include "kerchunk_read.h"
#include "json_parse.h"


using namespace std;
#define debugPrintON true

#ifndef MAIN_RUN
#define MAIN_RUN

int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    {
        // SEE CONFIG.H FOR INPUTS
        int hardcoded_chunk_index = HARDCODED_CHUNK_INDEX;
        std::vector<int> hardcoded_chunk_indices = HARDCODED_CHUNK_INDICES;
        bool full_read = FULL_READ;
        std::string my_hardcoded_path = HARDCODED_JSON_PATH;
        std::vector<int> hardcoded_test_visit = HARDCODED_TEST_VISIT;

        // BEGIN PROCESSING
        std::cout << std::endl;
        std::cout << "Start JSON base metadata extraction..." << std::endl;

        std::string chunks_interm; 
        std::string compressor_id;
        int level;
        std::string dtype;
        float fill_value;
        int elementsize;
        std::string filter_id;
        std::string order;
        std::string shape;
        int zarr_format;

        std::tie(chunks_interm, 
                compressor_id, 
                level,
                dtype,
                fill_value,
                elementsize,
                filter_id,
                order,
                shape,
                zarr_format) = readJsonMeta(my_hardcoded_path);
                
        std::vector<int> chunks = parseStrToIntVector(chunks_interm);
        std::cout << "JSON base metadata extraction success!" << std::endl;

        // chunk specific meta data
        std::string s3Path;
        int startByte;
        int numBytes;
        std::string bucketName_x;
        std::string objectName_x;
            
        if (full_read) {
            // read all chunks
            throw std::runtime_error("full read not implemented, requires s3 source consistency sanity check");
        } else {
            std::cout << std::endl;
            std::cout << "Start chunk metadata extraction for index: " << hardcoded_chunk_index << "..." << std::endl;

            std::tie(s3Path, startByte, numBytes) = readChunkMeta(my_hardcoded_path, hardcoded_chunk_index);
            extractBucketAndKey(s3Path, bucketName_x, objectName_x);

            std::cout << "JSON chunk metadata extraction success!" << std::endl;
            // std::cout << "ex: demo s3 path result" << std::endl;
            // std::cout << s3Path << std::endl;
        }
        
        const Aws::String bucketName(bucketName_x.c_str());
        const Aws::String objectName(objectName_x.c_str());

        Aws::Client::ClientConfiguration clientConfig;
        Aws::S3::S3Client client(clientConfig); 
        // clientConfig.region = "us-east-1";

        std::cout << std::endl;
        std::cout << "Converting binary stream to decoded/decompressed chunks..." << std::endl;
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
        std::cout << "Done!" << std::endl;

    }
    Aws::ShutdownAPI(options);

    return 0;
}

#endif