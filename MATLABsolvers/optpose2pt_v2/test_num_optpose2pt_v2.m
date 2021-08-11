warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err = [];
Tm = [];

for i = 1:N

    data = inidata_optpose2pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = nstd_optpose2pt_v2_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(vv); continue; end
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
        m = [v^2, w*v, w^2, x*v, x*w, x^2, y*v, y*w, y*x, y^2, v*z, w*z, x*z, y*z, z^2, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M','fro');

    Err = [Err err];
    Tm = [Tm tm];

end

Err_optpose2pt_v2 = Err;
Tm_optpose2pt_v2 = Tm;

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_optpose2pt_v2.mat'),'Err_optpose2pt_v2');
save(strcat(folder,'\_results\Tm_optpose2pt_v2.mat'),'Tm_optpose2pt_v2');

fprintf('Problem: optpose2pt_v2. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm),median(Err));

warning ('on','all');