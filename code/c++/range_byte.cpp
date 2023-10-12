#include <iostream>
#include <aws/core/Aws.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/model/GetObjectRequest.h>
#include <fstream>

#ifndef STREAM_BYTES

int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    {
        const Aws::String bucketName = "era5-pds";
        const Aws::String objectName = "2020/01/data/air_pressure_at_mean_sea_level.nc";

        Aws::Client::ClientConfiguration clientConfig;
        // optional: set to the AWS Region in which the bucket was created (overrides config file).
        // clientConfig.region = "us-east-1";


        Aws::S3::S3Client client(clientConfig);
        Aws::S3::Model::GetObjectRequest request;

        request.SetBucket(bucketName);
        request.SetKey(objectName);

        Aws::S3::Model::GetObjectOutcome outcome =
                client.GetObject(request);

        if (!outcome.IsSuccess()) {
            const Aws::S3::S3Error &err = outcome.GetError();
            std::cerr << "Error: GetObject: " <<
                    err.GetExceptionName() << ": " << err.GetMessage() << std::endl;
        }
        else {
            std::cout << "Successfully retrieved '" << objectName << "' from '"
                    << bucketName << "'." << std::endl;
        }

        if (outcome.IsSuccess()) {
        std::cout << "GetObject operation was successful for nc." << std::endl;
        } else {
            const Aws::S3::S3Error &err = outcome.GetError();
            std::cerr << "Error: GetObject: " << err.GetExceptionName() << ": " << err.GetMessage() << std::endl;
        }
    }
    Aws::ShutdownAPI(options);

    return 0;
}

#endif // STREAM_BYTES