clear
clc
%rng(23);

FPXL = 1.6; % focal length
Kgt = cell([1,2]);
Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
Kgt{2} = Kgt{1};
Zgt = [0, 0]; % radial distortion coefficients

NP = 6; % number of point correspondences
NOISE = 0; % image noise level

[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

[C,ns] = coefs_focal6p(q{1},q{2}); % coefficients of polynomial system
[gg,uu,vv] = nstd_focal6p(C);
ff = gg.^(-0.5);
%[ff,~] = peig6pt(q{1},q{2});
%E = esse_focal6p(ff,uu,vv,ns);

%[errE,c] = errorE(E,Egt{1,2});
%disp(errE);

[errf,~] = rel_error(ff,FPXL);

disp("Numerical error in f:");
disp(errf);