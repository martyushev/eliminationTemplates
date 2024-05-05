from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_8ptF_radial_1s import inidata_num_8ptF_radial_1s, coefs_8ptF_radial_1s, red_7x15_8ptF_radial_1s

def test_num_8ptF_radial_1s():
    seed(23)
    N = 1000
    d = 8

    stats = ini_stats('8ptF_radial_1s')

    for i in range(N):
        data = inidata_num_8ptF_radial_1s()
        C,U = coefs_8ptF_radial_1s(data)

        tic = time()
        S = red_7x15_8ptF_radial_1s(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)