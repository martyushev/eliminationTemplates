from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_hyb51f import inidata_num_hyb51f, coefs_hyb51f, red_598x684_hyb51f

def test_num_hyb51f():
    seed(23)
    N = 1000
    d = 56

    stats = ini_stats('hyb51f')

    for i in range(N):
        data = inidata_num_hyb51f()
        C,U = coefs_hyb51f(data)

        tic = time()
        S = red_598x684_hyb51f(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)