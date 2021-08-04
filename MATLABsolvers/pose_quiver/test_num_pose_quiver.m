warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

nn = rand(4,9);

try
    tic;
    C = coefs_pose_quiver(nn); % coefficients of polynomial system
    [ww,xx,yy,zz] = std_pose_quiver(C);
    tm = toc;
catch ME
    continue;
end

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [x^2*w, w*y^2, z*x*w, z*y*w, z^2*w, w*x, x^2, y*w, y*x, y^2, z*x, z*y, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_pose_quiver = Err;
Tm_pose_quiver = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_pose_quiver.mat'),'Err_pose_quiver');
save(strcat(folder, '\_results\Tm_pose_quiver.mat'),'Tm_pose_quiver');

sprintf('Prob. #16, Runtime: %0.1f ms, Error: %0.2e', 10^3*mean(Tm), 10^median(Err))

warning ('on', 'all');