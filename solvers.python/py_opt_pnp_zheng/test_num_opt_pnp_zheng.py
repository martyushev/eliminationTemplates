from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_opt_pnp_zheng import inidata_num_opt_pnp_zheng, coefs_opt_pnp_zheng, red_109x161_opt_pnp_zheng

def test_num_opt_pnp_zheng():
    seed(23)
    N = 1000
    d = 40

    stats = ini_stats('opt_pnp_zheng')

    for i in range(N):
        data = inidata_num_opt_pnp_zheng()
        C,U = coefs_opt_pnp_zheng(data)

        tic = time()
        S = red_109x161_opt_pnp_zheng(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)