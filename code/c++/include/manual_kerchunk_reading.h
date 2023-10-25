/**
 * @file manual_kerchunk_reading.h
 * @brief hardcoded methods to stream bytes and convert to data chunks from netCDF
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
// using namespace std;

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
const bool SYS_LITTLE_ENDIAN = true;
#else
const bool SYS_LITTLE_ENDIAN = false;
#endif

struct DecompressionResult {
    uLong size;
    Bytef* buffer;
};

#ifndef PRINT_BYTES_BINARY
#define PRINT_BYTES_BINARY
/**
 * @brief print stream bytes in binary from single specified s3 object, assumes configd/set client
 * expects given byterange/wont calculate on the fly
 * @param bucketName, objectName, bytesRange, client
 * @return void
 */
Aws::IOStream& printByteStream(Aws::String bucketName, 
                    Aws::String objectName, 
                    char bytesRange[],
                    Aws::S3::S3Client client) {

    Aws::S3::Model::GetObjectRequest request;

    // set bucket + key
    request.SetBucket(bucketName);
    request.SetKey(objectName);

    // read bytes from req
    request.WithRange(bytesRange);

    auto getObjectOutcome = client.GetObject(request);

    if (!getObjectOutcome.IsSuccess()) {
        const Aws::S3::S3Error &err = getObjectOutcome.GetError();
        std::cerr << "Error: GetObject: " <<
                err.GetExceptionName() << ": " << err.GetMessage() << std::endl;
        throw std::runtime_error("");
    }
    else {
        Aws::IOStream& byteStream = getObjectOutcome.GetResultWithOwnership().GetBody();
        std::cout << std::endl;
        std::cout << "Successfully retrieved '" << objectName << "' from '"
                << bucketName << "'." << std::endl;
        std::cout << std::endl;
        // w buffer write to console
        char byte;
        while (byteStream.get(byte)) {
            std::bitset<8> binary(byte);
            std::cout << binary << " ";
        }
        std::cout << std::endl;

        return byteStream;
    }

}

#endif

/**
 * @brief zlib decompression of byte stream
 * @param 
 * @return DecompressionResult*
 * https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/include/util/compress/zlib/zlib.h 
 * https://www.zlib.net/manual.html#Basic:~:text=ZEXTERN%20int%20ZEXPORT-,inflate,-(z_streamp%20strm%2C%20int
 */
DecompressionResult* decompressZlib(Bytef* compressedData, 
                                   // Bytef* outputData, 
                                   uLong compressedSize, 
                                   uLong destSize) {

    Bytef* destBuffer = new Bytef[destSize];

    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = 0;
    stream.next_in = Z_NULL;

    int result = inflateInit(&stream);
    if (result != Z_OK) {
        delete[] destBuffer;
        return nullptr;
    }

    stream.avail_in = compressedSize;
    stream.next_in = compressedData;
    stream.avail_out = destSize;
    stream.next_out = destBuffer;

    result = inflate(&stream, Z_NO_FLUSH);

    while (result == Z_BUF_ERROR || result != Z_STREAM_END) {
        if (destSize >= static_cast<uLong>(1) << 31) {
            throw std::runtime_error("Excessive size of destSize, failed zlib decompression");
            inflateEnd(&stream);
            return nullptr;
        }
        delete[] destBuffer;
        destSize *= 2;
        destBuffer = new Bytef[destSize];
        result = inflateReset(&stream);
        stream.avail_in = compressedSize;
        stream.next_in = compressedData;
        stream.next_out = destBuffer;
        stream.avail_out = destSize;

        // reset error
        if (result != Z_OK) {
            delete[] destBuffer;
            inflateEnd(&stream);
            return nullptr;
        }

        result = inflate(&stream, Z_NO_FLUSH);
    }

    if (result != Z_STREAM_END) {
        delete[] destBuffer;
        inflateEnd(&stream);
        return nullptr;
    }
    inflateEnd(&stream);

    // crop destBuffer due to possible excess size
    Bytef* resized = new Bytef[stream.total_out];
    std::memcpy(resized, destBuffer, stream.total_out);
    delete[] destBuffer;

    DecompressionResult* resultStruct = new DecompressionResult;
    resultStruct->size = stream.total_out;
    resultStruct->buffer = resized;

    return resultStruct;

}

#ifndef UNDO_SHUFFLE
#define UNDO_SHUFFLE

/**
 * @brief numcodec styled undo byte shuffle
 * https://github.com/zarr-developers/numcodecs/blob/main/numcodecs/_shuffle.pyx
 * @param buf, level, count
 * @return void
 */
void undoShuffle(unsigned char* src, unsigned char* dest,  std::size_t element_size, std::size_t len){

    std::size_t count = len / element_size;

    for (std::size_t i = 0; i < element_size; i++) {
        std::size_t offset = i*count;
        for (std::size_t byte_index = 0; byte_index < count; byte_index++) {
            std::size_t j = (byte_index*element_size) + i;
            dest[j] = src[offset+byte_index];

        }
    }

}
#endif

