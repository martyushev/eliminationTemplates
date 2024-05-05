import numpy as np

def inidata_num_r6p():
    data = [None]*3
    data[0] = np.random.randn(2,3)
    data[1] = np.random.randn(3,3)
    data[2] = np.random.randn(6,16)
    return data