import numpy as np

def inidata_num_hyb51f():
    data = [None]*3
    data[0] = np.random.randn(2,5)
    data[1] = np.random.randn(2,5)
    data[2] = np.random.randn(3,5)
    return data