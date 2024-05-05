import numpy as np

def inidata_num_relpose_7p_fuv_angle():
    data = [None]*2
    data[0] = np.random.randn(3,3)
    data[0][:,2] = data[0][:,0]*np.random.randn()+data[0][:,1]*np.random.randn()
    data[1] = np.random.randn(1,1)
    return data