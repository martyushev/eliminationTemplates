import numpy as np

def inidata_num_opt_vanishingpoints():
    data = [None]*3
    data[0] = np.random.randn(6,1)
    data[1] = np.random.randn(6,1)
    data[2] = np.random.randn(6,1)
    return data