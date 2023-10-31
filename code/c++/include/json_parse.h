/**
 * @file json_parse.h
 * @brief given json associated with netCDF, parse for byte-chunk reading metadata
 * zarray parse ex: https://github.com/pydata/xarray/blob/main/xarray/backends/zarr.py
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

/**
 * @brief 
 * 
 * @param path_to_json 
 * @return void
 */
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
        int start_byte = jsonData["refs"]["air_pressure_at_mean_sea_level/0.0.0"][1];
        std::cout << "start_byte of 0.0.0: " << start_byte << std::endl;

        // list keys - version and refs expected
        for (auto it = jsonData.begin(); it != jsonData.end(); ++it) {
            std::string key = it.key();
            std::cout << "Key: " << key << std::endl;
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }
}

/**
 * @brief given json path, extract universal metadata valid for all chunks
 * 
 * @param path_to_json 
 * @return std::tuple< std::string, std::string, int, std::string, float, int, std::string, std::string, std::string, int> 
 */
std::tuple< std::string, std::string, int, std::string, float, int, std::string, std::string, std::string, int> readJsonMeta(std::string path_to_json) {
    // extract meta data universal for entire arr
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        throw std::runtime_error("Failed to open the JSON file");
    }

    try {
        json jsonData;
        jsonFile >> jsonData;
        
        // access refs 
        if (jsonData.find("refs") != jsonData.end()) {

            // .../.ZARRAY 
            auto it = jsonData["refs"].begin();
            std::advance(it, 2);
            std::string force_in = jsonData["refs"][it.key()];
            json zarray = json::parse(force_in);

            // chunks
            const nlohmann::json& chunks_arr = zarray["chunks"];
            std::string chunks = chunks_arr.dump();
            // compressor 
            json compressor = json::parse((std::string) zarray["compressor"].dump());
            std::string compressor_id = compressor["id"];
            int level = compressor["level"];
            // dtype
            std::string dtype = zarray["dtype"];
            // fill val
            float fill_value = zarray["fill_value"];
            // filters
            json filters = json::parse((std::string) zarray["filters"][0].dump());
            int elementsize = filters["elementsize"];
            std::string filter_id = filters["id"];
            // order 
            std::string order = zarray["order"];
            // shape 
            const nlohmann::json& shape_arr = zarray["shape"];
            std::string shape = shape_arr.dump();
            // format
            int zarr_format = zarray["zarr_format"]; 
            
            // .../.ZATTRS
            std::advance(it, 1);
            std::string force_inn = jsonData["refs"][it.key()];
            json zattrs = json::parse(force_inn);

            // _ARRAY_DIMENSIONS - not returned for now
            const nlohmann::json& arr_dims = zattrs["_ARRAY_DIMENSIONS"];
            std::string array_dims = arr_dims.dump();

            // other zattrs... exclude for now?

            return  std::make_tuple(chunks, 
                                    compressor_id, 
                                    level,
                                    dtype,
                                    fill_value,
                                    elementsize,
                                    filter_id,
                                    order,
                                    shape,
                                    zarr_format
                                    );

        } else {
            throw std::runtime_error("critical failure; the 'refs' not found in assumed location.");
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
        throw std::runtime_error("Failed base metadata read");
    }

    throw std::runtime_error("Failed base metadata read");
    
}

void readChunkMeta() {
    // TODO
    // read chunk specific info
    return;
}

std::vector<int> parseStrToVector(std::string &input) {
    std::vector<int> dimensions;
    std::stringstream ss(input);

    char delimiter;
    int num;

    // Check for the opening bracket '['.
    if (ss >> delimiter && delimiter == '[') {
        // Parse integers and store them in the vector.
        while (ss >> num) {
            dimensions.push_back(num);

            // Check for the delimiter ','.
            if (ss >> delimiter && delimiter == ',') {
                continue;
            } else if (delimiter == ']') {
                // If the closing bracket ']' is encountered, break the loop.
                break;
            } else {
                // Invalid format in the input string.
                std::cerr << "Invalid format in the input string." << std::endl;
                // Return an empty vector to indicate an error.
                return {};
            }
        }
    } else {
        // Invalid format in the input string.
        std::cerr << "Invalid format in the input string." << std::endl;
        // Return an empty vector to indicate an error.
        return {};
    }

    return dimensions;
}
