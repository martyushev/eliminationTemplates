from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_rollingshutter import inidata_num_rollingshutter, coefs_rollingshutter, red_40x52_rollingshutter

def test_num_rollingshutter():
    seed(23)
    N = 1000
    d = 8

    stats = ini_stats('rollingshutter')

    for i in range(N):
        data = inidata_num_rollingshutter()
        C,U = coefs_rollingshutter(data)

        tic = time()
        S = red_40x52_rollingshutter(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)