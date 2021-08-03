clear
clc
%rng(23);

%Kgt = cell([1,2]);
%Kgt{1} = [1 0 0; 0 1 0; 0 0 1]; % ground truth calibration matrix
%Kgt{2} = Kgt{1};
%Zgt = [0, 0]; % radial distortion coefficients

%NP = 5; % number of point correspondences
%NOISE = 0; % image noise level

%[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
%[q,Q] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

q{2} = rand(3,5);
Q = rand(3,5);

C = coefs_refract5p(q{2},Q); % coefficients of polynomial system
[xx,yy,zz] = std_refract5p(C);

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    z = zz(j);
    %R = 1/(x^2+y^2+z^2+1)*[x^2-y^2-z^2+1, 2*x*y+2*z, 2*x*z-2*y; 2*x*y-2*z, -(x^2-y^2+z^2-1), 2*y*z+2*x; 2*x*z+2*y, -(-2*y*z+2*x), -(x^2+y^2-z^2-1)];
    %disp(abs(trace(R) - trace(Pgt{2}(:,1:3))));
    m = [z*x^3, z*x^2*y, z*x*y^2, z*y^3, z^2*x^2, z^2*x*y, z^2*y^2, z^3*x, z^3*y, z^4, x^3, x^2*y, x*y^2, y^3, x^2*z, z*y^2, z^2*x, z^2*y, z^3, x^2, y*x, y^2, z*x, z*y, z^2, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));



%[err_t,~] = rel_error(ww,trace(Pgt{2}(:,1:3)));

%disp("Numerical error in trace:");
%disp(err_t);