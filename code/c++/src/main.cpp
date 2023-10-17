/**
 * @file main.cpp
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
        // hardcoded settings
        const Aws::String bucketName = "era5-pds";
        const Aws::String objectName = "2020/01/data/air_pressure_at_mean_sea_level.nc";
        char bytesRange[] = "bytes=0-49";

        Aws::Client::ClientConfiguration clientConfig;
        Aws::S3::S3Client client(clientConfig); // clientConfig.region = "us-east-1";

        // test JSON read
        std::cout << std::endl;
        std::cout << "Testing JSON read..." << std::endl;
        readJsonFromFile("/Users/katrinasharonin/Downloads/kerchunkC/code/jupyter/01_air_pressure_at_mean_sea_level.json");
        std::cout << "JSON read success!" << std::endl;

        // test byte stream
        std::cout << std::endl;
        std::cout << "Testing binary byte stream..." << std::endl;
        std::cout << std::endl;
        printByteStream(bucketName, objectName, bytesRange, client);

        // ['era5-pds/2020/01/data/air_pressure_at_mean_sea_level.nc', 19226, 256358]
        // "compressor":{"id":"zlib","level":4},"dtype":"<f4",
        // "fill_value":9.969209968386869e+36,"filters":[{"elementsize":4,"id":"shuffle"}]

        // TODO: parse these out from the metadata, for now hardcoded in
        const char* compressionType = "zlib";
        const char* shuffleType = "shuffle";

        // TODO: now try to decode/decompress into actual netCDF values
        std::cout << std::endl;
        std::cout << "Converting binary stream to decoded/decompressed chunks..." << std::endl;
        manualKerchunkRead(bucketName, objectName, client, 19226, 256358, compressionType, shuffleType);

        std::cout << std::endl;
        std::cout << "Done!" << std::endl;

    }
    Aws::ShutdownAPI(options);

    return 0;
}

#endif