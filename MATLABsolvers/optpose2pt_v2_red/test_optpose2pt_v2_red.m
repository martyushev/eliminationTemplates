clear
clc
%rng(23);

data = inidata_optpose2pt_v2_red(); % generate initial data of the problem
C = coefs_optpose2pt_v2_red(data); % compute coefficients of polynomial system
[vv,ww,xx,yy,zz] = nstd_optpose2pt_v2_red_colpiv(C); % solve polynomial system

M = [];
for j=1:length(vv)
    v = vv(j);
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [y*x*v^3, v^2*y*x*w, v*y*x*w^2, y*x*w^3, v^2*x^2*y, v*y*x^2*w, w^2*x^2*y, v*x^3*y, w*x^3*y, x^4*y, w^2*v*y^2, w^3*y^2, v*y^2*x*w, x*w^2*y^2, w*x^2*y^2, x^3*y^2, w*v*y^3, w^2*y^3, z*v^4, w*z*v^3, w^2*z*v^2, w^3*z*v, x*v^3*z, x*w*z*v^2, x*w^2*z*v, x^2*z*v^2, x^2*w*z*v, v*x^3*z, y*z*v^3, v^2*z*w*y, y*w^2*z*v, z*w^3*y, y*v^2*x*z, v*x*z*w*y, x*z*y*w^2, y*v*x^2*z, w*x^2*z*y, z*x^3*y, z*w^2*y^2, x*z*y^2*w, z*x^2*y^2, z^2*v^3, w*z^2*v^2, w^2*z^2*v, x*z^2*v^2, x*w*z^2*v, x^2*z^2*v, y*z^2*v^2, y*w*z^2*v, y*z^2*w^2, y*v*x*z^2, x*z^2*w*y, z^2*x^2*y, y^2*z^2*w, x*y^2*z^2, z^3*v^2, v*w*z^3, v*x*z^3, v*y*z^3, w*z^3*y, x*z^3*y, y^2*z^3, z^4*v, z^4*y, v^4, w^2*v^2, v^3*x, v^2*w*x, v*w^2*x, w^3*x, v^2*x^2, v*w*x^2, w^2*x^2, v*x^3, w*x^3, x^4, v^3*y, v^2*w*y, v*w^2*y, w^3*y, x*y*v^2, v*y*x*w, x*y*w^2, v*y*x^2, w*y*x^2, x^3*y, v^3*z, w*v^2*z, v*w^2*z, w^3*z, z*x*v^2, x*w*z*v, x*w^2*z, x^2*v*z, z*w*x^2, z*x^3, y*z*v^2, v*z*w*y, y*w^2*z, y*v*x*z, y*z*w*x, z*y*x^2, z*y^2*x, z^2*v^2, v*w*z^2, z^2*w^2, x*v*z^2, x*z^2*w, z^2*x^2, v*z^2*y, z^2*y*w, z^2*y*x, y^2*z^2, z^3*v, z^3*w, z^3*y, v^3, v^2*w, w^2*v, w^3, v^2*x, x*v*w, x*w^2, v*x^2, x^2*w, x^3, v^2*y, v*w*y, y*w^2, v*x*y, w*x*y, y*x^2, y^2*x, v^2*z, v*z*w, w^2*z, z*x*v, z*x*w, z*x^2, z*y*v, y*w*z, x*y*z, v*z^2, w*z^2, y*z^2, z^3, v^2, w*v, w^2, x*v, x*w, x^2, y*v, y*w, x*y, y^2, z*v, z*w, x*z, y*z, v, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M.','fro'));