from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_stitching import inidata_num_stitching, coefs_stitching, red_6x30_stitching

def test_num_stitching():
    seed(23)
    N = 1000
    d = 18

    stats = ini_stats('stitching')

    for i in range(N):
        data = inidata_num_stitching()
        C,U = coefs_stitching(data)

        tic = time()
        S = red_6x30_stitching(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)