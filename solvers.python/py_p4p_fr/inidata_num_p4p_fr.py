import numpy as np

def inidata_num_p4p_fr():
    data = [None]*3
    data[0] = np.random.randn(4,4)
    data[1] = np.random.randn(4,4)
    data[2] = np.random.randn(4,8)
    return data