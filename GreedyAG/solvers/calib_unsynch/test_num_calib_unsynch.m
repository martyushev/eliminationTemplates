rng(23);

N = 10000;

Err_calib_unsynch = [];
Tm_calib_unsynch = [];

for i = 1:N

    data = inidata_calib_unsynch(); % generate initial data of the problem

    try
        tic;
        C = coefs_calib_unsynch(data); % compute coefficients of polynomial system
        [uu,vv,ww,xx,yy,zz] = std_458x510_colpiv_calib_unsynch(C); % solve polynomial system
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
        m = [u^3*z^3,u^2*v*z^3,u*v^2*z^3,v^3*z^3,u^2*w*z^3,u*v*w*z^3,v^2*w*z^3,u*w^2*z^3,v*w^2*z^3,w^3*z^3,u^2*x*z^3,u*v*x*z^3,v^2*x*z^3,u*w*x*z^3,v*w*x*z^3,w^2*x*z^3,u*x^2*z^3,v*x^2*z^3,w*x^2*z^3,x^3*z^3,u^2*y*z^3,u*v*y*z^3,v^2*y*z^3,u*w*y*z^3,v*w*y*z^3,w^2*y*z^3,u*x*y*z^3,v*x*y*z^3,w*x*y*z^3,x^2*y*z^3,u*y^2*z^3,v*y^2*z^3,w*y^2*z^3,x*y^2*z^3,y^3*z^3,u^3*z^2,u^2*v*z^2,u*v^2*z^2,v^3*z^2,u^2*w*z^2,u*v*w*z^2,v^2*w*z^2,u*w^2*z^2,v*w^2*z^2,w^3*z^2,u^2*x*z^2,u*v*x*z^2,v^2*x*z^2,u*w*x*z^2,v*w*x*z^2,w^2*x*z^2,u*x^2*z^2,v*x^2*z^2,w*x^2*z^2,x^3*z^2,u^2*y*z^2,u*v*y*z^2,v^2*y*z^2,u*w*y*z^2,v*w*y*z^2,w^2*y*z^2,u*x*y*z^2,v*x*y*z^2,w*x*y*z^2,x^2*y*z^2,u*y^2*z^2,v*y^2*z^2,w*y^2*z^2,x*y^2*z^2,y^3*z^2,u^2*z^3,u*v*z^3,v^2*z^3,u*w*z^3,v*w*z^3,z^3*w^2,u*x*z^3,z^3*x*v,w*x*z^3,z^3*x^2,u*y*z^3,z^3*y*v,w*y*z^3,x*y*z^3,z^3*y^2,z*u^3,z*u^2*v,z*u*v^2,z*v^3,z*u^2*w,v*w*z*u,v^2*w*z,u*w^2*z,v*w^2*z,w^3*z,z*u^2*x,v*x*z*u,v^2*x*z,w*x*z*u,v*w*z*x,w^2*x*z,u*x^2*z,v*x^2*z,w*x^2*z,x^3*z,z*u^2*y,z*u*v*y,z*v^2*y,u*y*z*w,v*w*z*y,w^2*y*z,u*y*z*x,v*x*z*y,w*x*z*y,z*y*x^2,z*u*y^2,z*v*y^2,w*y^2*z,z*y^2*x,z*y^3,z^2*u^2,z^2*u*v,z^2*v^2,z^2*w*u,z^2*w*v,z^2*w^2,z^2*u*x,x*v*z^2,z^2*w*x,x^2*z^2,y*z^2*u,z^2*y*v,y*w*z^2,y*x*z^2,y^2*z^2,z^3*u,z^3*v,z^3*w,x*z^3,y*z^3,u^3,v*u^2,v^2*u,v^3,w*u^2,u*v*w,v^2*w,u*w^2,v*w^2,w^3,x*u^2,u*v*x,v^2*x,u*x*w,v*x*w,x*w^2,u*x^2,v*x^2,x^2*w,x^3,u^2*y,v*u*y,y*v^2,u*y*w,v*y*w,y*w^2,u*y*x,v*y*x,y*x*w,y*x^2,u*y^2,v*y^2,y^2*w,y^2*x,y^3,u^2*z,v*u*z,v^2*z,w*u*z,z*v*w,z*w^2,x*u*z,v*x*z,z*x*w,z*x^2,y*u*z,y*v*z,z*y*w,z*y*x,y^2*z,u*z^2,v*z^2,z^2*w,z^2*x,z^2*y,z^3,u^2,v*u,v^2,u*w,w*v,w^2,u*x,v*x,w*x,x^2,u*y,v*y,w*y,x*y,y^2,z*u,z*v,z*w,z*x,z*y,z^2,u,v,w,x,y,z,1];
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
