from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_IOD import inidata_num_IOD, coefs_IOD, red_481x561_IOD

def test_num_IOD():
    seed(23)
    N = 1000
    d = 66

    stats = ini_stats('IOD')

    for i in range(N):
        data = inidata_num_IOD()
        C,U = coefs_IOD(data)

        tic = time()
        S = red_481x561_IOD(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)