clear
clc
%rng(23);

FPXL = 1.2; % focal length
Kgt = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix

NP = 6; % number of point correspondences
NOISE = 0; % image noise level
LAMBDA = 0; % radial distortion coefficient

[Pgt,Egt] = synth_cameras(2,{Kgt,Kgt}); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,LAMBDA); % synthetic image points

[C,ns] = coefs_focal6p(q{1},q{2}); % coefficients of polynomial system
[gg,uu,vv] = nstd_focal6p(C);
ff = gg.^(-0.5);
%[ff,~] = peig6pt(q{1},q{2});
%E = esse_focal6p(ff,uu,vv,ns);

%[errE,c] = errorE(E,Egt{1,2});
%disp(errE);

[errf,c] = rel_error(ff,FPXL);

disp("Numerical error in f:");
disp(errf);