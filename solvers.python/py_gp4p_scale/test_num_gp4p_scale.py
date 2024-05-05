from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_gp4p_scale import inidata_num_gp4p_scale, coefs_gp4p_scale, red_40x52_gp4p_scale

def test_num_gp4p_scale():
    seed(23)
    N = 1000
    d = 8

    stats = ini_stats('gp4p_scale')

    for i in range(N):
        data = inidata_num_gp4p_scale()
        C,U = coefs_gp4p_scale(data)

        tic = time()
        S = red_40x52_gp4p_scale(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)