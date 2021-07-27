clear
clc
%rng(23);

FPXL = 1.6; % focal length
Kgt = cell([1,2]);
Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
Kgt{2} = Kgt{1};
Zgt = [-0.05, -0.05]; % radial distortion coefficients

NP = 7; % number of point correspondences
NOISE = 0; % image noise level

[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

C = coefs_relpose_7p_fr(q{1},q{2}); % coefficients of polynomial system
[vv,ww,xx,yy,zz] = std_relpose_7p_fr_alt_v4(C);
ff = vv.^(-0.5);

[errf,c] = rel_error(ff,FPXL);

disp("Numerical error in f:");
disp(errf);