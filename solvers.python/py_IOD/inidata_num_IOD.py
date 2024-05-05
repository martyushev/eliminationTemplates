import numpy as np

def inidata_num_IOD():
    data = [None]*5
    data[0] = np.random.randn(4,2)
    data[1] = np.random.randn(4,2)
    data[2] = np.random.randn(4,2)
    data[3] = np.random.randn(4,2)
    data[4] = np.random.randn(4,2)
    return data