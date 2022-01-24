rng(23);

N = 10000;

Err_rdist9p = [];
Tm_rdist9p = [];

for i = 1:N

    data = inidata_rdist9p(); % generate initial data of the problem

    try
        tic;
        C = coefs_rdist9p(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = nstd_76x100_colpiv_rdist9p(C); % solve polynomial system
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
        m = [z^2*w^2*x, y*z^2*w^2, y*x*z^2*w, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z*w^2*x, z*w*x^2, y*z*w^2, z*w*x*y, x^2*z*y, z*w*y^2, x*z*y^2, y^3*z, z^2*w^2, x*z^2*w, z^2*w*y, y*x*z^2, y^2*z^2, w^2*x, w*x^2, x^3, y*w^2, w*y*x, y*x^2, y^2*w, x*y^2, y^3, w^2*z, x*z*w, z*x^2, w*y*z, z*x*y, y^2*z, z^2*w, x*z^2, y*z^2, w^2, w*x, x^2, y*w, x*y, y^2, z*w, x*z, y*z, z^2, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_rdist9p = [Err_rdist9p err];
    Tm_rdist9p = [Tm_rdist9p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_rdist9p.mat'),'Err_rdist9p');
save(strcat(folder,'\_results\Tm_rdist9p.mat'),'Tm_rdist9p');

fprintf('Problem #9. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_rdist9p),median(Err_rdist9p));