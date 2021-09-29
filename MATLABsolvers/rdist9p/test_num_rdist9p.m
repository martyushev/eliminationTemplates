warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err_rdist9p = [];
Tm_rdist9p = [];

for i = 1:N

    data = inidata_rdist9p(); % generate initial data of the problem

    try
        tic;
        C = coefs_rdist9p(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = std_rdist9p_colpiv_sprs(C); % solve polynomial system
        tm = toc;
        if isempty(ww); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(ww)
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [z^2*w^2*x, y*z^2*w^2, y*x*z^2*w, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z*w^2*x, z*w*x^2, y*z*w^2, z*w*x*y, z*x^2*y, z*w*y^2, z*y^2*x, z*y^3, z^2*w^2, x*z^2*w, z^2*y*w, z^2*y*x, z^2*y^2, x*w^2, w*x^2, x^3, y*w^2, w*y*x, x^2*y, y^2*w, x*y^2, y^3, w^2*z, z*x*w, z*x^2, w*y*z, z*x*y, y^2*z, z^2*w, z^2*x, z^2*y, w^2, x*w, x^2, y*w, y*x, y^2, z*w, x*z, z*y, z^2, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_rdist9p = [Err_rdist9p err];
    Tm_rdist9p = [Tm_rdist9p tm];

end

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_rdist9p.mat'),'Err_rdist9p');
save(strcat(folder,'\_results\Tm_rdist9p.mat'),'Tm_rdist9p');

fprintf('Problem #9. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_rdist9p),median(Err_rdist9p));

warning ('on','all');