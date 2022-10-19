rng(23);

N = 100;

Err_calib_unsynch = [];
Tm_calib_unsynch = [];

for i = 1:N

    data = inidata_calib_unsynch(); % generate initial data of the problem

    try
        C = coefs_calib_unsynch(data); % compute coefficients of polynomial system
        tic;
        %[uu,vv,ww,xx,yy,zz] = std_458x510_colpiv_calib_unsynch(C); % solve polynomial system
        [uu,vv,ww,xx,yy,zz] = red_134x213_colpiv_calib_unsynch(C);
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
        m = [u^3*z^3, u^2*v*z^3, u*v^2*z^3, v^3*z^3, u^2*w*z^3, u*v*w*z^3, v^2*w*z^3, u*w^2*z^3, v*w^2*z^3, w^3*z^3, u^2*x*z^3, u*v*x*z^3, v^2*x*z^3, u*w*x*z^3, v*w*x*z^3, w^2*x*z^3, u*x^2*z^3, v*x^2*z^3, w*x^2*z^3, x^3*z^3, u^2*y*z^3, u*v*y*z^3, v^2*y*z^3, u*w*y*z^3, v*w*y*z^3, w^2*y*z^3, u*x*y*z^3, v*x*y*z^3, w*x*y*z^3, x^2*y*z^3, u*y^2*z^3, v*y^2*z^3, w*y^2*z^3, x*y^2*z^3, y^3*z^3, u^3*z^2, u^2*v*z^2, u*v^2*z^2, v^3*z^2, u^2*w*z^2, u*v*w*z^2, v^2*w*z^2, u*w^2*z^2, v*w^2*z^2, w^3*z^2, u^2*x*z^2, u*v*x*z^2, v^2*x*z^2, u*w*x*z^2, v*w*x*z^2, w^2*x*z^2, u*x^2*z^2, v*x^2*z^2, w*x^2*z^2, x^3*z^2, u^2*y*z^2, u*v*y*z^2, v^2*y*z^2, u*w*y*z^2, v*w*y*z^2, w^2*y*z^2, u*x*y*z^2, v*x*y*z^2, w*x*y*z^2, x^2*y*z^2, u*y^2*z^2, v*y^2*z^2, w*y^2*z^2, x*y^2*z^2, y^3*z^2, u^2*z^3, u*v*z^3, v^2*z^3, u*w*z^3, v*w*z^3, w^2*z^3, u*x*z^3, v*x*z^3, w*x*z^3, x^2*z^3, u*y*z^3, v*y*z^3, w*y*z^3, x*y*z^3, y^2*z^3, u^3*z, u^2*v*z, u*v^2*z, v^3*z, u^2*w*z, v*w*z*u, v^2*w*z, u*w^2*z, v*w^2*z, w^3*z, u^2*x*z, v*x*z*u, v^2*x*z, w*x*z*u, v*w*z*x, w^2*x*z, u*x^2*z, v*x^2*z, w*x^2*z, x^3*z, u^2*y*z, u*y*z*v, v^2*y*z, u*y*z*w, v*w*z*y, w^2*y*z, z*y*x*u, z*y*x*v, z*y*x*w, z*y*x^2, z*y^2*u, z*y^2*v, z*y^2*w, z*y^2*x, z*y^3, z^2*u^2, z^2*u*v, z^2*v^2, z^2*u*w, z^2*v*w, z^2*w^2, z^2*u*x, z^2*v*x, z^2*w*x, z^2*x^2, z^2*u*y, z^2*v*y, z^2*w*y, z^2*y*x, z^2*y^2, u*z^3, v*z^3, w*z^3, z^3*x, z^3*y, u^3, u^2*v, u*v^2, v^3, u^2*w, u*v*w, v^2*w, w^2*u, w^2*v, w^3, u^2*x, u*v*x, v^2*x, x*w*u, x*w*v, x*w^2, x^2*u, x^2*v, x^2*w, x^3, u^2*y, u*v*y, v^2*y, y*w*u, y*w*v, y*w^2, u*x*y, v*x*y, w*x*y, x^2*y, u*y^2, v*y^2, w*y^2, x*y^2, y^3, z*u^2, z*v*u, z*v^2, z*w*u, z*w*v, z*w^2, z*u*x, v*x*z, w*x*z, x^2*z, u*y*z, v*y*z, w*y*z, x*y*z, y^2*z, z^2*u, z^2*v, z^2*w, x*z^2, y*z^2, z^3, u^2, v*u, v^2, u*w, v*w, w^2, u*x, v*x, w*x, x^2, u*y, v*y, w*y, x*y, y^2, z*u, z*v, z*w, z*x, z*y, z^2, u, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(52,length(M))),'fro');

    Err_calib_unsynch = [Err_calib_unsynch err];
    Tm_calib_unsynch = [Tm_calib_unsynch tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_calib_unsynch.mat'),'Err_calib_unsynch');

fprintf('Problem: calib_unsynch. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_calib_unsynch),median(Err_calib_unsynch));
