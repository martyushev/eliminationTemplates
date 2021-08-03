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
%[q,Q] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

q{2} = rand(3,6);
Q = rand(3,6);

C = coefs_p6pf_refract(q{2},Q); % coefficients of polynomial system
[ww,xx,yy,zz] = std_p6pf_refract(C);

M = [];
for i=1:length(ww)
    w = ww(i);
    x = xx(i);
    y = yy(i);
    z = zz(i);
    m = [z*y*x^2*w, z*y^2*x*w, z^3*x*w, z^3*y*w, y*x^2*w, y*x^3, y^2*x*w, y^3*x, z^2*x*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, w*x, x^2, w*y, y*x, y^2, z^2, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));

%[err_f,~] = rel_error(ww,FPXL);

%disp("Numerical error in f:");
%disp(err_f);