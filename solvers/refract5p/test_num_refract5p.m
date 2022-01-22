rng(23);

N = 10000;

Err_refract5p = [];
Tm_refract5p = [];

for i = 1:N

    data = inidata_refract5p(); % generate initial data of the problem

    try
        tic;
        C = coefs_refract5p(data); % compute coefficients of polynomial system
        [xx, yy, zz] = nstd_refract5p_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [x^3*z, z*x^2*y, z*y^2*x, z*y^3, z^2*x^2, z^2*y*x, z^2*y^2, z^3*x, z^3*y, z^4, x^3, x^2*y, x*y^2, y^3, z*x^2, y^2*z, z^2*x, z^2*y, z^3, x^2, y*x, y^2, x*z, y*z, z^2, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_refract5p = [Err_refract5p err];
    Tm_refract5p = [Tm_refract5p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_refract5p.mat'),'Err_refract5p');
save(strcat(folder,'\_results\Tm_refract5p.mat'),'Tm_refract5p');

fprintf('Problem #15. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_refract5p),median(Err_refract5p));