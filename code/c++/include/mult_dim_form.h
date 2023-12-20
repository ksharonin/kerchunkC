/**
 * @file mult_dim_form.h
 * @brief given flat single array, reform into dims of interest
 * @version 0.1
 */

#include <iostream>
#include <string.h>
#include <bit>
#include <cstdint>
#include <vector>
#include <variant>
#include <cstring>
// #include <aws/core/Aws.h>
// #include <aws/s3/S3Client.h>
// #include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <zlib.h>
#include <memory>
#include <iomanip>
#include <cassert>
#include <chrono>

struct layer_t;

struct layer_t {
    // destructor
    ~layer_t() {}
    // alias
    using layer_p = std::shared_ptr<layer_t>;
    using data_t = std::variant< std::vector<layer_p>, std::vector<float> >;
    // var to hold data_t
    data_t data;
    layer_t(layer_t const&)=default;
    // init with data
    layer_t(data_t in):data(std::move(in)) {}
    // default constructor
    layer_t()=default;
};

#ifndef GEN_NESTED_VEC
#define GEN_NESTED_VEC

/**
 * @brief generate a dynamic float vector with proper dimensions based on chunk request
 * 
 * @param num_dim, dim_sizes (each elem corresponds to size of layer its index is at)
 * @return layer_t::data_t 
 * @note should take dim_sizes and apply per layer e.g.
 * 0: 24 1: 100 2:100
 * layer 0: 24 pointers
 * layer 1: per each 1 point of 0, make arr of 100 pts
 * layer 2: float vector w 100 entries
 */
layer_t::data_t generate( unsigned int num_dim,  unsigned int num_floats, std::vector<int>& dim_sizes) {
    // size 0 --> place base value
    if (num_dim==0) {
        // need to do newline operation due to args not assessing
        // return std::vector<float>{(num_floats, 0.0f)};
        std::vector<float> allocatedBottomLayer(num_floats, 0.0f);
        return allocatedBottomLayer;
    }

    std::vector<layer_t::layer_p> layer_vec;

    for (int i = 0; i < dim_sizes[0]; ++i) {
        std::vector<int> sub_dim_sizes(dim_sizes.begin() + 1, dim_sizes.end());
        layer_vec.push_back(std::make_shared<layer_t>(generate(num_dim - 1, num_floats, sub_dim_sizes)));
    }

    return layer_vec;
}

#endif

/**
 * @brief overloaded print for custom layer_t form
 * @param in, level=0
 */
void print(layer_t::data_t const& in, int level = 0) {
    std::visit(
        [level](auto const& e) {
            if constexpr (std::is_same<decltype(e), float const&>::value) {
                std::cout << "Level " << level << ": Float array: " << e << "\n";
            } else if constexpr (std::is_same<decltype(e), std::vector<float> const&>::value) {
                for (const auto& element : e) {
                    std::cout << "Level " << level << ": Element in float vec: " << element << "\n";
                }
            } else {
                for (const auto& x : e) {
                    if (!x) {
                        std::cout << "Level " << level << ": null\n";
                    } else {
                        std::cout << "Level " << level << ": Nested (pointer)\n";
                        print(x->data, level + 1);  // Increase the level for nested pointers
                        std::cout << "Level " << level << ": Unnested (pointer)\n";
                    }
                }
            }
        },
        in
    );
}


/**
 * @brief print at given index vector eg. {0,2,3} -> properly traverses layer_t struct for float val
 * 
 * @param struct_in 
 * @param indices 
 */
void printAtIndices(layer_t::data_t& struct_in, 
                   std::vector<int> indices) {
    std::visit(
        [&indices](const auto& e) {
            if constexpr (std::is_same<decltype(e), const std::vector<layer_t::layer_p>&>::value) {
                if (!indices.empty()) {
                    unsigned int temp = indices[0];
                    indices.erase(indices.begin());

                    if (temp >= 0 && temp < e.size()) {
                        printAtIndices(e[temp]->data, indices);
                    } else {
                        std::cerr << "Index out of bounds." << std::endl;
                    }
                } else {
                    std::cout << "Reached the specified level." << std::endl;
                }
            } else if constexpr (std::is_same<decltype(e), const std::vector<float>&>::value) {
                if (!indices.empty()) {
                    unsigned int temp = indices[0];
                    indices.erase(indices.begin());

                    if (temp >= 0 && temp < e.size()) {
                        std::cout << "Value at index " << temp << ": "  << std::setprecision(10) << e[temp] << std::endl;
                    } else {
                        std::cerr << "Index out of bounds." << std::endl;
                    }
                } else {
                    std::cout << "Reached the specified level." << std::endl;
                }
            }
        },
        struct_in
    );
}


#ifndef PUSH_FLOAT_IN
#define PUSH_FLOAT_IN

