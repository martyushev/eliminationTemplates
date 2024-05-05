from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_5p import inidata_num_5p, coefs_5p, red_10x20_5p

def test_num_5p():
    seed(23)
    N = 1000
    d = 10

    stats = ini_stats('5p')

    for i in range(N):
        data = inidata_num_5p()
        C,U = coefs_5p(data)

        tic = time()
        S = red_10x20_5p(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)