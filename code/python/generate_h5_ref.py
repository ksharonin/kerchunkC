import kerchunk, fsspec, ujson
from kerchunk import hdf

def process(url, 
            outputfile, 
            storage_options_in={}, 
            storage_options_out={}):
    """ generate h5 ref file using kerchunk known lib
        https://github.com/fsspec/kerchunk/blob/37d75267cbf1c8d6ee1a9a69764cb661aa3f5e29/docs/source/advanced.rst#L30
        class SingleHdf5ToZarr
    """
    transformer = hdf.SingleHdf5ToZarr(url, **storage_options_in)
    refs = transformer.translate()
    with fsspec.open(outputfile, mode="wt", **storage_options_out) as f:
        ujson.dump(refs, f)

# paths are relative to outside of active container
URL = "/Users/katrinasharonin/Downloads/ATL03_20230816235231_08822014_006_01.h5"
OUTPUTFILE = "/Users/katrinasharonin/Downloads/kerchunkC/jsons/ATL03_REF_NONUTM.json"

print("Start JSON extraction from H5 file...")
process(URL, OUTPUTFILE)
print("JSON extraction complete")