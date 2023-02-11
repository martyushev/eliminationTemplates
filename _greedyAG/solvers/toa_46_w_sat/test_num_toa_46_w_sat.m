rng(23);

N = 10000;

Err_toa_46_w_sat = [];
Tm_toa_46_w_sat = [];

for i = 1:N

    data = inidata_toa_46_w_sat(); % generate initial data of the problem

    try
        tic;
        C = coefs_toa_46_w_sat(data); % compute coefficients of polynomial system
        [vv,ww,xx,yy,zz] = std_863x901_colpiv_toa_46_w_sat(C); % solve polynomial system
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
        m = [v^4,v^3*w,v^2*w^2,v*w^3,w^4,v^3*x,v^2*w*x,v*w^2*x,w^3*x,v^2*x^2,v*w*x^2,w^2*x^2,v*x^3,w*x^3,x^4,v^3*y,v^2*w*y,v*w^2*y,w^3*y,v^2*x*y,v*w*x*y,w^2*x*y,v*x^2*y,w*x^2*y,x^3*y,v^2*y^2,v*w*y^2,w^2*y^2,v*x*y^2,w*x*y^2,x^2*y^2,v*y^3,w*y^3,x*y^3,y^4,v^3*z,v^2*w*z,v*w^2*z,w^3*z,v^2*x*z,v*w*x*z,w^2*x*z,v*x^2*z,w*x^2*z,x^3*z,v^2*y*z,v*w*y*z,w^2*y*z,v*x*y*z,w*x*y*z,x^2*y*z,v*y^2*z,w*y^2*z,x*y^2*z,y^3*z,v^3,v^2*w,v*w^2,w^3,v^2*x,v*w*x,w^2*x,v*x^2,w*x^2,x^3,v^2*y,v*w*y,w^2*y,v*x*y,w*x*y,x^2*y,v*y^2,w*y^2,x*y^2,y^3,v^2*z,v*w*z,w^2*z,v*x*z,w*x*z,x^2*z,v*y*z,w*y*z,x*y*z,y^2*z,v^2,v*w,w^2,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v*z,w*z,x*z,y*z,v,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(38,length(M))),'fro');

    Err_toa_46_w_sat = [Err_toa_46_w_sat err];
    Tm_toa_46_w_sat = [Tm_toa_46_w_sat tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_toa_46_w_sat.mat'),'Err_toa_46_w_sat');

fprintf('Problem: toa_46_w_sat. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_toa_46_w_sat),median(Err_toa_46_w_sat));
