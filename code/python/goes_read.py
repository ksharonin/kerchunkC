import zlib
import json
import numpy as np
import xarray as xr
import time
import fsspec

json_path = "/discover/nobackup/ashiklom/aist-eso/goes-benchmarks/results/final/2022-184.json"

ds = xr.open_dataset("reference://",mask_and_scale=True, engine="zarr", backend_kwargs={
                    "consolidated": False,
                    "storage_options": {"fo": json_path}
                    })


# aim for 17th index for vals
subset = ds.isel(band=slice(0, 1), time=slice(0, 1), x=slice(3842, 4068), y=slice(0, 226))["Rad"]
print(subset)

# Retrieve the values as a NumPy array
values = subset.values

# print(values)
# [226][3842:4068]
print(values[0][0][225])
