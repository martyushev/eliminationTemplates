import numpy as np

def inidata_num_wpnp():
    data = [None]*2
    data[0] = np.random.randn(3,1)
    data[1] = np.random.randn(2,3)
    return data