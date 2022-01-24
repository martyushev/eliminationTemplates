rng(23);

N = 10000;

Err_relpose_4pt = [];
Tm_relpose_4pt = [];

for i = 1:N

    data = inidata_relpose_4pt(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_4pt(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_99x119_colpiv_relpose_4pt(C); % solve polynomial system
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
        m = [y^4*x^2*w, y^5*x*v, y^5*x*w, y^6*v, z*y^4*x*v, z*y^4*x*w, y^5*v*z, y^5*w*z, v*x^4*z^2, w*x^4*z^2, v*x^3*y*z^2, z^2*y*x^3*w, v*y^2*z^2*x^2, z^2*y^2*x^2*w, z^2*y^3*x*v, z^2*y^3*x*w, z^2*y^4*v, z^2*y^4*w, z^3*x^3*v, z^3*x^3*w, z^3*y*x^2*v, z^3*y*x^2*w, z^3*y^2*x*v, z^3*y^2*x*w, z^3*y^3*v, z^3*y^3*w, y^4*x*v, y^4*x*w, y^5*v, y^5*w, y^5*x, y^6, x^5*z, x^4*y*z, y^2*z*x^3, z*y^3*x*v, z*y^3*x*w, x^2*y^3*z, y^4*v*z, y^4*w*z, y^4*x*z, y^5*z, v*x^3*z^2, z^2*x^3*w, x^4*z^2, v*z^2*y*x^2, w*x^2*y*z^2, y*z^2*x^3, x*v*z^2*y^2, w*x*y^2*z^2, x^2*y^2*z^2, v*y^3*z^2, w*z^2*y^3, x*y^3*z^2, y^4*z^2, z^3*x^2*v, w*z^3*x^2, v*x*y*z^3, w*z^3*x*y, v*y^2*z^3, w*z^3*y^2, y^3*x*v, y^3*x*w, y^4*v, y^4*w, y^4*x, y^5, z*x^4, x^3*z*y, y^2*v*x*z, x*z*y^2*w, x^2*y^2*z, y^3*v*z, y^3*w*z, y^3*z*x, y^4*z, x^2*v*z^2, z^2*x^2*w, z^2*x^3, y*v*x*z^2, z^2*y*x*w, z^2*y*x^2, y^2*v*z^2, y^2*z^2*w, z^2*y^2*x, y^3*z^2, v*x*z^3, w*z^3*x, z^3*y*v, z^3*y*w, x^3*y, y^2*v*x, w*x*y^2, x^2*y^2, y^3*v, y^3*w, y^3*x, z*x^3, x*y*z*v, y*z*w*x, z*y*x^2, z*y^2*v, w*y^2*z, x*z*y^2, z*y^3, z^2*v*x, x*z^2*w, z^2*x^2, z^2*y*v, z^2*w*y, z^2*y^2, z^3*v, z^3*w, x^3, x*y*v, x*y*w, x^2*y, y^2*v, y^2*w, y^2*x, y^3, x*z*v, x*z*w, x^2*z, y*z*v, y*z*w, x*y*z, y^2*z, v*z^2, w*z^2, x*v, x*w, x^2, v*y, w*y, x*y, y^2, v*z, z*w, z*x, y*z, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_4pt = [Err_relpose_4pt err];
    Tm_relpose_4pt = [Tm_relpose_4pt tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_4pt.mat'),'Err_relpose_4pt');
save(strcat(folder,'\_results\Tm_relpose_4pt.mat'),'Tm_relpose_4pt');

fprintf('Problem #21. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_4pt),median(Err_relpose_4pt));