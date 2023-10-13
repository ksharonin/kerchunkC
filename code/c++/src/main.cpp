/**
 * @file main.cpp
 * @version 0.1
 */

#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>
#include "manual_kerchunk_reading.h"
using namespace std;

#ifndef MAIN_RUN

int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    {
        const Aws::String bucketName = "era5-pds";
        const Aws::String objectName = "2020/01/data/air_pressure_at_mean_sea_level.nc";
        char bytesRange[] = "bytes=0-49";

        Aws::Client::ClientConfiguration clientConfig;
        // optional: set to the AWS Region in which the bucket was created (overrides config file).
        // clientConfig.region = "us-east-1";
        Aws::S3::S3Client client(clientConfig);

        // test byte stream
        printByteStream(bucketName, objectName, bytesRange, client);

        // now try reading for these hardcoded vals
        // ['era5-pds/2020/01/data/air_pressure_at_mean_sea_level.nc', 19226, 256358]
        // "compressor":{"id":"zlib","level":4},"dtype":"<f4",
        // "fill_value":9.969209968386869e+36,"filters":[{"elementsize":4,"id":"shuffle"}]
        
        // recreate:
        // buf = zlib.decompress(content)
        // buf = numcodecs.shuffle.Shuffle(4).decode(buf)
        // chunk = np.frombuffer(buf, dtype='<f4')

        
        

    }
    Aws::ShutdownAPI(options);

    return 0;
}

#endif // MAIN_RUN