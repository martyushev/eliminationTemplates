import numpy as np

def inidata_num_stitching():
    data = [None]*2
    data[0] = np.random.randn(16,1)
    data[1] = np.random.randn(16,1)
    return data