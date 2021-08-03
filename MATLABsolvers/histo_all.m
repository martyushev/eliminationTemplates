clear
clc

folder = fileparts(which('histo_all.m'));
addpath(genpath(folder));

bwd = 3e-1;
nbins = 60;
clr = [70 100 160]/255;
axs = [-17 1 0 1150];
fs = 54;

histo_focal6p;
histo_rdist9p;
histo_relpose_7p_fr_1s;
histo_refract5p;
histo_pose_quiver;
histo_unsynch_relpose;
histo_optpose2pt_v2;
histo_pose_35pt;
histo_r6p;
histo_l2_3view_triang;
histo_p6pf_refract;
histo_relpose_7p_fr;