clear
clc
%rng(23);

data = inidata_unsynch_relpose(); % generate initial data of the problem
C = coefs_unsynch_relpose(data); % compute coefficients of polynomial system
[ww,xx,yy,zz] = nstd_unsynch_relpose(C); % solve polynomial system

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [w^3*z^3, z^3*x*w^2, w*z^3*x^2, z^3*x^3, z^3*y*w^2, w*z^3*x*y, z^3*y*x^2, w*z^3*y^2, x*y^2*z^3, y^3*z^3, w^3*z^2, z^2*w^2*x, x^2*w*z^2, z^2*x^3, z^2*w^2*y, w*x*y*z^2, z^2*y*x^2, w*z^2*y^2, x*y^2*z^2, y^3*z^2, z^3*w^2, x*w*z^3, z^3*x^2, y*w*z^3, x*y*z^3, z^3*y^2, w^3*z, x*w^2*z, x^2*w*z, z*x^3, y*w^2*z, y*w*x*z, z*x^2*y, w*z*y^2, z*x*y^2, z*y^3, z^2*w^2, w*z^2*x, z^2*x^2, w*y*z^2, z^2*x*y, z^2*y^2, w*z^3, z^3*x, z^3*y, w^3, x*w^2, x^2*w, x^3, y*w^2, y*x*w, y*x^2, y^2*w, y^2*x, y^3, z*w^2, z*x*w, z*x^2, z*y*w, z*y*x, z*y^2, z^2*w, z^2*x, z^2*y, z^3, w^2, w*x, x^2, y*w, y*x, y^2, w*z, z*x, z*y, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));