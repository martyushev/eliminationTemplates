from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_parallel_robot_66 import inidata_num_parallel_robot_66, coefs_parallel_robot_66, red_293x362_parallel_robot_66

def test_num_parallel_robot_66():
    seed(23)
    N = 1000
    d = 40

    stats = ini_stats('parallel_robot_66')

    for i in range(N):
        data = inidata_num_parallel_robot_66()
        C,U = coefs_parallel_robot_66(data)

        tic = time()
        S = red_293x362_parallel_robot_66(C,data[2][0,0])
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)