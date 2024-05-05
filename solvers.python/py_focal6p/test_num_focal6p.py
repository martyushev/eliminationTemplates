from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_focal6p import inidata_num_focal6p, coefs_focal6p, red_11x26_focal6p

def test_num_focal6p():
    seed(23)
    N = 1000
    d = 15

    stats = ini_stats('focal6p')

    for i in range(N):
        data = inidata_num_focal6p()
        C,U = coefs_focal6p(data)

        tic = time()
        S = red_11x26_focal6p(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)