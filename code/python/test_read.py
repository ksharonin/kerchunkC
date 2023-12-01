#!/usr/bin/env python

import xarray as xr
import fsspec

HARDCODED_JSON_DIR = "/Users/katrinasharonin/Downloads/GOES_17_recreation/results/final/2023-006.json"

target = fsspec.filesystem("reference", 
                           fo=HARDCODED_JSON_DIR).get_mapper()
# target = fsspec.filesystem(
#     "reference",
#     fo="results/final-compressed/2022-002.json.zst",
#     compression='zstd'
# )
dat = xr.open_zarr(target, consolidated=False)

# Try extracting a time series for a random location
dat
# tseries = dat.isel(bandn=1, x=4000, y=7000, time=slice(50,100)).Rad
tseries = dat.isel(bandn=1, x=0, y=1, time=slice(0,50)).Rad
tseries.values

result = tseries.persist()
progress(result)
# ~70 sec to read 100 time steps

# Try calculating a global mean
globmean = dat.isel(t=slice(200, 300)).Rad.mean(["t"])
rmean = globmean.persist()
progress(rmean)

# %time globmean = dat.Rad.mean(["t"])