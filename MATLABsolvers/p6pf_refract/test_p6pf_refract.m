clear
clc
%rng(23);

data = inidata_p6pf_refract(); % generate initial data of the problem
C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
[ww,xx,yy,zz] = std_p6pf_refract_colpiv(C); % solve polynomial system

M = [];
for i=1:length(ww)
    w = ww(i);
    x = xx(i);
    y = yy(i);
    z = zz(i);
    m = [z*y*x^2*w, z*y^2*x*w, z^3*x*w, z^3*y*w, y*x^2*w, y*x^3, y^2*x*w, y^3*x, z^2*x*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, w*x, x^2, w*y, y*x, y^2, z^2, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));

%[err_f,~] = rel_error(ww,FPXL);

%disp("Numerical error in f:");
%disp(err_f);