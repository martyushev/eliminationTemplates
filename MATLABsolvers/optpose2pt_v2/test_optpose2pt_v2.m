clear
clc
%rng(23);

data = inidata_optpose2pt_v2(); % generate initial data of the problem
C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
[vv,ww,xx,yy,zz] = nstd_optpose2pt_v2_colpiv(C); % solve polynomial system

M = [];
for j=1:length(vv)
    v = vv(j);
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [v^2, w*v, w^2, x*v, x*w, x^2, v*y, w*y, x*y, y^2, v*z, w*z, x*z, y*z, z^2, v, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));