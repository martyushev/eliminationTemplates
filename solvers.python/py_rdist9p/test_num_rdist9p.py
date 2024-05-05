from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_rdist9p import inidata_num_rdist9p, coefs_rdist9p, red_73x97_rdist9p

def test_num_rdist9p():
    seed(23)
    N = 1000
    d = 24

    stats = ini_stats('rdist9p')

    for i in range(N):
        data = inidata_num_rdist9p()
        C,U = coefs_rdist9p(data)

        tic = time()
        S = red_73x97_rdist9p(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)