#ifndef SWAP_BYTES_FLOAT
#define SWAP_BYTES_FLOAT

/**
 * @brief swap bytes of float values
 * @param value
 * @return void
 */
void swapBytesFloat(float& value) {
    uint32_t intValue;
    std::memcpy(&intValue, &value, sizeof(float));
    uint8_t* bytes = reinterpret_cast<uint8_t*>(&intValue);

    // 3 2 1 0
    // 0 1 2 3
    std::swap(bytes[0], bytes[3]);
    std::swap(bytes[1], bytes[2]);

    std::memcpy(&value, &intValue, sizeof(float));
}
#endif

#ifndef BUF_TO_FLOATARR
#define BUF_TO_FLOATARR

/**
 * @brief equivalent to numpy.frombuffer() - <f4 dtype
 * @param data, dataSize, floatArray
 * @return void
 */
void fromBufToFloatArr(unsigned char* data, uLong dataSize, std::vector<float>& floatArray) {
    
    if (dataSize % sizeof(float) != 0) {
        std::cerr << "Invalid data size. It must be a multiple of sizeof(float)." << std::endl;
        return;
    }
    uLong numFloats = dataSize / sizeof(float);
    floatArray.resize(numFloats);

    for (uLong i = 0; i < numFloats; ++i) {
        std::memcpy(&floatArray[i], &data[i * sizeof(float)], sizeof(float));
        if (!SYS_LITTLE_ENDIAN) {
            swapBytesFloat(floatArray[i]);
        }
    }
    
    
}

#endif

// bring down for reference
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

#ifndef PUSH_FLOAT_IN
#define PUSH_FLOAT_IN

/**
 * @brief given dimensions, traverse down and push item into index of vector
 * @param struct_in, indices, val
 * @return void
 * e.g. (24, 100, 100) dims, given index [0, 1, 23]--> place elemt at index
 * @note assumes index position exists in the vector, otherwise depend on program to throw err
 */
void pushFloatIn(layer_t::data_t& struct_in, 
                std::vector<int>& indices, 
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

#ifndef RECONSTRUCT_ARRAY_ONE_CHUNK
#define RECONSTRUCT_ARRAY_ONE_CHUNK

/**
 * @brief given an output single dim array, use metadata to generate a properly re-dimensioned arr
 * @param data, dimensions, order 
 *              (ex [24, 100, 100]) (C for row major vs F for col major)
 * @return void
 * @note https://stackoverflow.com/questions/47130773/how-to-generate-arbitrarily-nested-vectors-in-c
 */
void reconArrSingleChunk(std::vector<float>& data, std::vector<int>& dimensions, char order) {
    // row order
    int num_dims= dimensions.size();
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
        print(multi_arr, 0);

        // try pushing in + print - sample dims == 2,3,5
        // TODO: because of the format need to improve arg passing
        std::cout << std::endl;
        std::cout << "demo added float in new position" << std::endl;
        std::cout << std::endl;

        std::vector<int> indexs = {0, 1, 3}; // ex a case in loop iteration
        unsigned int lowest_indx = indexs.back();
        indexs.pop_back();
        pushFloatIn(multi_arr, indexs, lowest_indx, 3.14);
        print(multi_arr, 0);

        // TODO: build loop iteration from dims
        
    }
    else { 
        // assumes 'F' was placed instead
        std::cerr << "Column order reading not implemented, force program halt" << std::endl;
        throw std::runtime_error("");
    }


}

#endif

#ifndef MANUAL_KREAD
#define MANUAL_KREAD

/**
 * @brief harcoded read stream byte, decode + apply filtering; assume s3 client instantiated
 * see range_req_dynamic.ipynb for python v.
 * @param bucketName, objectName, byte, numBytes
 * @return void
 * 
 * @note how to pass decompressor/filters? for now hardcoded str, think about for json parsing...
 * how to condition on this? mapping/dict
 * @note make sure "outputData.assign(outputPtr, outputPtr + destSize);" correctly sizes up
 * maybe consider printing vals in the decompressor?
 * @note implement ability to do numcodecs.shuffle.Shuffle(4).decode(buf) where 4 is elem_size
 */
