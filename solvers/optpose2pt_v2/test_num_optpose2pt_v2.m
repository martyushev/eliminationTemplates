rng(23);

N = 10000;

Err_optpose2pt_v2 = [];
Tm_optpose2pt_v2 = [];

for i = 1:N

    data = inidata_optpose2pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = nstd_optpose2pt_v2_colpiv_sprs(C); % solve polynomial system
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
        m = [y*x*v^3, v^2*y*x*w, v*y*x*w^2, y*x*w^3, v^2*x^2*y, v*y*x^2*w, w^2*x^2*y, v*x^3*y, w*x^3*y, x^4*y, w^2*v*y^2, w^3*y^2, v*y^2*x*w, x*w^2*y^2, w*x^2*y^2, x^3*y^2, w*v*y^3, w^2*y^3, z*v^4, w*z*v^3, w^2*z*v^2, w^3*z*v, x*v^3*z, x*w*z*v^2, x*w^2*z*v, x^2*z*v^2, x^2*w*z*v, v*x^3*z, y*z*v^3, v^2*z*w*y, y*w^2*z*v, z*w^3*y, y*v^2*x*z, v*x*z*w*y, x*z*y*w^2, y*v*x^2*z, w*x^2*z*y, z*x^3*y, z*w^2*y^2, x*z*y^2*w, z*x^2*y^2, z^2*v^3, w*z^2*v^2, w^2*z^2*v, x*z^2*v^2, x*w*z^2*v, x^2*z^2*v, y*z^2*v^2, y*w*z^2*v, y*z^2*w^2, y*v*x*z^2, x*z^2*w*y, z^2*x^2*y, y^2*z^2*w, x*y^2*z^2, z^3*v^2, v*w*z^3, v*x*z^3, v*y*z^3, w*z^3*y, x*z^3*y, y^2*z^3, z^4*v, z^4*y, v^4, w^2*v^2, v^3*x, v^2*w*x, v*w^2*x, w^3*x, v^2*x^2, v*w*x^2, w^2*x^2, v*x^3, w*x^3, x^4, v^3*y, v^2*w*y, v*w^2*y, w^3*y, x*y*v^2, v*y*x*w, x*y*w^2, v*y*x^2, w*y*x^2, x^3*y, v^3*z, w*v^2*z, v*w^2*z, w^3*z, z*x*v^2, x*w*z*v, x*w^2*z, x^2*v*z, z*w*x^2, z*x^3, y*z*v^2, v*z*w*y, y*w^2*z, y*v*x*z, y*z*w*x, z*y*x^2, z*y^2*x, z^2*v^2, v*w*z^2, z^2*w^2, x*v*z^2, x*z^2*w, z^2*x^2, v*z^2*y, z^2*y*w, z^2*y*x, y^2*z^2, z^3*v, z^3*w, z^3*y, v^3, v^2*w, w^2*v, w^3, v^2*x, x*v*w, x*w^2, v*x^2, x^2*w, x^3, v^2*y, v*w*y, y*w^2, v*x*y, w*x*y, y*x^2, y^2*x, v^2*z, v*z*w, w^2*z, z*x*v, z*x*w, z*x^2, z*y*v, y*w*z, x*y*z, v*z^2, w*z^2, y*z^2, z^3, v^2, w*v, w^2, x*v, x*w, x^2, y*v, y*w, x*y, y^2, z*v, z*w, x*z, y*z, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_optpose2pt_v2 = [Err_optpose2pt_v2 err];
    Tm_optpose2pt_v2 = [Tm_optpose2pt_v2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_optpose2pt_v2.mat'),'Err_optpose2pt_v2');
save(strcat(folder,'\_results\Tm_optpose2pt_v2.mat'),'Tm_optpose2pt_v2');

fprintf('Problem #20. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_optpose2pt_v2),median(Err_optpose2pt_v2));