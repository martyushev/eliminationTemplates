from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_toa_46 import inidata_num_toa_46, coefs_toa_46, red_427x475_toa_46

def test_num_toa_46():
    seed(23)
    N = 1000
    d = 38

    stats = ini_stats('toa_46')

    for i in range(N):
        data = inidata_num_toa_46()
        C,U = coefs_toa_46(data)

        tic = time()
        S = red_427x475_toa_46(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)