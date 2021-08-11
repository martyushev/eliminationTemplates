clear
clc
%rng(23);

data = inidata_r6p(); % generate initial data of the problem
C = coefs_r6p(data); % compute coefficients of polynomial system
[uu,vv,ww,xx,yy,zz] = std_r6p_colpiv(C); % solve polynomial system

M = [];
for j=1:length(uu)
    u = uu(j);
    v = vv(j);
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [x*u, x*v, w*x, y*u, y*v, y*w, z*u, v*z, w*z, u, v, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));