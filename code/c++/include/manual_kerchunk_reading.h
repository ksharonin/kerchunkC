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
using namespace std;

#ifndef PRINT_BYTES
#define PRINT_BYTES
/**
 * @brief stream bytes from single specified s3 object, assumes configd/set client
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
 */
void manualKerchunkRead(Aws::String bucketName, 
                        Aws::String objectName, 
                        Aws::S3::S3Client client,
                        int startByte, 
                        int numBytes, 
                        char decompressor[],
                        char filters[]) {
    // TODO
    // ['era5-pds/2020/01/data/air_pressure_at_mean_sea_level.nc', 19226, 256358]
    // "compressor":{"id":"zlib","level":4},"dtype":"<f4",
    // "fill_value":9.969209968386869e+36,"filters":[{"elementsize":4,"id":"shuffle"}]
    
    // recreate:
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




}

#endif

/**
 * @brief
 * @param 
 * @return void
 */
void decompressZlib() {
    // TODO

}

/**
 * @brief equivalent to numpy.frombuffer()
 * @param 
 * @return void
 * @note must account for dtype reading e.g. dtype='<f4'
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
