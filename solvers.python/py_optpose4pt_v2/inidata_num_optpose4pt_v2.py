import numpy as np

def inidata_num_optpose4pt_v2():
    data = [None]*2
    data[0] = np.random.randn(3,4)
    data[1] = np.random.randn(16,1)
    return data