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
#include "detect_dtype.h"

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
std::vector<float> scaleAndOffset(const std::vector<T>& data, 
                            float scale_factor, 
                            float add_offset) {
    static_assert(std::is_arithmetic<T>::value, "Type T must be numeric");
    std::vector<float> scaledData;
    for (const T& value : data) {
        float scaledValue = static_cast<float>((static_cast<float>(value) * scale_factor) + add_offset);
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
        throw std::runtime_error("fatal: Z_DATA_ERROR; make sure the json meta data and file path align");
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

/**
 * @brief generic buf to template type T
 * 
 * @tparam T 
 * @param data 
 * @param dataSize 
 * @param dataArray 
 * @param isLittleEndian 
 */
template<typename T>
void fromBufToType_ALL(unsigned char* data, std::size_t dataSize, std::vector<T>& dataArray, bool isLittleEndian) {
    if (dataSize % sizeof(T) != 0) {
        std::cerr << "ERR: invalid data size for provided T. It must be a multiple of sizeof(" << typeid(T).name() << ")." << std::endl;
        return;
    }

    std::size_t numElements = dataSize / sizeof(T);
    dataArray.resize(numElements);

    for (std::size_t i = 0; i < numElements; ++i) {
        std::memcpy(&dataArray[i], &data[i * sizeof(T)], sizeof(T));
        // not lil endian system but structure requires it
        if (!SYS_LITTLE_ENDIAN && isLittleEndian) {
            swapBytesAllType(dataArray[i]);
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
                        float add_offset,
                        float scale_factor,
                        int elementsize
                        ) {

    // local req flag - assume path stays constant with paired JSON
    std::vector<unsigned char> retrievedBytes;
    // timers for local reading process, exclude multi-layer construction
    std::chrono::time_point<std::chrono::system_clock> start_local;
    std::chrono::time_point<std::chrono::system_clock> end_local;

    if (USE_LOCAL) {

        if (TIMER_LOCAL_PROCESS) {
            start_local = std::chrono::system_clock::now();
        }

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

    // prep for numcodecs shuffle
    unsigned char* dest = new unsigned char[dresult->size];
    std::size_t len = static_cast<std::size_t>(dresult->size);

    // apply corresponding filters
    std::string shuffle_type = "shuffle";
    std::string zlib_type = "zlib";
    std::string no_filter = "";

    if (filters == shuffle_type) {
        // undoShuffle(buf, dest, 4, len);
        undoShuffle(buf, dest, elementsize, len);
        _debugPrintAfterUnshuffle(0, 101, dest);
    } else {
        // with null case it will produce an empty str
        if (filters != zlib_type && filters != no_filter) {
            throw std::runtime_error("Fatal: Unknown filter encountered, inspect in kerchunk_read.h");
        }
        // copy over into dest - assumes no other but zlib applied
        std::memcpy(dest, buf, dresult->size);
    }

    // NOTE: suppressed multi layer representation
    layer_t::data_t out;

    // fetch dtype info
    TypeInfo info = parseDtype(dtype);
    Endianness endianness = info.endianness;
    DataType dataType = info.dataType;
    std::size_t size_det = info.size;

    // TODO: find a better way to move rather than outside init
    // TODO check up on double usage in 64 form

    // master output
    std::vector<float> floatArr;

    // float - also used as output form
    std::vector<float> floatArr32;
    std::vector<double> floatArr64;
    // ints
    std::vector<int8_t> intArr8;
    std::vector<int16_t> intArr16;
    std::vector<int32_t> intArr32;
    std::vector<int64_t> intArr64;
    // uint
    std::vector<uint8_t> uintArr8;
    std::vector<uint16_t> uintArr16;
    std::vector<uint32_t> uintArr32;
    std::vector<uint64_t> uintArr64;

    // TODO
    // other types

    switch (dataType) {
        case DataType::FLOATING_POINT:
            switch (size_det) {
                case 4:
                    // std::vector<float> floatArr;
                    fromBufToType_ALL(dest, dresult->size, floatArr32, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(floatArr32, scale_factor, add_offset);
                    break;
                case 8:
                    fromBufToType_ALL(dest, dresult->size, floatArr64, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(floatArr64, scale_factor, add_offset);
                    break;
                default:
                    throw std::runtime_error("Unknown float size encountered");
                    break;
            }
            break;
        case DataType::INTEGER:
            // std::vector<int16_t> intArr;
            // std::vector<float> final_output;
            switch (size_det) {
                case 1: // 1*8 == 8
                    fromBufToType_ALL(dest, dresult->size, intArr8, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(intArr8, scale_factor, add_offset);
                    break;
                case 2: // 2*8 == 16
                    fromBufToType_ALL(dest, dresult->size, intArr16, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(intArr16, scale_factor, add_offset);
                    break;
                case 4: // 4*8 == 32
                    fromBufToType_ALL(dest, dresult->size, intArr32, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(intArr32, scale_factor, add_offset);
                    break;
                case 8: // 8*8 == 64
                    fromBufToType_ALL(dest, dresult->size, intArr64, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(intArr64, scale_factor, add_offset);
                    break;
                default:
                    throw std::runtime_error("Unknown int size encountered");
                    break;
            }
            break;
        
        case DataType::UNSIGNED_INTEGER:
            switch (size_det) {
                case 1: 
                    fromBufToType_ALL(dest, dresult->size, uintArr8, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(uintArr8, scale_factor, add_offset);
                    break;
                case 2:
                    fromBufToType_ALL(dest, dresult->size, uintArr16, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(uintArr16, scale_factor, add_offset);
                    break;
                case 4:
                    fromBufToType_ALL(dest, dresult->size, uintArr32, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(uintArr32, scale_factor, add_offset);
                    break;

                case 8:
                    fromBufToType_ALL(dest, dresult->size, uintArr64, endianness == Endianness::LITTLE);
                    floatArr = scaleAndOffset(uintArr64, scale_factor, add_offset);
                    break;

                default:
                    throw std::runtime_error("Unknown uint size encountered");
                    break;
            }
            break;
        default:
            throw std::runtime_error("Unknown dataType encountered / unimplemented.");
            break;
    }

    if (PRINT_WHOLE_BUFFER) {
        std::cout << "complete fetched buffer result : \n" << std::endl;

        for (const auto& element : floatArr) {
            std::cout << static_cast<float>(element) << " ";
        }
        std::cout << "\n" << std::endl;

        std::cout << "TEMPORARY: first element of given chunk" << std::endl;
        std::cout << static_cast<float>(floatArr[0]) << std::endl;
        std::cout << static_cast<float>(floatArr[1]) << std::endl;
        std::cout << static_cast<float>(floatArr[2]) << std::endl;
        std::cout << static_cast<float>(floatArr[3]) << std::endl;
        std::cout << static_cast<float>(floatArr[4]) << std::endl;
    }


    if (TIMER_LOCAL_PROCESS) {
        end_local = std::chrono::system_clock::now();
        std::chrono::duration<double> elapsed_seconds = end_local-start_local;
        std::time_t end_time = std::chrono::system_clock::to_time_t(end_local);
        std::cout << std::endl;
        std::cout << std::endl;
        std::cout << "TIMER_LOCAL_PROCESS: finished computation at " << std::ctime(&end_time)
                   << "elapsed time: " << elapsed_seconds.count() << "s"
                   << std::endl;
    }

    // try: reconstruct chunk to proper dimensions 
    if (PRINT_AT_TEST_VISIT) {
        std::cout << "NOTE MULTILAYERING SUPPRESSED FOR LOCAL PERFORMANCE: \n" << std::endl;
        std::cout << "print at indices: " << harcoded_test_visit[0] << "," << harcoded_test_visit[1] << "," << harcoded_test_visit[2] << std::endl;
        printAtIndices(out,harcoded_test_visit);
    }
    
    delete[] dresult->buffer;
    delete[] dest;
    delete dresult;

}
#endif



