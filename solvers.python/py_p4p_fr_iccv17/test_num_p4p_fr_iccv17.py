from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_p4p_fr_iccv17 import inidata_num_p4p_fr_iccv17, coefs_p4p_fr_iccv17, red_28x40_p4p_fr_iccv17

def test_num_p4p_fr_iccv17():
    seed(23)
    N = 1000
    d = 12

    stats = ini_stats('p4p_fr_iccv17')

    for i in range(N):
        data = inidata_num_p4p_fr_iccv17()
        C,U = coefs_p4p_fr_iccv17(data)

        tic = time()
        S = red_28x40_p4p_fr_iccv17(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)