clear
clc
%rng(23);


data = inidata_pose_quiver(); % generate initial data of the problem
C = coefs_pose_quiver(data); % compute coefficients of polynomial system
[ww,xx,yy,zz] = std_pose_quiver_colpiv(C); % solve polynomial system

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [x^2*w, y^2*w, z*x*w, z*y*w, z^2*w, x*w, x^2, y*w, x*y, y^2, x*z, y*z, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
D = C*M.';
D = sort(sqrt(sum(D.*conj(D),1)));
D = D(1:20);
fprintf("Normalized residual: %0.2e\n", norm(D,'fro'));