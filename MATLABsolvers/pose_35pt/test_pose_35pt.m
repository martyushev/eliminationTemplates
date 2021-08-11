clear
clc
%rng(23);


data = inidata_pose_35pt(); % generate initial data of the problem
C = coefs_pose_35pt(data); % compute coefficients of polynomial system
[xx,yy] = std_pose_35pt(C); % solve polynomial system

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    m = [x^6, x^4*y^2, x^2*y^4, y^6, x^5, y*x^4, y^2*x^3, y^3*x^2, y^4*x, y^5, x^4, y*x^3, y^2*x^2, y^3*x, y^4, x^3, y*x^2, y^2*x, y^3, x^2, y*x, y^2, x, y, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M','fro'));