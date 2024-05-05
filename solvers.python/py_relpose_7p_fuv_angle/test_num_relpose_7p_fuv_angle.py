from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_relpose_7p_fuv_angle import inidata_num_relpose_7p_fuv_angle, coefs_relpose_7p_fuv_angle, red_26x33_relpose_7p_fuv_angle

def test_num_relpose_7p_fuv_angle():
    seed(23)
    N = 1000
    d = 6

    stats = ini_stats('relpose_7p_fuv_angle')

    for i in range(N):
        data = inidata_num_relpose_7p_fuv_angle()
        C,U = coefs_relpose_7p_fuv_angle(data)

        tic = time()
        S = red_26x33_relpose_7p_fuv_angle(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)