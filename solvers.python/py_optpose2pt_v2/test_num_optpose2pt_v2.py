from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_optpose2pt_v2 import inidata_num_optpose2pt_v2, coefs_optpose2pt_v2, red_87x120_optpose2pt_v2

def test_num_optpose2pt_v2():
    seed(23)
    N = 1000
    d = 24

    stats = ini_stats('optpose2pt_v2')

    for i in range(N):
        data = inidata_num_optpose2pt_v2()
        C,U = coefs_optpose2pt_v2(data)

        tic = time()
        S = red_87x120_optpose2pt_v2(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)