clear
clc
%rng(23);

q = rand(2,3);
X = rand(3,3);
A = rand(6,16);

C = coefs_r6p(q,X,A); % coefficients of polynomial system
[uu,vv,ww,xx,yy,zz] = std_r6p(C);

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
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));