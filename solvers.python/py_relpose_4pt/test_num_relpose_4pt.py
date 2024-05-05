from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_relpose_4pt import inidata_num_relpose_4pt, coefs_relpose_4pt, red_72x108_relpose_4pt

def test_num_relpose_4pt():
    seed(23)
    N = 1000
    d = 20

    stats = ini_stats('relpose_4pt')

    for i in range(N):
        data = inidata_num_relpose_4pt()
        C,U = coefs_relpose_4pt(data)

        tic = time()
        S = red_72x108_relpose_4pt(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)