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
#include "iter_chunk.h"
#include "index_to_chunk.h"

using namespace std;

#ifndef MAIN_RUN
#define MAIN_RUN

int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    {

        // SEE CONFIG.H FOR INPUTS
        std::vector<int> hardcoded_arr_indices = HARDCODED_ARR_INDICES;
        std::vector<std::vector<int>> hardcoded_chunk_indices = HARDCODED_CHUNK_INDICES;
        // bool full_read = FULL_READ;
        std::string my_hardcoded_path = HARDCODED_JSON_PATH;
        std::vector<int> hardcoded_test_visit = HARDCODED_TEST_VISIT;

        // BEGIN PROCESSING
        std::cout << std::endl;
        std::cout << "Start JSON base metadata extraction..." << std::endl;

        std::vector<int> chunks; 
        std::string compressor_id;
        int level;
        std::string dtype;
        float fill_value;
        int elementsize;
        std::string filter_id;
        std::string order;
        std::vector<int> shape;
        int zarr_format;
        float add_offset;
        float scale_factor;

        std::tie(chunks, 
                compressor_id, 
                level,
                dtype,
                fill_value,
                elementsize,
                filter_id,
                order,
                shape,
                zarr_format,
                add_offset,
                scale_factor
                ) = readJsonMeta(my_hardcoded_path);
                
        std::cout << "JSON base metadata extraction success!" << std::endl;

        // using chunk shape -> get chunk index if not defined and/or confirm
        std::vector<int> test_chunk_fetch = index_to_chunk(hardcoded_arr_indices, chunks);
        // TODO: condition format equating vectors
        // std::cout << test_chunk_fetch[0] << " "<< test_chunk_fetch[1] << " "<< test_chunk_fetch[2] << " "<< test_chunk_fetch[3] << " " << test_chunk_fetch[20] << " "<< std::endl;

        // TODO: define a layout form

        // extract chunk data for all passed chunk metadata
        std::cout << "\n Start JSON chunk index-based metadata extraction" << std::endl;
        std::vector<int> all_start_bytes;
        std::vector<int> all_num_bytes;
        std::vector<const Aws::String> all_buckets;
        std::vector<const Aws::String> all_objects;
        std::tie(all_start_bytes,
                 all_num_bytes,
                 all_buckets,
                 all_objects) = iterChunkMetaData(hardcoded_chunk_indices, my_hardcoded_path);
        
        std::cout << "JSON chunk index metadata extraction success!" << std::endl; 
        Aws::Client::ClientConfiguration clientConfig;
        Aws::S3::S3Client client(clientConfig); 
        if (CLIENT_REGION_ON) {
            std::cout << "AWS Client region configured..." << std::endl; 
            clientConfig.region = CLIENT_REGION;
        }

        std::cout << std::endl;
        std::cout << "BEGIN CHUNK READING FOR "<< hardcoded_chunk_indices.size() << " CHUNKS" << std::endl; 
        iterChunkRead(hardcoded_chunk_indices, 
                    all_start_bytes, 
                    all_num_bytes, 
                    all_buckets, 
                    all_objects, 
                    client, 
                    compressor_id, 
                    filter_id, 
                    chunks, 
                    order, 
                    dtype, 
                    hardcoded_test_visit,
                    add_offset,
                    scale_factor
                    );

    }
    Aws::ShutdownAPI(options);
    std::cout << std::endl;
    std::cout << "PROCESS COMPLETE." << std::endl;

    return 0;
}

#endif