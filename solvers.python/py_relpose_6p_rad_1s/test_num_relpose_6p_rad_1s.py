from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_relpose_6p_rad_1s import inidata_num_relpose_6p_rad_1s, coefs_relpose_6p_rad_1s, red_14x40_relpose_6p_rad_1s

def test_num_relpose_6p_rad_1s():
    seed(23)
    N = 1000
    d = 26

    stats = ini_stats('relpose_6p_rad_1s')

    for i in range(N):
        data = inidata_num_relpose_6p_rad_1s()
        C,U = coefs_relpose_6p_rad_1s(data)

        tic = time()
        S = red_14x40_relpose_6p_rad_1s(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)