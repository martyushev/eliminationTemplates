import numpy as np

def inidata_num_pose_35pt():
    data = [None]*3
    data[0] = np.random.randn(3,4)
    data[1] = np.random.randn(4,1)
    data[2] = np.random.randn(3,1)
    return data