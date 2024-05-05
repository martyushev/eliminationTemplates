from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_toy import inidata_num_toy, coefs_toy, red_14x22_toy

def test_num_toy():
    seed(23)
    N = 1000
    d = 8

    stats = ini_stats('toy')

    for i in range(N):
        data = inidata_num_toy()
        C,U = coefs_toy(data)

        tic = time()
        S = red_14x22_toy(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)