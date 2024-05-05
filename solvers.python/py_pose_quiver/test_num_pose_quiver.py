from numpy.random import seed
from time import time
from _common import ini_stats, update_stats, disp_stats
from py_pose_quiver import inidata_num_pose_quiver, coefs_pose_quiver, red_38x74_pose_quiver

def test_num_pose_quiver():
    seed(23)
    N = 1000
    d = 20

    stats = ini_stats('pose_quiver')

    for i in range(N):
        data = inidata_num_pose_quiver()
        C,U = coefs_pose_quiver(data)

        tic = time()
        S = red_38x74_pose_quiver(C)
        stats['tm'].append(time()-tic)
        if S is None:
            continue

        stats = update_stats(stats,S,C,U,d)

    disp_stats(stats)