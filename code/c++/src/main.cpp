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
#include "manual_kerchunk_reading.h"
#include "json_parse.h"
using namespace std;

#ifndef MAIN_RUN
#define  MAIN_RUN

int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    {
        // chunk index / index set up?
        int harcoded_chunk_index = 0;
        // bool for full multidim read?
        bool full_read = false;
        // sample path
        std::string my_hardcoded_path = "/Users/katrinasharonin/Downloads/kerchunkC/code/jupyter/01_air_pressure_at_mean_sea_level.json";

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
                
        std::vector<int> chunks = parseStrToVector(chunks_interm);
        std::cout << "JSON base metadata extraction success!" << std::endl;
        std::cout << "ex: demo chunks read result" << std::endl;
        std::cout << chunks_interm << std::endl;

        // TODO
        // fetch chunk specific data / set up
        if (full_read) {
            // for loop iteration on entire possible size
            std::cout << "full read not implemented, requires s3 source consistency sanity check" << std::endl;
            throw std::runtime_error("");
        } else {
            std::cout << std::endl;
            std::cout << "Start chunk metadata extraction..." << std::endl;
            // TODO  use chunk ID passed / hardcoded
            readChunkMeta();
            std::cout << "JSON chunk metadata extraction success!" << std::endl;
        }
        
        // TODO: REPLACE hardcoded settings using chunk parsing
        const Aws::String bucketName = "era5-pds";
        const Aws::String objectName = "2020/01/data/air_pressure_at_mean_sea_level.nc";
        char bytesRange[] = "bytes=19226-19326";
        int startByte = 19226;
        int numBytes = 256358;

        Aws::Client::ClientConfiguration clientConfig;
        Aws::S3::S3Client client(clientConfig); 
        // clientConfig.region = "us-east-1";

        // test byte stream with harcoded values
        std::cout << std::endl;
        std::cout << "Testing binary byte stream..." << std::endl;
        std::cout << std::endl;
        printByteStream(bucketName, objectName, bytesRange, client);

        // try to decode/decompress into actual netCDF values
        std::cout << std::endl;
        std::cout << "Converting binary stream to decoded/decompressed chunks..." << std::endl;
        manualKerchunkRead(bucketName, 
                            objectName, 
                            client, 
                            startByte, 
                            numBytes, 
                            compressor_id.c_str(),
                            filter_id.c_str(),
                            chunks,
                            order[0],
                            dtype
                            );

        std::cout << std::endl;
        std::cout << "Done!" << std::endl;

    }
    Aws::ShutdownAPI(options);

    return 0;
}

#endif