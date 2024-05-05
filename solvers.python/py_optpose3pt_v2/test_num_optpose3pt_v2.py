from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_optpose3pt_v2 import inidata_num_optpose3pt_v2, coefs_optpose3pt_v2, red_297x356_optpose3pt_v2

def test_num_optpose3pt_v2():
    seed(23)
    N = 1000
    d = 48

    stats = ini_stats('optpose3pt_v2')

    for i in range(N):
        data = inidata_num_optpose3pt_v2()
        C,U = coefs_optpose3pt_v2(data)

        tic = time()
        S = red_297x356_optpose3pt_v2(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)