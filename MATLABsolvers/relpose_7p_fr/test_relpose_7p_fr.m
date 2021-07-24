clear
clc
%rng(23);

FPXL = 1.2; % focal length
Kgt = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix K

NP = 7; % number of point correspondences
NOISE = 0; % image noise level
LAMBDA = -0.05; % radial distortion coefficient

[Pgt,Egt] = synth_cameras(2,{Kgt,Kgt}); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,LAMBDA); % synthetic image points

C = coefs_relpose_7p_fr(q{1},q{2}); % coefficients of polynomial system
[vv,ww,xx,yy,zz] = std_relpose_7p_fr_alt_v4(C);
ff = vv.^(-0.5);

[errf,c] = rel_error(ff,FPXL);

disp("Numerical error in f:");
disp(errf);