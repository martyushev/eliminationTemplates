clear
clc
%rng(23);

data = inidata_relpose_7p_fr_1s(); % generate initial data of the problem
C = coefs_relpose_7p_fr_1s(data); % compute coefficients of polynomial system
[xx,yy,zz] = std_relpose_7p_fr_1s_colpiv(C); % solve polynomial system
ww = arrayfun(@(j) get_w(C,xx(j),yy(j),zz(j)), 1:length(xx));

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    z = zz(j);
    w = ww(j);
    m = [x^3*z^3, x^2*z^3*y, x*z^3*y^2, y^3*z^3, w*x^3*z, w*x^2*z*y, w*x*y^2*z, z*y^3*w, z^2*x^3, z^2*y*x^2, z^2*y^2*x, z^2*y^3, z^3*x^2, z^3*y*x, z^3*y^2, x^3*w, y*x^2*w, y^2*x*w, w*y^3, z*x^2*w, y*w*x*z, y*x^2*z, y^2*w*z, x*y^2*z, y^3*z, x^2*z^2, x*z^2*y, y^2*z^2, z^3*x, z^3*y, x^2*w, y*w*x, y^2*w, x*y^2, y^3, x*z*w, x^2*z, y*w*z, x*y*z, y^2*z, x*z^2, y*z^2, z^3, x*w, y*w, x*y, y^2, z*w, x*z, y*z, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M.','fro'));