void manualKerchunkRead(Aws::String bucketName, 
                        Aws::String objectName, 
                        Aws::S3::S3Client client,
                        unsigned int startByte, 
                        unsigned int numBytes, 
                        const char* decompressor,
                        const char* filters) {

    Aws::S3::Model::GetObjectRequest request;
    request.SetBucket(bucketName);
    request.SetKey(objectName);

    // constr byte range
    std::string start = std::to_string(startByte);
    std::string end = std::to_string(startByte+numBytes);
    std::string result = "bytes="+start+"-"+end;
    const char* bytesRange = result.c_str();
    request.WithRange(bytesRange);
    auto getObjectOutcome = client.GetObject(request);

    if (getObjectOutcome.IsSuccess()) {

        // generate char vector 
        Aws::IOStream& objectDataStream = getObjectOutcome.GetResultWithOwnership().GetBody();
        std::vector<unsigned char> retrievedBytes;
        char buffer[1024];
        while (!objectDataStream.eof()) {
            objectDataStream.read(buffer, sizeof(buffer));
            size_t bytesRead = objectDataStream.gcount();
            for (size_t i = 0; i < bytesRead; i++) {
                retrievedBytes.push_back(static_cast<unsigned char>(buffer[i]));
            }
        }

        std::vector<unsigned char> outputData;
        
        // pass retrievedBytes to zlib decompressor
        Bytef* compressedData = reinterpret_cast<Bytef*>(retrievedBytes.data());
        uLong compressedSize = static_cast<uLong>(retrievedBytes.size());
        uLong initDestSize = static_cast<uLong>(retrievedBytes.size() * 2); // this can be dynamically resized inside

        // zlib decompress - size may change based on read
        DecompressionResult* dresult = decompressZlib(compressedData, compressedSize, initDestSize);
        assert(dresult->size != 0);
        assert(dresult->buffer != nullptr);

        // custom for debugging
        uLong startIndex = 0;
        uLong endIndex = 101;
        std::cout << std::endl;
        std::cout << "After decompression, print bytes from index " << static_cast<unsigned long>(startIndex) << " to " << static_cast<unsigned long>(endIndex) << " as binary bytes..." << std::endl;
        std::cout << std::endl;
        uLong rangeToPrint = endIndex - startIndex + 1; 
        for (uLong i = startIndex; i <= endIndex; i++) {
            Bytef byte = dresult->buffer[i];
            for (int bit = 7; bit >= 0; bit--) {
                std::cout << ((byte >> bit) & 1); 
            }
            std::cout << " "; 
        }
        std::cout << std::endl;

        // TEMPORARY: compress decompression result, print in hex
        // std::vector<Bytef> compressRes = compressData(dresult->buffer,  dresult->size, 4);

        // cast to unsig char* for undoShuffle; dresult->size in bytes 
        unsigned char* buf = reinterpret_cast<unsigned char*>(dresult->buffer);
        for (uLong i = 0; i < (dresult->size); i++) {
            unsigned char byteElement = static_cast<unsigned char>(buf[i]);
        }
        
        std::cout << std::endl;
        std::cout << "After Shuffle, print bytes from index " << static_cast<unsigned long>(startIndex) << " to " << static_cast<unsigned long>(endIndex) << " as binary bytes..." << std::endl;
        std::cout << std::endl;

        // numcodecs shuffle
        unsigned char* dest = new unsigned char[dresult->size];
        std::size_t len = static_cast<std::size_t>(dresult->size);
        undoShuffle(buf, dest, 4, len);

        // b print 
        for (int i = startIndex; i <= endIndex; i++) {
            for (int j = 7; j >= 0; j--) {
                char bit = (dest[i] & (1 << j)) ? '1' : '0';
                std::cout << bit;
            }
                std::cout << ' ';
        }
        std::cout << std::endl;

        // numpy decode read - manual <f4 selected out
        std::string dtype = "<f4";
        std::vector<float> floatArr;
        fromBufToFloatArr(dest, dresult->size, floatArr);

        std::cout << std::endl;
        std::cout << "Print sample float values..." << std::endl;
        std::cout << std::endl;
        for (uLong i = 0; i <= 100; ++i) {
            std::cout << std::setprecision(10) << floatArr[i] << " ";
        }
        std::cout << std::endl;

        // try: reconstruct chunk to proper dimensions 
        // TODO: eventually parse dims + order out from JSON metadata

        std::vector<int> dims;
        dims.push_back(2);
        dims.push_back(3);
        dims.push_back(5);
        char order = 'C';
        reconArrSingleChunk(floatArr, dims, order);

        delete[] dresult->buffer;
        delete[] dest;
        delete dresult;

    } else {
        std::cerr << "Error: " << getObjectOutcome.GetError().GetExceptionName() << ": " << getObjectOutcome.GetError().GetMessage() << std::endl;
    }

}
#endif


/**
 * @brief UNFINISHED main entry point for numpy.frombuffer(); call halpers based on dtype
 * @param 
 * @return void
 * @note must account for dtype reading e.g. dtype='<f4'
 * https://numpy.org/doc/stable/reference/generated/numpy.frombuffer.html
 */
void bufToArr(unsigned char* buf, std::string dtype) {
    // TODO
    if (dtype == "<f4") {
        std::cout << "reading for this dtype not implemented" << std::endl;
    }
    else {
        std::cout << "reading for this dtype not implemented" << std::endl;
    }
}


