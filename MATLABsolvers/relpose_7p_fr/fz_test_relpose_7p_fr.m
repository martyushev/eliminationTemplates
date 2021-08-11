warning ('off', 'all');

clear
clc
rng(23);

N = 1000;

FPXL = 1.6; % focal length
Kgt = cell([1,2]);
Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
Kgt{2} = Kgt{1};
Zgt = [-0.08, -0.08]; % radial distortion coefficients

NP = 7; % number of point correspondences
NOISE = 0; % image noise level

Err_f = [];
Err_z = [];

for i = 1:N

[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

C = coefs_relpose_7p_fr(q{1},q{2}); % coefficients of polynomial system

try
    [vv,ww,xx,yy,zz] = std_relpose_7p_fr(C);
    ff = vv.^(-0.5);
catch ME
    continue;
end

[err_f,c] = rel_error(ff,FPXL);
if c == 0; continue; end
[err_z,c] = rel_error(zz,Zgt(1));
if c == 0; continue; end
Err_f = [Err_f err_f];
Err_z = [Err_z err_z];

end

Err_f_relpose_7p_fr = Err_f;
Err_z_relpose_7p_fr = Err_z;
save('d:\CurrentWork\paper13\programs\matlab\GBsparseLA\solvers\_results\Err_f_relpose_7p_fr.mat','Err_f_relpose_7p_fr');
save('d:\CurrentWork\paper13\programs\matlab\GBsparseLA\solvers\_results\Err_z_relpose_7p_fr.mat','Err_z_relpose_7p_fr');

disp([median(Err_f), median(Err_z)]);

warning ('on', 'all');