from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_pose_35pt import inidata_num_pose_35pt, coefs_pose_35pt, red_12x26_pose_35pt

def test_num_pose_35pt():
    seed(23)
    N = 1000
    d = 10

    stats = ini_stats('pose_35pt')

    for i in range(N):
        data = inidata_num_pose_35pt()
        C,U = coefs_pose_35pt(data)

        tic = time()
        S = red_12x26_pose_35pt(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)