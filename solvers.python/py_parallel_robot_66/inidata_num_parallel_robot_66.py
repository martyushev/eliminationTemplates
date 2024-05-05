import numpy as np

def inidata_num_parallel_robot_66():
    data = [None]*3
    data[0] = np.random.randn(3,6)
    data[1] = np.random.randn(3,6)
    data[2] = np.random.randn(1,6)
    return data