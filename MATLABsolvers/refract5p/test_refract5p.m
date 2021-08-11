clear
clc
%rng(23);

data = inidata_refract5p(); % generate initial data of the problem
C = coefs_refract5p(data); % compute coefficients of polynomial system
[xx,yy,zz] = std_refract5p_colpiv(C); % solve polynomial system

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    z = zz(j);
    %M = [M; trace(1/(x^2+y^2+z^2+1)*[x^2-y^2-z^2+1, 2*x*y+2*z, 2*x*z-2*y; 2*x*y-2*z, -(x^2-y^2+z^2-1), 2*y*z+2*x; 2*x*z+2*y, -(-2*y*z+2*x), -(x^2+y^2-z^2-1)])];
    m = [z*x^3, z*x^2*y, z*x*y^2, z*y^3, z^2*x^2, z^2*x*y, z^2*y^2, z^3*x, z^3*y, z^4, x^3, x^2*y, x*y^2, y^3, x^2*z, z*y^2, z^2*x, z^2*y, z^3, x^2, y*x, y^2, z*x, z*y, z^2, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));

%[err_t,~] = rel_error(M,trace(Pgt{2}(:,1:3)));
%disp("Numerical error in trace:");
%disp(err_t);