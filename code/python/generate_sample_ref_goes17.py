#!/usr/bin/env python

# this is a modified v. of the ashlikom goes reference generator
# generate for single band of GOES17 data 

# modifications:
# hard coded pass of paths 
# remove interactive form

import os
import glob
import xarray as xr

from kerchunk.hdf import SingleHdf5ToZarr
from kerchunk.combine import MultiZarrToZarr

from dask.distributed import Client, LocalCluster, progress
import dask

import ujson
import math
import argparse
import re

INTERACTIVE = False 

if INTERACTIVE:
    import importlib
    import ref_utils
    importlib.reload(ref_utils)
from ref_utils import gen_refs, process_chunk

HARDCODED_DIR = "/Users/katrinasharonin/Downloads/GOES_17_recreation/GOES_17_Sample_Data"
# "/Users/katrinasharonin/Downloads/GOES_17_recreation/GOES_17_Sample_Data/2022/184/23"
#  "/Users/katrinasharonin/Downloads/GOES_17_recreation/GOES_17_Sample_Data"
HARCODED_SAMPLE_FILE = "OR_ABI-L1b-RadF-M6C02_G17_s20221842350319_e20221842359386_c20221842359411.nc"
# "OR_ABI-L1b-RadF-M6C01_G17_s20230060500309_e20230060509376_c20230060509434.nc"

# s20171671145342: is start of scan time
# 4 digit year
# 3 digit day of year
# 2 digit hour
# 2 digit minute
# 2 digit second
# 1 digit tenth of second

# type int
args_year = 2022
args_doy = 184

DDIR = os.path.join(f"{args_year:04d}", f"{args_doy:03d}")
RESULTS = os.path.join("/Users/katrinasharonin/Downloads/GOES_17_recreation/results")
BADFILES = os.path.join(RESULTS, "badfiles") # need?
CHUNKS = os.path.join(RESULTS, "chunks", DDIR)

finaldir = os.path.join(RESULTS, "final")
os.makedirs(finaldir, exist_ok=True)
finalfile = os.path.join(finaldir, f"{args_year:04d}-{args_doy:03d}.json")

CACHEFILE = "goesfiles-all"
# "/css/geostationary/BackStage/GOES-17-ABI-L1B-FULLD" <- contains year/doy/hour... struct etc
BASEPATH = os.path.join(HARDCODED_DIR, DDIR) # replaced css dir with harcoded_dir
print(BASEPATH)
assert os.path.exists(BASEPATH)

if __name__ == '__main__':

    if not INTERACTIVE:
        # does this require 24 hours of folders? currently only have 05 available 
        assert not os.path.exists(finalfile), f"{finalfile} already exists. Exiting..."

    import time
    print(f"Starting at {time.strftime('%c', time.localtime())}")

    os.makedirs(BADFILES, exist_ok=True)
    os.makedirs(CHUNKS, exist_ok=True)

    # Read the file list (or generate it if it doesn't exist)
    if os.path.exists(CACHEFILE):
        print("Using cached list of goes files.")
        with open(CACHEFILE, 'r') as f:
            all_paths = sorted(f.read().splitlines())
            all_paths = [f for f in all_paths if f.endswith(".nc")]
    else:
        print("Generating new GOES file list")
        all_paths = sorted(glob.glob(os.path.join(BASEPATH, '**/*.nc'), recursive=True))
        with open(CACHEFILE, 'w') as f:
            f.write("\n".join(all_paths))

    print(f"Processing {len(all_paths)} files")

    # Launch Dask cluster for parallelization
    if not "cluster" in locals():
        print("Launching dask cluster")
        cluster = LocalCluster()
        client = Client(cluster)
    else:
        print("Using existing dask cluster")

    # Group paths by band
    unique_bands = sorted(set([re.search(r'M\d+C\d+', p).group() for p in all_paths]))
    files_by_band = {band: [f for f in all_paths if band in f] for band in unique_bands}

    makename = lambda x: os.path.join(CHUNKS, x + ".json")
    pathtasks = [dask.delayed(process_chunk)(files, makename(band), BADFILES) for band, files in files_by_band.items()]

    print("Beginning processing individual chunks...")
    start_time = time.time()
    pb = dask.persist(pathtasks)
    progress(pb)
    # dask.compute(pathtasks)
    end_time = time.time()

    elapsed = end_time - start_time
    nfiles = len(all_paths)
    rate = float(nfiles) / elapsed
    print(f"Processed {nfiles} files in {elapsed:.2f} seconds ({rate:.2f} files/sec)")
    print(f"Done at {time.strftime('%c', time.localtime())}")

    chunk_results = dask.compute(pathtasks)

    # Identify common dimensions from the first result
    d0 = xr.open_dataset("reference://", engine="zarr", backend_kwargs={
        "consolidated": False,
        "storage_options": {"fo": chunk_results[0][0]}
    })
    identical_dims = list(d0.dims.keys())
    # identical_dims.remove("band")

    # NOTE: Consolidation here doesn't work neatly because times aren't identical.
    print("Consolidating chunks into one result")
    band_rxp = re.compile(r'.*/M\d+C(\d+).json$')
    fstart_time = time.time()
    day_result = MultiZarrToZarr(
        chunk_results[0],
        coo_map={"bandn": band_rxp},
        coo_dtypes={"bandn": "i4"},
        concat_dims=["bandn"],
        # concat_dims=["band"],
        identical_dims=identical_dims
    ).translate()
    with open(finalfile, "wb") as f:
        f.write(ujson.dumps(day_result).encode())

    fend_time = time.time()
    felapsed = fend_time - fstart_time
    print(f"Time spent consolidating: {felapsed:.2f} seconds")
    print(f"Total time elapsed: {fend_time - start_time:.2f} seconds")
    print(f"All done at {time.strftime('%c', time.localtime())}")