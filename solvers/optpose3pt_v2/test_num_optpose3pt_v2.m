rng(23);

N = 10000;

Err_optpose3pt_v2 = [];
Tm_optpose3pt_v2 = [];

for i = 1:N

    data = inidata_optpose3pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose3pt_v2(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_optpose3pt_v2_colpiv_sprs(C); % solve polynomial system
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
        m = [x^2*v^5, w^2*x^2*v^3, x^3*v^4, w*v^3*x^3, w^2*v^2*x^3, w^3*v*x^3, w^4*x^3, v^3*x^4, w*v^2*x^4, w^2*v*x^4, w^3*x^4, v^2*x^5, w*v*x^5, w^2*x^5, v*x^6, w*x^6, x^7, y*v^6, y*w*v^5, w^2*y*v^4, y*w^3*v^3, y*v^5*x, w*x*y*v^4, w^2*y*v^3*x, y*v^4*x^2, w*y*x^2*v^3, y*w^3*x^2*v, y*v^3*x^3, w*y*v^2*x^3, v*y*w^2*x^3, y*w^3*x^3, y*v^2*x^4, v*y*w*x^4, w^2*y*x^4, y*v*x^5, w*y*x^5, y*x^6, w^2*y^2*v^3, w^3*y^2*v^2, w^3*x*v*y^2, w^3*y^2*x^2, z*v^6, z*w*v^5, w^2*z*v^4, z*w^3*v^3, x*z*v^5, w*x*z*v^4, x*z*w^2*v^3, w^3*z*v^2*x, x^2*z*v^4, w*z*x^2*v^3, w^2*z*x^2*v^2, w^3*v*x^2*z, z*v^3*x^3, w*z*v^2*x^3, v*z*w^2*x^3, w^3*z*x^3, z*v^2*x^4, v*z*w*x^4, w^2*z*x^4, z*v*x^5, w*z*x^5, z*x^6, y*z*v^5, w*z*y*v^4, y*z*w^2*v^3, z*y*w^3*v^2, z*y*x*v^4, w*x*z*y*v^3, w^2*z*y*x*v^2, v*w^3*x*y*z, z*y*x^2*v^3, w*y*z*x^2*v^2, v*w^2*x^2*y*z, w^3*x^2*y*z, z*y*x^3*v^2, v*y*z*x^3*w, z*y*w^2*x^3, z*y*x^4*v, w*y*z*x^4, y*z*x^5, w^2*z*y^2*v^2, v*w^2*x*y^2*z, w^2*z*y^2*x^2, z^2*v^5, w*z^2*v^4, w^2*v^3*z^2, x*v^4*z^2, w*x*v^3*z^2, w^2*z^2*x*v^2, x^2*v^3*z^2, w*z^2*x^2*v^2, w^2*x^2*v*z^2, z^2*v^2*x^3, w*z^2*v*x^3, w^2*x^3*z^2, z^2*v*x^4, w*x^4*z^2, z^2*x^5, y*v^4*z^2, w*y*v^3*z^2, w^2*y*v^2*z^2, z^2*y*x*v^3, w*x*y*v^2*z^2, v*w^2*x*y*z^2, z^2*y*x^2*v^2, w*y*x^2*v*z^2, w^2*y*x^2*z^2, z^2*y*x^3*v, w*y*x^3*z^2, y*x^4*z^2, w*z^2*y^2*v^2, v*w*x*y^2*z^2, w*z^2*y^2*x^2, z^3*v^4, w*v^3*z^3, x*v^3*z^3, w*z^3*x*v^2, z^3*x^2*v^2, w*x^2*v*z^3, v*x^3*z^3, w*x^3*z^3, z^3*x^4, y*v^3*z^3, w*y*v^2*z^3, y*z^3*x*v^2, v*w*x*y*z^3, z^3*y*x^2*v, w*y*x^2*z^3, y*x^3*z^3, z^3*y^2*v^2, z^3*x*v*y^2, y^2*x^2*z^3, z^4*v^3, z^4*x*v^2, z^4*x^2*v, z^4*x^3, z^4*y*v^2, x*y*v*z^4, z^4*y*x^2, v^6, w*v^5, w^2*v^4, w^3*v^3, v^5*x, x*w*v^4, x*w^2*v^3, x^2*v^4, w*v^3*x^2, w^3*x^2*v, x^3*v^3, w*v^2*x^3, w^2*v*x^3, w^3*x^3, x^4*v^2, w*v*x^4, w^2*x^4, x^5*v, w*x^5, x^6, y*v^5, y*w*v^4, w^2*v^3*y, w^3*v^2*y, y*v*w^4, x*v^4*y, w*x*v^3*y, w^2*x*v^2*y, x*y*v*w^3, y*x*w^4, y*v^3*x^2, w*v^2*x^2*y, v*w^2*x^2*y, w^3*x^2*y, y*v^2*x^3, v*y*w*x^3, w^2*x^3*y, y*v*x^4, w*x^4*y, y*x^5, w^3*v*y^2, w^3*x*y^2, z*v^5, z*w*v^4, z*w^2*v^3, w^3*v^2*z, x*z*v^4, z*x*w*v^3, w^2*x*v^2*z, w^3*z*x*v, z*v^3*x^2, w*v^2*x^2*z, v*w^2*x^2*z, w^3*x^2*z, z*v^2*x^3, v*z*w*x^3, w^2*z*x^3, z*v*x^4, w*z*x^4, z*x^5, z*v^4*y, z*y*w*v^3, w^2*z*v^2*y, z*y*v*w^3, z*y*x*v^3, w*y*z*v^2*x, z*x*y*v*w^2, z*y*x*w^3, z*y*x^2*v^2, v*z*y*x^2*w, w^2*z*x^2*y, v*y*z*x^3, w*y*z*x^3, y*z*x^4, w^2*z*v*y^2, w^2*z*x*y^2, z^2*v^4, z^2*w*v^3, w^2*v^2*z^2, x*v^3*z^2, w*x*z^2*v^2, w^2*v*x*z^2, v^2*x^2*z^2, w*v*x^2*z^2, w^2*x^2*z^2, v*x^3*z^2, w*x^3*z^2, z^2*x^4, z^2*v^3*y, w*y*z^2*v^2, w^2*z^2*v*y, z^2*y*x*v^2, w*y*v*x*z^2, w^2*z^2*y*x, v*y*x^2*z^2, w*y*x^2*z^2, y*x^3*z^2, w*z^2*v*y^2, w*z^2*x*y^2, z^3*v^3, w*v^2*z^3, x*v^2*z^3, w*v*x*z^3, v*x^2*z^3, w*z^3*x^2, z^3*x^3, y*v^2*z^3, w*z^3*v*y, y*v*x*z^3, w*z^3*x*y, x^2*z^3*y, z^3*v*y^2, y^2*z^3*x, z^4*v^2, z^4*x*v, z^4*x^2, z^4*y*v, z^4*y*x, v^5, v^4*w, v^3*w^2, w^3*v^2, w^4*v, v^4*x, v^3*w*x, v^2*w^2*x, w^3*x*v, w^4*x, v^3*x^2, v^2*w*x^2, v*x^2*w^2, w^3*x^2, x^3*v^2, v*w*x^3, x^3*w^2, x^4*v, x^4*w, x^5, v^4*y, v^3*w*y, v^2*w^2*y, w^3*v*y, w^4*y, x*v^3*y, v^2*w*y*x, w^2*v*y*x, w^3*y*x, x^2*v^2*y, v*x^2*w*y, w^2*x^2*y, x^3*v*y, x^3*y*w, x^4*y, w^3*y^2, v^4*z, v^3*w*z, v^2*w^2*z, w^3*v*z, v^3*x*z, v^2*w*x*z, w^2*v*x*z, w^3*x*z, v^2*x^2*z, v*x^2*w*z, w^2*x^2*z, x^3*v*z, w*x^3*z, x^4*z, v^3*y*z, v^2*w*y*z, w^2*v*y*z, w^3*y*z, v^2*x*y*z, z*y*x*w*v, w^2*x*y*z, v*x^2*y*z, w*x^2*y*z, x^3*y*z, y^2*w^2*z, z^2*v^3, z^2*v^2*w, z^2*v*w^2, v^2*x*z^2, z^2*v*x*w, z^2*w^2*x, z^2*v*x^2, w*x^2*z^2, z^2*x^3, z^2*v^2*y, z^2*v*w*y, z^2*w^2*y, z^2*v*y*x, z^2*w*y*x, z^2*y*x^2, y^2*w*z^2, y^3*z^2, z^3*v^2, v*w*z^3, v*x*z^3, z^3*x*w, x^2*z^3, v*y*z^3, z^3*y*w, x*z^3*y, y^2*z^3, z^4*v, z^4*x, v^4, v^3*w, v^2*w^2, w^3*v, w^4, x*v^3, v^2*x*w, w^2*x*v, w^3*x, v^2*x^2, x^2*v*w, w^2*x^2, x^3*v, x^3*w, x^4, y*v^3, v^2*w*y, w^2*v*y, y*w^3, v^2*y*x, y*x*w*v, w^2*x*y, v*y*x^2, w*x^2*y, y*x^3, v^2*y^2, x*v*y^2, v^3*z, v^2*w*z, w^2*v*z, z*w^3, x*v^2*z, v*w*x*z, z*x*w^2, z*x^2*v, w*x^2*z, z*x^3, z*y*v^2, z*y*w*v, z*y*w^2, z*y*x*v, w*x*y*z, z*y*x^2, v*w*z^2, w^2*z^2, z^2*w*x, z^2*x^2, y*v*z^2, y*w*z^2, x*y*z^2, v*z^3, w*z^3, z^3*x, z^3*y, z^4, v^3, v^2*w, w^2*v, w^3, x*v^2, v*x*w, x*w^2, v*x^2, w*x^2, x^3, y*v^2, y*w*v, y*w^2, v*x*y, y*x*w, y*x^2, y^2*v, y^2*x, z*v^2, v*z*w, z*w^2, v*x*z, z*x*w, z*x^2, v*y*z, y*z*w, x*y*z, z^2*w, y*z^2, z^3, v^2, v*w, w^2, x*v, x*w, x^2, y*v, y*w, x*y, y^2, z*v, z*w, x*z, y*z, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_optpose3pt_v2 = [Err_optpose3pt_v2 err];
    Tm_optpose3pt_v2 = [Tm_optpose3pt_v2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_optpose3pt_v2.mat'),'Err_optpose3pt_v2');
save(strcat(folder,'\_results\Tm_optpose3pt_v2.mat'),'Tm_optpose3pt_v2');

fprintf('Problem #30. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_optpose3pt_v2),median(Err_optpose3pt_v2));