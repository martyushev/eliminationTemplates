clear
clc
%rng(23);

[data,Zgt,Egt] = inidata_zE_relpose_6p_rad(6,0); % generate initial data of the problem
[C,M] = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
[ww, xx, yy, zz] = nstd_relpose_6p_rad_39x95(C); % solve polynomial system
E = esse_relpose_6p_rad(ww,xx,yy,zz,M);

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [z^3*w^3, w^2*z^3*x, x^2*z^3*w, x^3*z^3, w^2*z^3*y, y*w*z^3*x, x^2*z^3*y, y^2*z^3*w, y^2*z^3*x, y^3*z^3, z^4*w^2, w*z^4*x, x^2*z^4, y*w*z^4, x*z^4*y, y^2*z^4, z^5*w, x*z^5, y*z^5, z^6, w^3*z^2, x*w^2*z^2, w*z^2*x^2, z^2*x^3, y*w^2*z^2, y*w*z^2*x, z^2*y*x^2, y^2*w*z^2, z^2*y^2*x, z^2*y^3, w^2*z^3, x*w*z^3, z^3*x^2, y*w*z^3, z^3*y*x, z^3*y^2, z^4*w, z^4*x, z^4*y, z^5, w^3*z, z*x*w^2, z*x^2*w, x^3*z, y*w^2*z, y*w*x*z, y*x^2*z, y^2*w*z, x*y^2*z, y^3*z, w^2*z^2, w*z^2*x, x^2*z^2, y*w*z^2, x*z^2*y, y^2*z^2, w*z^3, x*z^3, y*z^3, z^4, w^3, x*w^2, x^2*w, x^3, y*w^2, y*w*x, y*x^2, y^2*w, x*y^2, y^3, z*w^2, z*w*x, z*x^2, z*w*y, x*y*z, y^2*z, z^2*w, x*z^2, y*z^2, z^3, w^2, w*x, x^2, w*y, x*y, y^2, w*z, x*z, y*z, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M, norm(C*m.','fro')];
end
M = sort(M);
fprintf("Normalized residual: %0.2e\n", norm(M(1:end-4),'fro'));

[err_z,~] = rel_error(zz,Zgt(1));
[err_E,c] = mat_rel_error(E,Egt{1,2});

disp("Numerical errors in z and E:");
disp([err_z, err_E]);