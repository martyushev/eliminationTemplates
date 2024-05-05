from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_r6p import inidata_num_r6p, coefs_r6p, red_66x92_r6p

def test_num_r6p():
    seed(23)
    N = 1000
    d = 20

    stats = ini_stats('r6p')

    for i in range(N):
        data = inidata_num_r6p()
        C,U = coefs_r6p(data)

        tic = time()
        S = red_66x92_r6p(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)