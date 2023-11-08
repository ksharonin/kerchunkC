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

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
const bool SYS_LITTLE_ENDIAN = true;
#else
const bool SYS_LITTLE_ENDIAN = false;
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
                        std::vector<int> harcoded_test_visit
                        ) {

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
        std::vector<float> floatArr;
        if (dtype == "<f4") {
            fromBufToFloatArr(dest, dresult->size, floatArr);
        } 
        else {
            std::cout << "reading for this dtype not implemented" << std::endl;
            throw std::runtime_error("");
        }

        // try: reconstruct chunk to proper dimensions 
        layer_t::data_t out = reconArrSingleChunk(floatArr, dimensions, order);
        std::cout << "print at indices: " << harcoded_test_visit[0] << "," << harcoded_test_visit[1] << "," << harcoded_test_visit[2] << std::endl;
        printAtIndices(out,harcoded_test_visit);
        

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


