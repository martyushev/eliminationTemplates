import numpy as np

def inidata_num_optpose3pt_v2():
    data = [None]*2
    data[0] = np.random.randn(3,3)
    data[1] = np.random.randn(12,1)
    return data