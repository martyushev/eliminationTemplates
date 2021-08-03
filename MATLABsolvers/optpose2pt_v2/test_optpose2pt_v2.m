clear
clc
%rng(23);

U = rand(3,2);
u = rand(14,1);

C = coefs_optpose2pt_v2(u,U); % coefficients of polynomial system
[vv,ww,xx,yy,zz] = nstd_optpose2pt_v2(C);

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
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));