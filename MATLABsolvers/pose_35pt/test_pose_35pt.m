clear
clc
%rng(23);

q{1} = rand(4,1);
q{2} = rand(3,1);
Q = rand(3,4);

C = coefs_pose_35pt(q{1},q{2},Q); % coefficients of polynomial system
[xx,yy] = std_pose_35pt(C);

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    m = [x^6, x^4*y^2, x^2*y^4, y^6, x^5, y*x^4, y^2*x^3, y^3*x^2, y^4*x, y^5, x^4, y*x^3, y^2*x^2, y^3*x, y^4, x^3, y*x^2, y^2*x, y^3, x^2, y*x, y^2, x, y, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));