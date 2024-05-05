from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_p4p_fr import inidata_num_p4p_fr, coefs_p4p_fr, red_42x60_p4p_fr

def test_num_p4p_fr():
    seed(23)
    N = 1000
    d = 16

    stats = ini_stats('p4p_fr')

    for i in range(N):
        data = inidata_num_p4p_fr()
        C,U = coefs_p4p_fr(data)

        tic = time()
        S = red_42x60_p4p_fr(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)