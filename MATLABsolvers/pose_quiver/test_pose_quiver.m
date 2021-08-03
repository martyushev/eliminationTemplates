clear
clc
%rng(23);

N = rand(4,9);

C = coefs_pose_quiver(N); % coefficients of polynomial system
[ww,xx,yy,zz] = std_pose_quiver(C);

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [x^2*w, w*y^2, z*x*w, z*y*w, z^2*w, w*x, x^2, y*w, y*x, y^2, z*x, z*y, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
disp("log10 of normalized residual:");
disp(log10(norm(C*M','fro')));