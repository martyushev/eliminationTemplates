clear
clc
%rng(23);

data = inidata_focal6p(); % generate initial data of the problem
[C,ns] = coefs_focal6p(data); % compute coefficients of polynomial system
[gg,uu,vv] = nstd_focal6p_sprs(C); % solve polynomial system

M = [];
for j=1:length(gg)
    g = gg(j);
    u = uu(j);
    v = vv(j);
    m = [g^2*u^2, u^3*g, g^2*u*v, u^2*v*g, g^2*v^2, v^2*u*g, v^3*g, u*g^2, u^2*g, u^3, v*g^2, g*u*v, v*u^2, v^2*g, v^2*u, v^3, g^2, g*u, u^2, g*v, v*u, v^2, g, u, v, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
fprintf("Normalized residual: %0.2e\n", norm(C*M.','fro'));

%ff = gg.^(-0.5);
%[ff,~] = peig6pt(q{1},q{2});
%E = esse_focal6p(ff,uu,vv,ns);

%[errE,c] = errorE(E,Egt{1,2});
%disp(errE);

%[err_f,~] = rel_error(ff,FPXL);

%disp("Numerical error in f:");
%disp(err_f);