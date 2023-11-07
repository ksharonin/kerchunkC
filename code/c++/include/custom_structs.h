/**
 * @file custom_structs.h
 * @brief store header for structs excluding mult_dim_form layer_t 
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

struct DecompressionResult {
    uLong size;
    Bytef* buffer;
};

// TODO: later add in, overloading issues with compiler
// struct layer_t;

// struct layer_t {
//     // destructor
//     ~layer_t() {}
//     // alias
//     using layer_p = std::shared_ptr<layer_t>;
//     using data_t = std::variant< std::vector<layer_p>, std::vector<float> >;
//     // var to hold data_t
//     data_t data;
//     layer_t(layer_t const&)=default;
//     // init with data
//     layer_t(data_t in):data(std::move(in)) {}
//     // default constructor
//     layer_t()=default;
// };
