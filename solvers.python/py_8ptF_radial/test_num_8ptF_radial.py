from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_8ptF_radial import inidata_num_8ptF_radial, coefs_8ptF_radial, red_19x39_8ptF_radial

def test_num_8ptF_radial():
    seed(23)
    N = 1000
    d = 16

    stats = ini_stats('8ptF_radial')

    for i in range(N):
        data = inidata_num_8ptF_radial()
        C,U = coefs_8ptF_radial(data)

        tic = time()
        S = red_19x39_8ptF_radial(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)