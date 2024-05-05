from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_wpnp_2x2sym import inidata_num_wpnp_2x2sym, coefs_wpnp_2x2sym, red_10x20_wpnp_2x2sym

def test_num_wpnp_2x2sym():
    seed(23)
    N = 1000
    d = 16

    stats = ini_stats('wpnp_2x2sym')

    for i in range(N):
        data = inidata_num_wpnp_2x2sym()
        C,U = coefs_wpnp_2x2sym(data)

        tic = time()
        S = red_10x20_wpnp_2x2sym(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)