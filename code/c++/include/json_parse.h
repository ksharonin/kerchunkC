/**
 * @file json_parse.h
 * @brief given json associated with netCDF, parse for byte-chunk reading metadata
 * @version 0.1
 */

#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
using namespace std;

// Write a C++ program that takes as input a JSON file, variable name, 
// and chunk ID that returns the corresponding array with the right dimensions.

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
