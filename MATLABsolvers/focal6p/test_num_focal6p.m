warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

%FPXL = 1.6; % focal length
%Kgt = cell([1,2]);
%Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
%Kgt{2} = Kgt{1};
%Zgt = [0, 0]; % radial distortion coefficients

%NP = 6; % number of point correspondences
%NOISE = 0; % image noise level

Err = [];
Tm = [];

for i = 1:N

%[Pgt,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
%[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

q{1} = rand(3,6);
q{2} = rand(3,6);

try
    tic;
    [C,~] = coefs_focal6p(q{1},q{2}); % coefficients of polynomial system
    [gg,uu,vv] = nstd_focal6p(C);
    tm = toc;
    %ff = gg.^(-0.5);
    %E = esse_focal6p(ff,uu,vv,ns);
catch ME
    continue;
end

M = [];
for j=1:length(gg)
    g = gg(j);
    u = uu(j);
    v = vv(j);
    m = [g^2*u^2, u^3*g, g^2*u*v, u^2*v*g, g^2*v^2, v^2*u*g, v^3*g, u*g^2, u^2*g, u^3, v*g^2, g*u*v, v*u^2, v^2*g, v^2*u, v^3, g^2, g*u, u^2, g*v, v*u, v^2, g, u, v, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

%[errE,c] = mat_rel_error(E,Egt{1,2});
%if c == 0; continue; end
Err = [Err err];
Tm = [Tm tm];

end

Err_focal6p = Err;
Tm_focal6p = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_focal6p.mat'),'Err_focal6p');
save(strcat(folder, '\_results\Tm_focal6p.mat'),'Tm_focal6p');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');