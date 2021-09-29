warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err_r6p = [];
Tm_r6p = [];

for i = 1:N

    data = inidata_r6p(); % generate initial data of the problem

    try
        tic;
        C = coefs_r6p(data); % compute coefficients of polynomial system
        [uu, vv, ww, xx, yy, zz] = std_r6p_colpiv_sprs(C); % solve polynomial system
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
        m = [x*u, x*v, x*w, y*u, y*v, y*w, z*u, v*z, z*w, u, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_r6p = [Err_r6p err];
    Tm_r6p = [Tm_r6p tm];

end

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_r6p.mat'),'Err_r6p');
save(strcat(folder,'\_results\Tm_r6p.mat'),'Tm_r6p');

fprintf('Problem #28. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_r6p),median(Err_r6p));

warning ('on','all');