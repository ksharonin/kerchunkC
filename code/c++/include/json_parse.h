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

void readJsonFromFile(std::string path_to_json){
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        std::cerr << "Failed to open the JSON file." << std::endl;
        return;
    }

    try {
        json jsonData;
        jsonFile >> jsonData;
        // std::string name = jsonData["name"];
        // std::cout << "Name: " << name << std::endl;
    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }
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
