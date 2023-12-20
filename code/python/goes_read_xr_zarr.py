#!/usr/bin/env python

import xarray as xr
import fsspec
import cftime
from dask.distributed import Client, LocalCluster, progress

HARDCODED_JSON_DIR = "/Users/katrinasharonin/Downloads/GOES_17_recreation/results/final/2023-006.json"

target = fsspec.filesystem("reference", 
                           fo=HARDCODED_JSON_DIR).get_mapper()
# target = fsspec.filesystem(
#     "reference",
#     fo="results/final-compressed/2022-002.json.zst",
#     compression='zstd'
# )
dat = xr.open_zarr(target, consolidated=False)

# tseries = dat.isel(bandn=1, x=4000, y=7000, time=slice(50,100)).Rad
print("TSERIES ACCESS")
tseries = dat.isel(bandn=0, x=900, y=8000, time=slice(0,10)).Rad
tseries.values
print(tseries.values)

# cluster = LocalCluster()
# client = Client(cluster)

# result = tseries.persist()
# progress(result)
# result.compute()
# ~70 sec to read 100 time steps

# Try calculating a global mean
# globmean = dat.isel(t=slice(0, 6)).Rad.mean(["t"])
globmean = dat.isel(time=slice(0, 6)).Rad.mean(["time"])
print(globmean)
# rmean = globmean.persist()
# progress(rmean)