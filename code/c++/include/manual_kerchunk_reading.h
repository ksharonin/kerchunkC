/**
 * @file manual_kerchunk_reading.h
 * @brief hardcoded methods to stream bytes and convert to data chunks from netCDF
 * @version 0.1
 */

#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include <zlib.h>
using namespace std;

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

        std::cout << "Successfully retrieved '" << objectName << "' from '"
                << bucketName << "'." << std::endl;


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
 */
void manualKerchunkRead(Aws::String bucketName, 
                        Aws::String objectName, 
                        Aws::S3::S3Client client,
                        int startByte, 
                        int numBytes, 
                        char decompressor[],
                        char filters[]) {
    // TODO - recreate:
    // buf = zlib.decompress(content)
    // buf = numcodecs.shuffle.Shuffle(4).decode(buf)
    // chunk = np.frombuffer(buf, dtype='<f4')

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
        uLong destSize = static_cast<uLong>(retrievedBytes.size() * 2); // this can be dynamically resized inside
        Bytef* outputPtr = nullptr;

        // zlib decompress
        outputData.assign(outputPtr, outputPtr + destSize);

        // numcodecs shuffle

        // numpy decode read


    } else {
        std::cerr << "Error: " << getObjectOutcome.GetError().GetExceptionName() << ": " << getObjectOutcome.GetError().GetMessage() << std::endl;
    }

}

#endif

/**
 * @brief zlib decompression of byte stream
 * @param 
 * @return void
 * https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/include/util/compress/zlib/zlib.h 
 * 
 */
uLong decompressZlib(Bytef* compressedData, Bytef* outputData, uLong compressedSize, uLong destSize) {

    Bytef* destBuffer = new Bytef[destSize];
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = 0;
    stream.next_in = Z_NULL;

    int result = inflateInit(&stream);
    if (result != Z_OK) {
        // init error handling
        delete[] destBuffer;
        return;
    }

    // num bytes of input stream + input stream address
    stream.avail_in = static_cast<uInt>(compressedSize); 
    stream.next_in = compressedData;
    // out size + dest
    stream.avail_out = static_cast<uInt>(destSize);
    stream.next_out = destBuffer;

    result = inflate(&stream, Z_NO_FLUSH);

    // retry / grow buf until can fit all data in
    while (result == Z_BUF_ERROR) {
        if (destSize >= pow(2.0, 31.0)) {
            throw std::runtime_error("excessive size of destSize, failed zlib decompression");
            return;
        }
        delete[] destBuffer;
        destSize *= 2;
        destBuffer = new Bytef[destSize];
        stream.next_out = destBuffer;
        stream.avail_out = static_cast<uInt>(destSize);
        result = inflate(&stream, Z_NO_FLUSH);
    }

    if (result != Z_STREAM_END) {
        // decompression error handling
        delete[] destBuffer;
        inflateEnd(&stream);
        return;
    }
    inflateEnd(&stream);
    // destBuffer now has inflated data, copy over to other stack memory
    outputData = new Bytef[destSize];
    std::memcpy(outputData, destBuffer, destSize);
    // release memory
    delete[] destBuffer;

    // indicate final size since it was modified
    return destSize;

}

/**
 * @brief equivalent to numpy.frombuffer()
 * @param 
 * @return void
 * @note must account for dtype reading e.g. dtype='<f4'
 * https://numpy.org/doc/stable/reference/generated/numpy.frombuffer.html
 */
void bufToArr() {
    // TODO

}


/**
 * @brief
 * https://github.com/zarr-developers/numcodecs/blob/main/numcodecs/_shuffle.pyx
 * @param 
 * @return void
 */
void shuffle(std::vector<uint8_t> buf[], char level[]) {

    /*
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cpdef void _doShuffle(const unsigned char[::1] src, unsigned char[::1] des, Py_ssize_t element_size) nogil:
        cdef Py_ssize_t count, i, j, offset, byte_index
        count = len(src) // element_size
        for i in range(count):
            offset = i*element_size
            for byte_index in range(element_size):
                j = byte_index*count + i
                des[j] = src[offset + byte_index] */


    // TODO
}

/**
 * @brief numcodec styled undo byte shuffle
 * https://github.com/zarr-developers/numcodecs/blob/main/numcodecs/_shuffle.pyx
 * @param buf, level
 * @return void
 */
void undoShuffle(std::vector<uint8_t> buf[], char level[]){
    /*
    @cython.boundscheck(False)
    @cython.wraparound(False)
    cpdef void _doUnshuffle(const unsigned char[::1] src, unsigned char[::1] des, Py_ssize_t element_size) nogil:
        cdef Py_ssize_t count, i, j, offset, byte_index
        count = len(src) // element_size
        for i in range(element_size):
            offset = i*count
            for byte_index in range(count):
                j = byte_index*element_size + i
                des[j] = src[offset+byte_index] */

    // TODO

}
