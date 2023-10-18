/**
 * @file manual_kerchunk_reading.h
 * @brief hardcoded methods to stream bytes and convert to data chunks from netCDF
 * @version 0.1
 */

#include <iostream>
#include <bit>
#include <cstdint>
#include <vector>
#include <cstring>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <zlib.h>
// using namespace std;

const bool SYS_LITTLE_ENDIAN = htonl(47) != 47;

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

    DecompressionResult* resultStruct = new DecompressionResult;
    resultStruct->size = destSize;
    resultStruct->buffer = destBuffer;

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
void undoShuffle(unsigned char* src, unsigned char* dest, uLong element_size, uLong len){

    uLong count = len / element_size;

    for (uLong i = 0; i < element_size; i++) {
        uLong offset = i*count;
        for (uLong byte_index = 0; byte_index < count; byte_index++) {
            uLong j = byte_index*element_size + i;
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
        if (SYS_LITTLE_ENDIAN) {
            swapBytesFloat(floatArray[i]);
        }
    }
    
    
}

#endif

#include <zlib.h>
#include <vector>
#include <iostream>

// temporary compression function
std::vector<Bytef> compressData(Bytef* inputData, 
                                uLong inputSize, 
                                int compressionLevel = Z_BEST_COMPRESSION) {
    std::vector<Bytef> compressedData;

    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;

    int result = deflateInit(&stream, compressionLevel);
    if (result != Z_OK) {
        return compressedData;
    }

    stream.avail_in = static_cast<uInt>(inputSize);
    stream.next_in = const_cast<Bytef*>(inputData);
    
    uLong outputBufferSize = deflateBound(&stream, inputSize);
    compressedData.resize(outputBufferSize);
    stream.avail_out = static_cast<uInt>(outputBufferSize);
    stream.next_out = &compressedData[0];

    result = deflate(&stream, Z_FINISH);
    if (result != Z_STREAM_END) {
        deflateEnd(&stream);
        return compressedData;
    }

    deflateEnd(&stream);

    compressedData.resize(outputBufferSize - stream.avail_out);

    std::cout << std::endl;
    std::cout << "Compressed Data (Binary): ";
    for (size_t i = 0; i < 100 && i < compressedData.size(); ++i) {
        Bytef byte = compressedData[i];
        // std::cout << "\\x";
        for (int bit = 7; bit >= 0; --bit) {
            std::cout << ((byte >> bit) & 1);
        }
        std::cout << " ";
    }
    std::cout << std::dec << std::endl;

    return compressedData;
}


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
        std::vector<Bytef> compressRes = compressData(dresult->buffer,  dresult->size, 4);

        // cast to unsig char* for undoShuffle
        unsigned char* buf = reinterpret_cast<unsigned char*>(dresult->buffer);
        for (uLong i = 0; i < dresult->size; i++) {
            unsigned char byteElement = static_cast<unsigned char>(buf[i]);
        }
        
        std::cout << std::endl;
        std::cout << "After Shuffle, print bytes from index " << static_cast<unsigned long>(startIndex) << " to " << static_cast<unsigned long>(endIndex) << " as binary bytes..." << std::endl;
        std::cout << std::endl;

        // numcodecs shuffle
        unsigned char* dest = new unsigned char[dresult->size];
        undoShuffle(buf, dest, 4, dresult->size);

        for (int i = startIndex; i <= endIndex; i++) {
            // Convert each character to its binary representation
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
            std::cout << floatArr[i] << " ";
        }
        std::cout << std::endl;

        delete[] dresult->buffer;
        delete[] dest;
        delete dresult;

    } else {
        std::cerr << "Error: " << getObjectOutcome.GetError().GetExceptionName() << ": " << getObjectOutcome.GetError().GetMessage() << std::endl;
    }

}
#endif


/**
 * @brief main entry point for numpy.frombuffer(); call halpers based on dtype
 * @param 
 * @return void
 * @note must account for dtype reading e.g. dtype='<f4'
 * https://numpy.org/doc/stable/reference/generated/numpy.frombuffer.html
 */
void bufToArr(unsigned char* buf, std::string dtype) {
    // TODO
    if (dtype == "<f4") {

    }
    else {
        std::cout << "reading for this dtype not implemented" << std::endl;

    }

}


