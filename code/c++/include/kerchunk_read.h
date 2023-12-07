/**
 * @file manual_kerchunk_reading.h
 * @brief methods to stream bytes and convert to data chunks from netCDF
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
#include "mult_dim_form.h"
#include "print_helpers.h"
#include "config.h"

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
const bool SYS_LITTLE_ENDIAN = true;
#else
const bool SYS_LITTLE_ENDIAN = false;
#endif

/**
 * @brief apply known scale and factor to 
 * 
 * @tparam T, data , scale_factor , add_offset 
 * @return std::vector<T> 
 * 
 * @note "The attributes scale_factor and add_offset are of the type intended for the unpacked data."
* p.39 of https://www.goes-r.gov/users/docs/PUG-main-vol1.pdf 
 */
template<typename T>
std::vector<T> scaleAndOffset(const std::vector<T>& data, 
                            double scale_factor, 
                            double add_offset) {
    static_assert(std::is_arithmetic<T>::value, "Type T must be numeric");
    std::vector<T> scaledData;
    for (const T& value : data) {
        T scaledValue = static_cast<T>((static_cast<double>(value) * scale_factor) + add_offset);
        scaledData.push_back(scaledValue);
    }
    return scaledData;
}

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

    if (result == Z_DATA_ERROR) {
        result = inflateEnd(&stream);
        result = inflateInit2(&stream, -MAX_WBITS);
        result = inflate(&stream, Z_NO_FLUSH);
    }

    while (result == Z_BUF_ERROR || result != Z_STREAM_END) {

        // excessive size check
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

#ifndef SWAP_BYTES_ALL
#define SWAP_BYTES_ALL

/**
 * @brief swap bytes of any type
 * @param value
 * @return void
 */
template <typename T>
void swapBytesAllType(T& value) {
    static_assert(std::is_trivially_copyable<T>::value, "Type must be trivially copyable.");

    unsigned char* bytes = reinterpret_cast<unsigned char*>(&value);
    std::size_t size = sizeof(T);

    for (std::size_t i = 0; i < size / 2; ++i) {
        std::swap(bytes[i], bytes[size - i - 1]);
    }
}

#endif

#ifndef BUF_TO_FLOATARR_LILF4
#define BUF_TO_FLOATARR_LILF4

/**
 * @brief equivalent to numpy.frombuffer() - <f4 dtype
 * @param data, dataSize, floatArray
 * @return void
 */
void fromBufToFloatArr_LILf4(unsigned char* data, uLong dataSize, std::vector<float>& floatArray) {
    
    // check system mapping of float sizing
    assert(sizeof(float) == 4);

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

// TODO COMPLETE CHANGE TYPE

/**
 * @brief equivalent to numpy.frombuffer() - <i2 dtype
 * @param data, dataSize, intArray 
 */
void fromBufToIntArr_LILI2(unsigned char* data, uLong dataSize, std::vector<int16_t>& intArray) {
    if (dataSize % sizeof(int16_t) != 0) {
        std::cerr << "Invalid data size. It must be a multiple of sizeof(int16_t)." << std::endl;
        return;
    }
    uLong numInts = dataSize / sizeof(int16_t);
    intArray.resize(numInts);

    for (uLong i = 0; i < numInts; ++i) {
        std::memcpy(&intArray[i], &data[i * sizeof(int16_t)], sizeof(int16_t));
        if (!SYS_LITTLE_ENDIAN) {
            swapBytesAllType(intArray[i]);
        }
    }
}

#ifndef MANUAL_KREAD
#define MANUAL_KREAD

/**
 * @brief read stream byte, decode + apply filtering; assume s3 client instantiated
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
void primaryKerchunkRead(Aws::String bucketName, 
                        Aws::String objectName, 
                        Aws::S3::S3Client client,
                        unsigned int startByte, 
                        unsigned int numBytes, 
                        const char* decompressor,
                        const char* filters,
                        std::vector<int> dimensions,
                        char order,
                        std::string dtype,
                        std::vector<int> harcoded_test_visit,
                        double add_offset,
                        double scale_factor
                        ) {

    // local req flag - assume path stays constant with paired JSON
    std::vector<unsigned char> retrievedBytes;

    if (USE_LOCAL) {
        std::ifstream file("/" + std::string(objectName.c_str()), std::ios::binary);
        if (!file.is_open()) {
            std::cerr << "Error opening the file!" << std::endl;
            return;
        }
        // int start_byte = startByte; 
        // int bytes_to_read = numBytes;
        file.seekg(startByte, std::ios::beg);
        // std::vector<unsigned char> retrievedBytes;
        char buffer[1024];

        int remainingBytes = static_cast<int>(numBytes);
        while (remainingBytes > 0 && file.good()) {
            int read_size = std::min(remainingBytes, 1024);
            file.read(buffer, read_size);
            int bytesRead = file.gcount();
            if (bytesRead == 0) {
                break;
            }
            for (int i = 0; i < bytesRead; ++i) {
                retrievedBytes.push_back(static_cast<unsigned char>(buffer[i]));
            }
            remainingBytes -= bytesRead;
        }
        file.close(); 
        
    } else {
        Aws::S3::Model::GetObjectRequest request;
        request.SetBucket(bucketName);
        request.SetKey(objectName);

        std::string start = std::to_string(startByte);
        std::string end = std::to_string(startByte+numBytes);
        std::string result = "bytes="+start+"-"+end;
        const char* bytesRange = result.c_str();
        Aws::S3::Model::GetObjectOutcome getObjectOutcome;

        if (TIMER_S3_READ_ON) {
            auto start = std::chrono::system_clock::now();
            request.WithRange(bytesRange);
            getObjectOutcome = client.GetObject(request);
            auto end = std::chrono::system_clock::now();
            std::chrono::duration<double> elapsed_seconds = end-start;
            std::time_t end_time = std::chrono::system_clock::to_time_t(end);
        
            std::cout << "finished computation at " << std::ctime(&end_time)
                    << "elapsed time: " << elapsed_seconds.count() << "s"
                    << std::endl;

        } else {
            request.WithRange(bytesRange);
            getObjectOutcome = client.GetObject(request);
        }
         if (getObjectOutcome.IsSuccess()) {
            // generate char vector 
            Aws::IOStream& objectDataStream = getObjectOutcome.GetResultWithOwnership().GetBody();
            // std::vector<unsigned char> retrievedBytes;
            char buffer[1024];
            while (!objectDataStream.eof()) {
                objectDataStream.read(buffer, sizeof(buffer));
                size_t bytesRead = objectDataStream.gcount();
                for (size_t i = 0; i < bytesRead; i++) {
                    retrievedBytes.push_back(static_cast<unsigned char>(buffer[i]));
                }
            }
        } else {
            std::cerr << "Error: " << getObjectOutcome.GetError().GetExceptionName() << ": " << getObjectOutcome.GetError().GetMessage() << std::endl;
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

    _debugPrintAfterDecompression(0, 101, dresult);

    // cast to unsig char* for undoShuffle; dresult->size in bytes 
    unsigned char* buf = reinterpret_cast<unsigned char*>(dresult->buffer);
    for (uLong i = 0; i < (dresult->size); i++) {
        unsigned char byteElement = static_cast<unsigned char>(buf[i]);
    }

    // numcodecs shuffle
    unsigned char* dest = new unsigned char[dresult->size];
    std::size_t len = static_cast<std::size_t>(dresult->size);
    undoShuffle(buf, dest, 4, len);

    _debugPrintAfterUnshuffle(0, 101, dest);

    // numpy decode read
    layer_t::data_t out;

    if (dtype == "<f4") {
        std::vector<float> floatArr;
        fromBufToFloatArr_LILf4(dest, dresult->size, floatArr);
        floatArr = scaleAndOffset(floatArr, scale_factor, add_offset);
        out = reconArrSingleChunk(floatArr, dimensions, order);
        if (PRINT_WHOLE_BUFFER) {
            std::cout << "complete fetched buffer result : \n" << std::endl;
            for (const auto& element : floatArr) {
                std::cout << element << " ";
            }
            std::cout << std::endl;
        }
    } 
    else if (dtype == "<i2") {
        std::vector<int16_t> intArr;
        fromBufToIntArr_LILI2(dest, dresult->size, intArr);
        intArr = scaleAndOffset(intArr, scale_factor, add_offset);

        // TODO accomodate single chunk construction for diff types
        // out = reconArrSingleChunk(intArr, dimensions, order);
        
        if (PRINT_WHOLE_BUFFER) {
            std::cout << "complete fetched buffer result : \n" << std::endl;
            for (const auto& element : intArr) {
                std::cout << element << " ";
            }
            std::cout << std::endl;
        }
    }
    else if (dtype == "|i1") {
        std::cout << "reading for this dtype not implemented" << std::endl;
        throw std::runtime_error("");
    }
    else {
        std::cout << "reading for this dtype not implemented" << std::endl;
        throw std::runtime_error("");
    }

    // try: reconstruct chunk to proper dimensions 
    if (PRINT_AT_TEST_VISIT) {
        std::cout << "print at indices: " << harcoded_test_visit[0] << "," << harcoded_test_visit[1] << "," << harcoded_test_visit[2] << std::endl;
        printAtIndices(out,harcoded_test_visit);
    }
    
    delete[] dresult->buffer;
    delete[] dest;
    delete dresult;

}
#endif


/**
 * @brief UNFINISHED main entry point for numpy.frombuffer(); call halpers based on dtype
 * @param 
 * @return void
 * @note must account for dtype reading e.g. dtype='<f4'
 * https://numpy.org/doc/stable/reference/generated/numpy.frombuffer.html
 * 
void bufToArr(unsigned char* buf, std::string dtype) {
    // TODO
    if (dtype == "<f4") {
        std::cout << "reading for this dtype not implemented" << std::endl;
    }
    else {
        std::cout << "reading for this dtype not implemented" << std::endl;
    }
}
*/


