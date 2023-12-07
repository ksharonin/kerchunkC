# mimic the goes read, step into zarr library for offset debug

import zlib
import json
import boto3
import boto
import fsspec
import fsspec.utils
import numpy as np
import xarray as xr
import zarr
import os
import ujson
import s3fs
import numcodecs
import h5py

import kerchunk.combine
from kerchunk.zarr import single_zarr
from kerchunk.combine import MultiZarrToZarr
from kerchunk.hdf import SingleHdf5ToZarr
from pathlib import Path

def bytes_to_binary(data):
    binary_string = ' '.join(format(byte, '08b') for byte in data)
    return binary_string

# taken directly from Rad metadata
# "{\"chunks\":[1,1,226,226],\"compressor\":null,
# \"dtype\":\"<i2\",\"fill_value\":1023,\"filters\":
# [{\"id\":\"zlib\",\"level\":1}],\"order\":\"C\",\
#   "shape\":[1,6,10848,10848],\"zarr_format\":2}"

# for index of 0.0.0.17:

start_byte = 25830
num_bytes = 806
dtype_extract = '<i2'
file_path =  "/Users/katrinasharonin/Downloads/GOES_17_recreation/GOES_17_Sample_Data/2023/006/05/OR_ABI-L1b-RadF-M6C01_G17_s20230060550309_e20230060559376_c20230060559423.nc"
add_offset = -25.9366474
scale_factor = 0.812106371

# local file read extract 
with open(file_path, 'rb') as file:
    file.seek(start_byte)
    content = file.read(num_bytes)

print('\n')
print('fetched sample bytes from nc')
print(content[:50])
binary_representation = bytes_to_binary(content[:40])
print(binary_representation)

buf = zlib.decompress(content)

print('\n')
print('after decompressing:')
for value in buf[:10]:
    print(bin(value)[2:].zfill(8) + " ", end = '')

# numpy dtype application
chunk = np.frombuffer(buf, dtype=dtype_extract)

# apply offset and scaling on data
chunk_scale_off = [x * scale_factor + add_offset for x in chunk]
# chunk_scale_off = [x / scale_factor - add_offset for x in chunk]

print('\n')
print('chunk 1 using 0.0.0.17 indexing')
print(chunk[51050:])

print('\n')
print('applied offset and scale')
print(len(chunk_scale_off))
print(chunk_scale_off[51050:])