import numpy as np

def inidata_num_4pra():
    data = [None]*3
    data[0] = np.random.randn(3,4)
    data[1] = np.random.randn(3,4)
    data[2] = np.random.randn(1,1)
    return data