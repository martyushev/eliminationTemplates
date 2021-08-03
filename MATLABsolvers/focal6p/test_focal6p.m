clear
clc
%rng(23);

%FPXL = 1.6; % focal length
%Kgt = cell([1,2]);
%Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
%Kgt{2} = Kgt{1};
%Zgt = [0, 0]; % radial distortion coefficients

%NP = 6; % number of point correspondences
%NOISE = 0; % image noise level

%[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
%[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

q{1} = rand(3,6);
q{2} = rand(3,6);

[C,ns] = coefs_focal6p(q{1},q{2}); % coefficients of polynomial system
%[gg,uu,vv] = nstd_focal6p(C);
[gg,uu,vv] = std_focal6p_colpiv(C);

M = [];
for i=1:length(gg)
    g = gg(i);
    u = uu(i);
    v = vv(i);
    m = [g^2*u^2, u^3*g, g^2*u*v, u^2*v*g, g^2*v^2, v^2*u*g, v^3*g, u*g^2, u^2*g, u^3, v*g^2, g*u*v, v*u^2, v^2*g, v^2*u, v^3, g^2, g*u, u^2, g*v, v*u, v^2, g, u, v, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));

%ff = gg.^(-0.5);
%[ff,~] = peig6pt(q{1},q{2});
%E = esse_focal6p(ff,uu,vv,ns);

%[errE,c] = errorE(E,Egt{1,2});
%disp(errE);

%[err_f,~] = rel_error(ff,FPXL);

%disp("Numerical error in f:");
%disp(err_f);