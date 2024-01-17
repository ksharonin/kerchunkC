#include <stdio.h>
#include <stdlib.h>
#include "hdf5.h"

herr_t visit_callback(hid_t loc_id, const char *name, const H5L_info_t *info, void *opdata) {
    printf("%s\n", name);
    return 0;
}

void open_hdf5_file(const char *file_path) {
    hid_t file_id;

    // Open the HDF5 file in read-only mode
    file_id = H5Fopen(file_path, H5F_ACC_RDONLY, H5P_DEFAULT);

    if (file_id < 0) {
        fprintf(stderr, "Error: Unable to open file '%s'\n", file_path);
        exit(EXIT_FAILURE);
    }

    // Print information about the file
    printf("File Contents:\n");
    printf("----------------\n");

    // Iterate through objects in the root group (datasets, groups, etc.)
    H5Lvisit(file_id, H5_INDEX_NAME, H5_ITER_NATIVE, visit_callback, NULL);

    // Close the HDF5 file
    H5Fclose(file_id);
}

int main() {
    // Specify the path to your HDF5 file
    const char *hdf5_file_path = "path/to/your/file.h5";

    // Call the function to open and inspect the HDF5 file
    open_hdf5_file(hdf5_file_path);

    return 0;
}
