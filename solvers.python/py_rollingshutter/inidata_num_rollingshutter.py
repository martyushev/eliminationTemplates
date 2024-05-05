import numpy as np

def inidata_num_rollingshutter():
    data = [None]*6
    data[0] = np.random.randn(9,1)
    data[1] = np.random.randn(9,1)
    data[2] = np.random.randn(9,1)
    data[3] = np.random.randn(9,1)
    data[4] = np.random.randn(9,1)
    data[5] = np.random.randn(9,1)
    return data