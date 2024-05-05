from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_toa_55 import inidata_num_toa_55, coefs_toa_55, red_772x832_toa_55

def test_num_toa_55():
    seed(23)
    N = 1000
    d = 42

    stats = ini_stats('toa_55')

    for i in range(N):
        data = inidata_num_toa_55()
        C,U = coefs_toa_55(data)

        tic = time()
        S = red_772x832_toa_55(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)