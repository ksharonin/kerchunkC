#include <stdio.h>
#include <stdlib.h>
#include "hdf5.h"

int main() {
    const char *file_path = "/Users/katrinasharonin/Downloads/OR_ABI-L2-FDCC-M3_G17_s20182390052191_e20182390054564_c20182390055159.nc";
    const char *dataset = "/Power";
    const char *attribute = "_FillValue";

    hid_t file_id;
    hid_t dataset_id;
    hid_t attribute_id;
    hid_t attribute_type;
    hid_t dataspace;
    size_t attr_size, type_msg_size, space_msg_size;

    file_id = H5Fopen(file_path, H5F_ACC_RDONLY, H5P_DEFAULT);

    if (file_id < 0) {
        fprintf(stderr, "Error: Unable to open file '%s'\n", file_path);
        exit(EXIT_FAILURE);
    }


    dataset_id = H5Dopen2(file_id, dataset, H5P_DEFAULT);
    attribute_id = H5Aopen_by_name(file_id, dataset, attribute, H5P_DEFAULT, H5P_DEFAULT);
    attribute_type = H5Aget_type(attribute_id);
    attr_size = H5Aget_storage_size(attribute_id);
    type_msg_size = H5Tget_size(attribute_type);
    dataspace = H5Aget_space(attribute_id);
    space_msg_size = H5Sget_simple_extent_npoints(dataspace) * H5Tget_size(attribute_type);

    printf("Message Size:                                                    %zu\n", attr_size);
    printf("Datatype Message:                                          %lld\n", attribute_type);
    printf("Dataspace Message:                                         %lld\n", dataspace);

    H5Sclose(dataspace);
    H5Tclose(attribute_type);
    H5Aclose(attribute_id);
    H5Dclose(dataset_id);
    H5Fclose(file_id);

    printf("Test complete. Finished with 0 errors.\n");

    return 0;
}

