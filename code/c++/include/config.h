/**
 * @file config.h
 * @brief define inputs for program along with settings
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
#include <zlib.h>

// chunk index e.g. chunk 0 of 100 chunks - opt to elimindate for HARDCODED_CHUNK_INDICES
#define HARDCODED_CHUNK_INDEX 0
//  visit multiple chunks at indices e.g. chunk 0, chunk 1, chunk 2
#define HARDCODED_CHUNK_INDICES {0, 1, 2}
// read ALL chunks as indicated by json
#define FULL_READ false
// flag for non s3 read, assume local file matches json meta
#define USE_LOCAL true
// path to metadata JSON
#define HARDCODED_JSON_PATH "/Users/katrinasharonin/Downloads/kerchunkC/jsons/2023-006.json" // "/Users/katrinasharonin/Downloads/kerchunkC/code/jupyter/01_air_pressure_at_mean_sea_level.json"
// hardcoded byte stream source local to device
#define HARCODED_LOCAL_NC_PATH "/Users/katrinasharonin/Downloads/2020_01_data_air_pressure_at_mean_sea_level.nc"
// inside of a chunk e.g. size {24, 100, 100} visit at index {x,y,z}
#define HARDCODED_TEST_VISIT {12, 33, 10}
// verbose printing
#define DEBUG_PRINT_ON false
// timers
#define TIMER_S3_READ_ON true
// s3 settings
#define CLIENT_REGION_ON false
#define CLIENT_REGION "us-east-1"
