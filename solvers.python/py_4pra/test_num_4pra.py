from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_4pra import inidata_num_4pra, coefs_4pra, red_12x36_4pra

def test_num_4pra():
    seed(23)
    N = 1000
    d = 20

    stats = ini_stats('4pra')

    for i in range(N):
        data = inidata_num_4pra()
        C,U = coefs_4pra(data)

        tic = time()
        S = red_12x36_4pra(C,data[2][0,0]**2-1)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)