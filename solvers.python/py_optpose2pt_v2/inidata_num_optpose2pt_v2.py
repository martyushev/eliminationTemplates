import numpy as np

def inidata_num_optpose2pt_v2():
    data = [None]*2
    data[0] = np.random.randn(3,2)
    data[1] = np.random.randn(8,1)
    return data