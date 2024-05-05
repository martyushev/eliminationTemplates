from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_opt_vanishingpoints import inidata_num_opt_vanishingpoints, coefs_opt_vanishingpoints, red_136x194_opt_vanishingpoints

def test_num_opt_vanishingpoints():
    seed(23)
    N = 1000
    d = 40

    stats = ini_stats('opt_vanishingpoints')

    for i in range(N):
        data = inidata_num_opt_vanishingpoints()
        C,U = coefs_opt_vanishingpoints(data)

        tic = time()
        S = red_136x194_opt_vanishingpoints(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)