/**
 * @brief given dimensions, traverse down and push item into index of vector
 * @param struct_in, indices, targetIndex, val
 * @return void
 * e.g. (24, 100, 100) dims, given index [0, 1, 23]--> place elemt at index
 * @note assumes index position exists in the vector, otherwise depend on program to throw err
 * @note targetIndex is separated out from indices for recursion purposes
 */
void pushFloatIn(layer_t::data_t& struct_in, 
                std::vector<int> indices, 
                unsigned int targetIndex,
                float val) {
    if (indices.size() >= 0) {
        std::visit(
            [targetIndex, &indices, val](auto& e) {
                if constexpr (std::is_same<decltype(e), std::vector<layer_t::layer_p>&>::value) {
                    unsigned int temp = indices[0];
                    indices.erase(indices.begin());
                    pushFloatIn(e[temp]->data, indices, targetIndex, val);
                } else if constexpr (std::is_same<decltype(e), std::vector<float>&>::value) {
                    e[targetIndex] = val;
                }
            },
            struct_in
        );
    }
    
}
#endif

/**
 * @brief apply arbitary amount of for loops according to dim size
 * @param in vector to use function on
 * @param out vector of layer_t which contains mult-dim struct
 * @param dimensions actual dims excluding final level e.g. if actual dims {24, 100, 100} -> get {24, 100}
 * @param num_dims full number of dimensions e.g. dimensions.size() + 1 (due to popped final_level)
 * @param final_level final level sizing e.g. if actual dims {24, 100, 100} -> get 
 * @param func apply this function to the item in list
 * @param cur_indices
 */
 std::pair<layer_t::data_t, unsigned int> recurseFor(
                std::vector<float>& in,
                layer_t::data_t& out,
                std::vector<int>& dimensions, 
                unsigned int num_dims,
                unsigned int along,
                unsigned int final_level,
                void (*func) (layer_t::data_t&, 
                std::vector<int>, 
                unsigned int,
                float),
                std::vector<int>& cur_indices,
                unsigned int master_indx) {
    // apply num_dims of for loops 
    if (num_dims == 1) {
        // use final level and actually apply func
        for (unsigned int i = 0; i < final_level; i++) {
            // just pass final level due to index separation
            func(out, cur_indices, i, in[master_indx]);
            master_indx++;
        }
        return std::make_pair(out, master_indx);
    } else {
        // grab first dim of interest 
        int poppedVal = dimensions[along];
        // dimensions.erase(dimensions.begin() + along);
        num_dims--;
        along++;

        std::vector<int> cur_indices_copy = cur_indices;

        // call with set of indices; row major order
        for (unsigned int j = 0; j < poppedVal; j++) {
            if (j != 0) {
                // pop off previous
                cur_indices_copy.pop_back();
            }
            // add in latest j
            cur_indices_copy.push_back(j);
            std::pair<layer_t::data_t, unsigned int> riz = recurseFor(in, out, dimensions, num_dims, along, final_level, func, cur_indices_copy, master_indx);
            out = riz.first;
            master_indx = riz.second;
        }
        
        return std::make_pair(out, master_indx);
    }


}


#ifndef RECONSTRUCT_ARRAY_ONE_CHUNK
#define RECONSTRUCT_ARRAY_ONE_CHUNK

/**
 * @brief given an output single dim array, use metadata to generate a properly re-dimensioned arr
 * @param data, dimensions, order 
 *              (ex [24, 100, 100]) (C for row major vs F for col major)
 * @note https://stackoverflow.com/questions/47130773/how-to-generate-arbitrarily-nested-vectors-in-c
 */
layer_t::data_t reconArrSingleChunk(std::vector<float>& data, std::vector<int>& dimensions, char order) {
    // row order
    int num_dims= dimensions.size();
    // track progress in vector data; add each inner for loop iter
    int master_indx = 0;
    if (order == 'C') {
        // dynamically generate the size of vectors + print
        // for proper gen; use last as number of actual elems in the vector

        std::cout << std::endl;
        std::cout << "generate nested arr + print flattened struct" << std::endl;
        std::vector<int> org_dims = dimensions;
        unsigned int num_floats = dimensions.back();
        dimensions.pop_back();
        num_dims = num_dims - 1;
        auto multi_arr = generate(num_dims, num_floats, dimensions);
        //print(multi_arr, 0);

        std::cout << std::endl;
        std::cout << "recurse to stuff in float values" << std::endl;
        std::cout << std::endl;

        // final step: stuff all floats into the multi arr
        std::vector<int> indexes = {};
        std::pair<layer_t::data_t, unsigned int> out = 
                recurseFor(
                data,
                multi_arr,
                dimensions, 
                num_dims + 1,
                0,
                num_floats,
                pushFloatIn,
                indexes,
                master_indx);
        
        std::cout << std::endl;
        std::cout << "recurse done" << std::endl;

        return out.first;
        
    }
    else { 
        // assumes 'F' was placed instead
        std::cerr << "Column order reading not implemented, force program halt" << std::endl;
    }

    throw std::runtime_error("Failed mult-dim conversion");

}

#endif
