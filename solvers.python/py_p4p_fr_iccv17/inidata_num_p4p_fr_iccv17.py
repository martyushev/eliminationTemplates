import numpy as np

def inidata_num_p4p_fr_iccv17():
    data = [None]*2
    data[0] = np.random.randn(8,4)
    data[1] = np.random.randn(4,8)
    return data