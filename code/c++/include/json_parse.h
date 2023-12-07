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
#include "config.h"

using namespace std;
using json = nlohmann::json;

typedef enum {
    COMPACT_LAYOUT          = 0,
    CONTIGUOUS_LAYOUT       = 1,
    CHUNKED_LAYOUT          = 2,
    UNKNOWN_LAYOUT          = 3
} layout_t;

/**
 * @brief split according to character of interest
 * 
 * @param s 
 * @param delimiter 
 * @return std::vector<std::string> 
 */
std::vector<std::string> splitString(const std::string& s, char delimiter) {
    std::vector<std::string> tokens;
    std::stringstream ss(s);
    std::string token;
    while (std::getline(ss, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens;
}

/**
 * @brief convert int vector to a dim based parse for the chunk input
 * 
 * @param chunk_index 
 * @return std::string 
 */
std::string convertToDotSeparatedString(const std::vector<int>& chunk_index) {
    std::ostringstream oss;
    for (size_t i = 0; i < chunk_index.size(); ++i) {
        oss << chunk_index[i];
        if (i < chunk_index.size() - 1) {
            oss << ".";
        }
    }
    return oss.str();
}

/**
 * @brief given json path, extract universal metadata valid for all chunks
 * 
 * @param path_to_json 
 * @return std::tuple< std::string, std::string, int, 
 * std::string, float, int, std::string, std::string, std::string, int> 
 */
std::tuple< std::string, std::string, int, std::string, float, int, std::string, std::string, std::string, int, double, double> readJsonMeta(std::string path_to_json) {
    // extract meta data universal for entire arr
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        throw std::runtime_error("Failed to open the JSON file");
    }

    try {
        json jsonData;
        jsonFile >> jsonData;

        if (jsonData.find("refs") != jsonData.end()) {

            // .../.ZARRAY 
            auto it = jsonData["refs"].begin();
            std::string force_in;
            std::string force_inn;
            json zarray;
            json zattrs;

            // CASE 1: NO DATASET PATH -> VAR MUST MATCH 
            if (strlen(HARDCODED_DATASET_NAME)==0) {
                // Allow for a default "" which will take first known, not recommended
                if (strlen(HARDCODED_VARIABLE)== 0) {
                    std::cout << "WARNING: no variable provided, assuming first .zarray is variable to use" << std::endl;
                    // skip zgroup + zattrs
                    std::advance(it, 2);
                    force_in = jsonData["refs"][it.key()];
                    zarray = json::parse(force_in);
                    std::advance(it, 1);
                    force_inn = jsonData["refs"][it.key()];
                    zattrs = json::parse(force_inn);
                } 
                else {
                    // search for var and apply
                    // std::string zarr_search_term = std::string(HARDCODED_VARIABLE) + "/.zarray"; 
                    try {
                        force_in = jsonData["refs"][std::string(HARDCODED_VARIABLE) + "/.zarray"];
                        zarray = json::parse(force_in);
                        force_inn  = jsonData["refs"][std::string(HARDCODED_VARIABLE) + "/.zattrs"];
                        zattrs = json::parse(force_inn);
                    }
                    catch (const std::exception& e) {
                        std::cout << "Exception caught in json_parse, var search failed with exception: " << e.what() << std::endl;
                        std::exit(EXIT_FAILURE);
                    }

                }
            }

            // CASE 2: ITERATE DOWN DATA SET PATH -> THEN ADD VAR FOR ZARR SEARCH
            else {
                if (std::string(HARDCODED_DATASET_NAME).front() != '/' || std::string(HARDCODED_DATASET_NAME).back() != '/' ) {
                    throw std::runtime_error("HARDCODED_VARIABLE must be formatted with front and back slashes e.g.  /quality_assessment/gt2l/");
                }

                std::string hardcoded_data_path = std::string(HARDCODED_DATASET_NAME);
                hardcoded_data_path.pop_back();
                hardcoded_data_path.erase(hardcoded_data_path.begin());
                std::vector<std::string> terms = splitString(hardcoded_data_path, '/');

                // std::string key = "";
                jsonData = jsonData["refs"];

                std::string key = std::accumulate(std::next(terms.begin()), terms.end(),
                                      terms.front(),
                                      [](const std::string &a, const std::string &b) {
                                          return a + "/" + b;
                                      });

                // now apply final zarr fetch on the location
                force_in = jsonData[key + "/" + HARDCODED_VARIABLE + "/.zarray"];
                zarray = json::parse(force_in);
                force_inn = jsonData[key + "/" + HARDCODED_VARIABLE + "/.zattrs"];
                zattrs = json::parse(force_inn);

            }

            assert(zarray["zarr_format"] == 2);

            // chunks
            const nlohmann::json& chunks_arr = zarray["chunks"];
            std::string chunks = chunks_arr.dump();
            // dtype
            std::string dtype = zarray["dtype"];
            // fill val
            float fill_value = zarray["fill_value"];
            // order 
            std::string order = zarray["order"];
            // shape 
            const nlohmann::json& shape_arr = zarray["shape"];
            std::string shape = shape_arr.dump();
            // format
            int zarr_format = zarray["zarr_format"]; 

            // condition based extraction
            int elementsize;
            std::string filter_id;
            std::string compressor_id;
            int level;
            double add_offset = 0;
            double scale_factor = 1;

            // TODO test new extraction vars -> expect non 0 for GOES17
            if (zattrs.contains("add_offset")) {
                add_offset = zattrs["add_offset"];
            }
            if (zattrs.contains("scale_factor")) {
                scale_factor = zattrs["scale_factor"];
            }

            // filters 
            json filters = json::parse((std::string) zarray["filters"][0].dump());
            if (filters.contains("elementsize") && filters.contains("id")) {
                elementsize = filters["elementsize"];
                filter_id = filters["id"];
            }
            else {
                compressor_id = filters["id"];
                level = filters["level"];
            }

            // for now assume the compressor field cannot be a net null; either in filter or here
            json compressor = json::parse((std::string) zarray["compressor"].dump());
            if (zarray["compressor"].is_null()) {
                assert(filters.contains("id") && filters.contains("level"));   
            }
            else {
                std::string compressor_id = compressor["id"];
                int level = compressor["level"];
            }
            
            // FOR NOW EXCLUDE ASSUMING NOT IMPORTANT FOR FUNCTIONALITY, TODO REVIST
            // // _ARRAY_DIMENSIONS - not returned for now
            // const nlohmann::json& arr_dims = zattrs["_ARRAY_DIMENSIONS"];
            // std::string array_dims = arr_dims.dump();

            // TODO: need tor return all new generated vars
            return  std::make_tuple(chunks, 
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
                                    );

        } else {
            throw std::runtime_error("critical failure; the 'refs' not found in assumed location.");
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }

    throw std::runtime_error("Failed base metadata read");
    
}

/**
 * @brief use json path and chunk index to extract s3 path, start byte, and numbytes
 * 
 * @param path_to_json 
 * @param chunk_index 
 * @return std::tuple<std::string, int, int> 
 */
std::tuple<std::string, int, int> readChunkMeta(std::string path_to_json, std::vector<int> chunk_index) {
    std::ifstream jsonFile(path_to_json);
    if (!jsonFile.is_open()) {
        throw std::runtime_error("Failed to open the JSON file");
    }

    try {
        json jsonData;
        jsonFile >> jsonData;
        
        // access refs 
        if (jsonData.find("refs") != jsonData.end()) {

            std::string convert_dot = convertToDotSeparatedString(chunk_index);
            nlohmann::json& chunk_arr = jsonData;

            // CASE 1: NO DATASET PATH -> VAR MUST MATCH 
            if (strlen(HARDCODED_DATASET_NAME)==0) {
                // Allow for a default "" which will take first known, not recommended
                if (strlen(HARDCODED_VARIABLE)== 0) {
                    throw std::runtime_error("Cannot use empty HARCDOED_VARIABLE, please specify var");
                } 
                else {
                    try {

                        chunk_arr = jsonData["refs"][std::string(HARDCODED_VARIABLE) + "/" + convert_dot];
                    }
                    catch (const std::exception& e) {
                        std::cout << "Exception caught in json_parse, var search failed with exception: " << e.what() << std::endl;
                        std::exit(EXIT_FAILURE);
                    }

                }
            }

            // CASE 2: ITERATE DOWN DATA SET PATH -> THEN ADD VAR FOR ZARR SEARCH
            else {
                if (std::string(HARDCODED_DATASET_NAME).front() != '/' || std::string(HARDCODED_DATASET_NAME).back() != '/' ) {
                    throw std::runtime_error("HARDCODED_VARIABLE must be formatted with front and back slashes e.g.  /quality_assessment/gt2l/");
                }

                std::string hardcoded_data_path = std::string(HARDCODED_DATASET_NAME);
                hardcoded_data_path.pop_back();
                hardcoded_data_path.erase(hardcoded_data_path.begin());
                std::vector<std::string> terms = splitString(hardcoded_data_path, '/');

                jsonData = jsonData["refs"];

                std::string key = std::accumulate(std::next(terms.begin()), terms.end(),
                                      terms.front(),
                                      [](const std::string &a, const std::string &b) {
                                          return a + "/" + b;
                                      });

                // now apply final zarr fetch on the location
                chunk_arr = jsonData[key + "/" + HARDCODED_VARIABLE + "/" + convert_dot];

            }

            // assume chunk_arr properly set up
            // nlohmann::json& chunk_arr_ref = chunk_arr;

            if (chunk_arr.size() != 3) {
                throw std::runtime_error("fatal: incorrect size for chunk meta, check read result.");
            }

            std::string s3Path= chunk_arr[0];
            int startByte = chunk_arr[1];
            int numBytes = chunk_arr[2];
            
            return std::make_tuple(s3Path, startByte, numBytes);

        } else {
            throw std::runtime_error("critical failure; the 'refs' not found in assumed location.");
        }

    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }

    throw std::runtime_error("Failed chunk metadata read");
}


/**
 * @brief convert str to vector assuming a bracket array representation
 * 
 * @param input 
 * @return std::vector<int> 
 */
std::vector<int> parseStrToIntVector(std::string &input) {
    std::vector<int> dimensions;
    std::stringstream ss(input);

    char delimiter;
    int num;

    if (ss >> delimiter && delimiter == '[') {
        while (ss >> num) {
            dimensions.push_back(num);
            if (ss >> delimiter && delimiter == ',') {
                continue;
            } else if (delimiter == ']') {
                break;
            } else {
                std::cerr << "Invalid format in the input string." << std::endl;
                return {};
            }
        }
    } else {
        std::cerr << "Invalid format in the input string." << std::endl;
        return {};
    }

    return dimensions;
}

/**
 * @brief starter test function to test json reading with nlohmann lib
 * 
 * @param path_to_json 
 * @return void
 */
void _testReadJsonFromFile(std::string path_to_json){
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
 * @brief extract bucket and object from passed string s
 * 
 * @param s full path
 * @param bucketName place result
 * @param objectName place result
 */
void extractBucketAndKey(const std::string& s, std::string& bucketName, std::string& objectName) {
    std::istringstream iss(s);
    std::string token;

    int partCounter = 0;
    while (std::getline(iss, token, '/')) {
        if (partCounter == 0) {
            bucketName = token;
        } else {
            if (!objectName.empty()) {
                objectName += "/";
            }
            objectName += token;
        }
        partCounter++;
    }
}
