from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_l2_3view_triang import inidata_num_l2_3view_triang, coefs_l2_3view_triang, red_190x227_l2_3view_triang

def test_num_l2_3view_triang():
    seed(23)
    N = 1000
    d = 31

    stats = ini_stats('l2_3view_triang')

    for i in range(N):
        data = inidata_num_l2_3view_triang()
        C,U = coefs_l2_3view_triang(data)

        tic = time()
        S = red_190x227_l2_3view_triang(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)