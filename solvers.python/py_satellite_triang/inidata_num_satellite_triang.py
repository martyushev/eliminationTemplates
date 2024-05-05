import numpy as np

def inidata_num_satellite_triang():
    data = [None]*3
    data[0] = np.random.randn(20,1)
    data[1] = np.random.randn(20,1)
    data[2] = np.random.randn(20,1)
    return data