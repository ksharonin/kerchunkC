/**
 * @file json_parse.h
 * @brief given json associated with netCDF, parse for byte-chunk reading metadata
 * @version 0.1
 * 
 * @note JSON parsing hpp sourced from:
 * https://github.com/nlohmann/json 
 */

#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <iostream>
#include <fstream>
#include "/Users/katrinasharonin/Downloads/kerchunkC/code/c++/include/json.hpp"

using namespace std;
using json = nlohmann::json;

// Write a C++ program that takes as input a JSON file, variable name, 
// and chunk ID that returns the corresponding array with the right dimensions.
// zarray parse ex: https://github.com/pydata/xarray/blob/main/xarray/backends/zarr.py

void testReadJsonFromFile(std::string path_to_json){
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        std::cerr << "Failed to open the JSON file." << std::endl;
        return;
    }

    try {
        json jsonData;
        jsonFile >> jsonData;
        
        // hardcoded example 
        // int start_byte = jsonData["refs"]["air_pressure_at_mean_sea_level/0.0.0"][1];
        // std::cout << "start_byte of 0.0.0: " << start_byte << std::endl;

        // list keys - version and refs expected
        for (auto it = jsonData.begin(); it != jsonData.end(); ++it) {
            std::string key = it.key();
            std::cout << "Key: " << key << std::endl;
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }
}


void readJsonMeta(std::string path_to_json) {
    // extract meta data universal for entire arr
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        std::cerr << "Failed to open the JSON file." << std::endl;
        return;
    }

    try {
        json jsonData;
        jsonFile >> jsonData;
        
        // access refs 
        if (jsonData.find("refs") != jsonData.end()) {
            json refs = jsonData["refs"];
            int index = 0;

            // ex zarr
            // {"chunks":[24,100,100],
            // "compressor":{"id":"zlib","level":4},
            // "dtype":"<f4","fill_value":9.969209968386869e+36,
            // "filters":[{"elementsize":4,"id":"shuffle"}],
            // "order":"C","shape":[744,721,1440],"zarr_format":2}')

            json zarray = refs[0];

            // ex zattrs
            // {"_ARRAY_DIMENSIONS":["time0","lat","lon"],
            // "least_significant_digit":2,"long_name":"Mean sea level pressure",
            // "nameCDM":"Mean_sea_level_pressure_surface",
            // "nameECMWF":"Mean sea level pressure","product_type":"analysis",
            // "shortNameECMWF":"msl","standard_name":"air_pressure_at_mean_sea_level","units":"Pa"}')
            json zattrs = refs[1];

        } else {
            std::cerr << "The 'refs' object doesn't exist in the JSON." << std::endl;
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }

    return;
}

void readChunkMeta() {
    // read chunk specific info


}

void extractBucketAndKey(){
    // TODO
}

void extractCompressor(){
    // TODO
}

void extractFilters(){
    // TODO
}

void extractChunkSize(){
    // TODO
}
