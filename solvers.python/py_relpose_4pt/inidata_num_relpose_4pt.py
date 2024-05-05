import numpy as np

def inidata_num_relpose_4pt():
    data = [None]*3
    data[0] = np.random.randn(2,4)
    data[1] = np.random.randn(2,4)
    data[2] = np.random.randn(1,1)
    return data