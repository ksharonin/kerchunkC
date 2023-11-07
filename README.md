# KerchunkC - Draft Extension of Kerchunk into C/C++ functionality

## Summary
C++ extensions of driver to read virtual Zarr datasets described in JSON metadata format. Optimize s3 reading performance and mult-dimensional reconstruction of array datasets.

See issue here: https://github.com/Unidata/netcdf-c/issues/2777

## C++ Files (../code/c++)
- Call chain overview:
    - `main.cpp` -> `json_parse.h` -> `kerchunk_read.h` -> `prin_helpers.h` -> `mult_dim_form.h` -> Finish

### src
- `main.cpp`: main entry point for program; key calls include: `json_parse()` and `kerchunk_read()`

### Include
- `config.h`: inputs and settings for program
    - e.g. `HARDCODED_CHUNK_INDEX`, `HARDCODED_JSON_PATH`
- `custom_structs.h`
- `json_parse.h`:
- `json.hpp`: nholmann json processing library
- `kerchunk_read.h`: given JSON metadata, read s3 stream and perform decompression, shuffling, etc until original array obtained. Calls on `mult_dim_form.h` to regain full dimensions
- `mult_dim_form.h`: given flat array, reconstruct the full dimensions as originally stored (bytes read as single flat dimensions from s3 stream)
- `print_helpers.h`: debug printer functions, controlled by the constant `DEBUG_PRINT_ON` in `config.h`

## Jupyter Files (../code/jupyter)
- `make_kerchunk_refs.ipynb`: ipynb to generate JSON metadata from select s3 object
- `range_req_dynamic.ipynb`: python edition of kerchunk process; use as verification and testing of c++ addition. Includes s3 byte stream, zlib decompression, unshuffle, dtype processing, and xarray comparison

