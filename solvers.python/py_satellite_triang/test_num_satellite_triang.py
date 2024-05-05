from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_satellite_triang import inidata_num_satellite_triang, coefs_satellite_triang, red_74x104_satellite_triang

def test_num_satellite_triang():
    seed(23)
    N = 1000
    d = 27

    stats = ini_stats('satellite_triang')

    for i in range(N):
        data = inidata_num_satellite_triang()
        C,U = coefs_satellite_triang(data)

        tic = time()
        S = red_74x104_satellite_triang(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)