clear
clc

folder = fileparts(which('test_num_all.m'));
addpath(genpath(folder));

N = 10000;

test_num_focal6p;
test_num_rdist9p;
test_num_relpose_7p_fr_1s;
test_num_refract5p;
test_num_pose_quiver;
test_num_unsynch_relpose;
test_num_optpose2pt_v2;
test_num_pose_35pt;
test_num_r6p;
test_num_l2_3view_triang;
test_num_p6pf_refract;
test_num_relpose_7p_fr;