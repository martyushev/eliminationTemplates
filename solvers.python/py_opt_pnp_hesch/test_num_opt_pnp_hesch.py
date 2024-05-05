from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_opt_pnp_hesch import inidata_num_opt_pnp_hesch, coefs_opt_pnp_hesch, red_62x97_opt_pnp_hesch

def test_num_opt_pnp_hesch():
    seed(23)
    N = 1000
    d = 27

    stats = ini_stats('opt_pnp_hesch')

    for i in range(N):
        data = inidata_num_opt_pnp_hesch()
        C,U = coefs_opt_pnp_hesch(data)

        tic = time()
        S = red_62x97_opt_pnp_hesch(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)