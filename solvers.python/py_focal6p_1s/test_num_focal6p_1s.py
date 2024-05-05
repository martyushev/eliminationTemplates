from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_focal6p_1s import inidata_num_focal6p_1s, coefs_focal6p_1s, red_11x20_focal6p_1s

def test_num_focal6p_1s():
    seed(23)
    N = 1000
    d = 9

    stats = ini_stats('focal6p_1s')

    for i in range(N):
        data = inidata_num_focal6p_1s()
        C,U = coefs_focal6p_1s(data)

        tic = time()
        S = red_11x20_focal6p_1s(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)