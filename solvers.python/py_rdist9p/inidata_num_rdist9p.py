import numpy as np

def inidata_num_rdist9p():
    data = [None]*2
    data[0] = np.random.randn(2,9)
    data[1] = np.random.randn(2,9)
    return data