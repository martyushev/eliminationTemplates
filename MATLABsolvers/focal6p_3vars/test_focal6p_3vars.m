clear
clc
%rng(23);

FPXL = 1.2; % focal length
KGT = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix

NP = 6; % number of point correspondences
NOISE = 0; % image noise level
LAMBDA = 0; % radial distortion coefficient

[Pgt,~] = synth_cameras(2,{KGT,KGT}); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,LAMBDA); % synthetic image points

C = coefs_focal6p_3vars(q{1},q{2}); % coefficients of polynomial system
[gg,uu,vv] = nstd_focal6p_3vars(C);

ff = gg.^(-0.5);

[errf,c] = rel_error(ff,FPXL);

disp("Numerical error in f:");
disp(errf);