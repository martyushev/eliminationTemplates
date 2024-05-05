from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_opt_pnp_nakanoC import inidata_num_opt_pnp_nakanoC, coefs_opt_pnp_nakanoC, red_78x131_opt_pnp_nakanoC

def test_num_opt_pnp_nakanoC():
    seed(23)
    N = 1000
    d = 40

    stats = ini_stats('opt_pnp_nakanoC')

    for i in range(N):
        data = inidata_num_opt_pnp_nakanoC()
        C,U = coefs_opt_pnp_nakanoC(data)

        tic = time()
        S = red_78x131_opt_pnp_nakanoC(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)