clear
clc
%rng(23);

data = inidata_rdist9p(); % generate initial data of the problem
C = coefs_rdist9p(data); % compute coefficients of polynomial system
[ww,xx,yy,zz] = std_rdist9p(C); % solve polynomial system

M = [];
for i=1:length(ww)
    w = ww(i);
    x = xx(i);
    y = yy(i);
    z = zz(i);
    m = [z^2*w^2*x, y*z^2*w^2, y*x*z^2*w, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z*w^2*x, z*w*x^2, y*z*w^2, z*w*x*y, x^2*z*y, z*w*y^2, x*z*y^2, y^3*z, z^2*w^2, x*z^2*w, z^2*w*y, y*x*z^2, y^2*z^2, w^2*x, w*x^2, x^3, y*w^2, w*y*x, y*x^2, y^2*w, x*y^2, y^3, w^2*z, x*z*w, z*x^2, w*y*z, z*x*y, y^2*z, z^2*w, x*z^2, y*z^2, w^2, w*x, x^2, y*w, x*y, y^2, z*w, x*z, y*z, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));

%[err_z1,~] = rel_error(zz,Zgt(1));
%[err_z2,~] = rel_error(ww,Zgt(2));

%disp("Numerical error in z:");
%disp([err_z1, err_z2]);