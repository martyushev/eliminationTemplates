import numpy as np

def inidata_num_8ptF_radial():
    data = [None]*3
    data[0] = np.random.randn(6,7)
    data[1] = np.random.randn(2,2)
    data[2] = np.random.randn(2,2)
    return data