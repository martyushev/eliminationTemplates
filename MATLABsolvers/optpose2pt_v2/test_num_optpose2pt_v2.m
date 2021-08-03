warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

U = rand(3,2);
u = rand(14,1);

try
    tic;
    C = coefs_optpose2pt_v2(u,U); % coefficients of polynomial system
    [vv,ww,xx,yy,zz] = nstd_optpose2pt_v2(C);
    tm = toc;
catch ME
    continue;
end

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
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_optpose2pt_v2 = Err;
Tm_optpose2pt_v2 = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_optpose2pt_v2.mat'),'Err_optpose2pt_v2');
save(strcat(folder, '\_results\Tm_optpose2pt_v2.mat'),'Tm_optpose2pt_v2');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');