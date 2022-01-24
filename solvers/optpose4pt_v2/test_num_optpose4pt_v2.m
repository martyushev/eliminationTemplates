rng(23);

N = 10000;

Err_optpose4pt_v2 = [];
Tm_optpose4pt_v2 = [];

for i = 1:N

    data = inidata_optpose4pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose4pt_v2(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_134x162_colpiv_optpose4pt_v2(C); % solve polynomial system
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
        m = [y*v^4, y*w*v^3, v^2*y*w^2, y*w^3*v, y*x*v^3, y*x*w*v^2, y*x*w^2*v, y*x^2*v^2, y*x^2*w*v, y*x^3*v, w*v^3*z, w^2*v^2*z, z*w^3*v, z*w^4, x*v^3*z, x*v^2*w*z, z*x*w^2*v, x*w^3*z, z*x^2*v^2, z*x^2*w*v, z*x^2*w^2, z*x^3*v, z*x^3*w, z*x^4, y*v^3*z, y*v^2*w*z, w^2*y*z*v, z*y*w^3, x*v^2*y*z, z*y*x*w*v, x*z*y*w^2, z*y*x^2*v, w*x^2*z*y, x^3*z*y, v^3*z^2, v^2*w*z^2, w^2*v*z^2, z^2*w^3, v^2*x*z^2, x*v*w*z^2, x*z^2*w^2, x^2*v*z^2, z^2*x^2*w, z^2*x^3, y*v^2*z^2, y*v*w*z^2, y*z^2*w^2, y*v*x*z^2, z^2*y*x*w, z^2*y*x^2, v^2*z^3, z^3*w*v, z^3*w^2, v*x*z^3, w*z^3*x, z^3*x^2, z^3*y*v, z^3*y*w, x*z^3*y, z^4*v, z^4*w, z^4*x, z^4*y, z^5, v^3*w, v^2*w^2, w^3*v, w^4, v^3*x, w*v^2*x, x*w^2*v, x*w^3, x^2*v^2, x^2*w*v, x^2*w^2, x^3*v, x^3*w, x^4, v^3*y, w*v^2*y, y*w^2*v, w^3*y, x*v^2*y, y*x*w*v, y*x*w^2, y*x^2*v, x^2*w*y, y*x^3, z*v^3, v^2*w*z, v*z*w^2, z*w^3, v^2*x*z, v*w*x*z, x*z*w^2, v*x^2*z, z*w*x^2, z*x^3, v^2*y*z, w*y*z*v, z*w^2*y, x*y*z*v, y*z*w*x, z*y*x^2, z^2*v^2, z^2*v*w, z^2*w^2, z^2*v*x, x*z^2*w, z^2*x^2, z^2*y*v, z^2*w*y, x*y*z^2, z^3*v, z^3*w, z^3*x, z^3*y, z^4, v^3, v^2*w, v*w^2, w^3, v^2*x, v*w*x, w^2*x, x^2*v, x^2*w, x^3, v^2*y, y*w*v, w^2*y, x*y*v, y*w*x, x^2*y, z*v^2, v*w*z, z*w^2, x*z*v, x*z*w, z*x^2, z*v*y, y*z*w, y*z*x, v*z^2, w*z^2, z^2*x, y*z^2, z^3, v^2, w*v, w^2, x*v, w*x, x^2, v*y, w*y, x*y, v*z, z*w, z*x, y*z, z^2, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_optpose4pt_v2 = [Err_optpose4pt_v2 err];
    Tm_optpose4pt_v2 = [Tm_optpose4pt_v2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_optpose4pt_v2.mat'),'Err_optpose4pt_v2');
save(strcat(folder,'\_results\Tm_optpose4pt_v2.mat'),'Tm_optpose4pt_v2');

fprintf('Problem #29. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_optpose4pt_v2),median(Err_optpose4pt_v2));