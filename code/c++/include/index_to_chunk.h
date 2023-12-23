/**
 * @file index_to_chunk.h
 * @brief map given index to chunk index
 * @version 0.1
 * 
 * @note be able to support large grabs
 */


#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <iostream>
#include <fstream>
#include "config.h"

using namespace std;

#ifndef ARRINDEX_TO_CHUNK
#define ARRINDEX_TO_CHUNK

/**
 * @brief given extracted json info on chunk sizing
 * return index of chunk containing index of interest 
 * 
 * @param chunk_dims 
 * @return SINGLE chunk index, assumes a point lands in a single chunk
 * @note outside functions may summon multiple chunks
 */
std::vector<int> index_to_chunk(std::vector<int> in_indices, std::vector<int> chunk_size) {
    /* 
    For example, if your chunk size is 4 x 6 x 10, 
    then the value at (zero-based) index 10, 8, 1 
    would require first grabbing chunk 2.1.0 (which 
    contains values 8-11,6-11,0-9) and then, within 
    that chunk sub-array, grab value (zero-indexed) 2,2,1.
    */

    // approach: floor and return assuming round down
    std::vector<int> chunk_index;
    std::size_t len = chunk_size.size();
    for (std::size_t i = 0; i < len; i++) {
        chunk_index.push_back(in_indices[i] / chunk_size[i]);
    }

    return chunk_index;

}

#endif


#ifndef EQUAL_VECS
#define EQUAL_VECS

bool equal_vectors() {
    // TODO
    return true;
}

#endif