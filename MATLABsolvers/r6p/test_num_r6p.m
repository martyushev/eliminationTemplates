warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err = [];
Tm = [];

for i = 1:N

    data = inidata_r6p(); % generate initial data of the problem

    try
        tic;
        C = coefs_r6p(data); % compute coefficients of polynomial system
        [uu, vv, ww, xx, yy, zz] = std_r6p_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(uu); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(uu)
        u = uu(j);
        v = vv(j);
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [x*u, x*v, x*w, y*u, y*v, y*w, z*u, v*z, w*z, u, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M','fro');

    Err = [Err err];
    Tm = [Tm tm];

end

Err_r6p = Err;
Tm_r6p = Tm;

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_r6p.mat'),'Err_r6p');
save(strcat(folder,'\_results\Tm_r6p.mat'),'Tm_r6p');

fprintf('Problem: r6p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm),median(Err));

warning ('on','all');