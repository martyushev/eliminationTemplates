from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_wpnp import inidata_num_wpnp, coefs_wpnp, red_85x107_wpnp

def test_num_wpnp():
    seed(23)
    N = 1000
    d = 16

    stats = ini_stats('wpnp')

    for i in range(N):
        data = inidata_num_wpnp()
        C,U = coefs_wpnp(data)

        tic = time()
        S = red_85x107_wpnp(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)