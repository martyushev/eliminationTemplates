rng(23);

N = 10000;

Err_optpose3pt_v2 = [];
Tm_optpose3pt_v2 = [];

for i = 1:N

    data = inidata_optpose3pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose3pt_v2(data); % compute coefficients of polynomial system
        [vv,ww,xx,yy,zz] = nstd_385x433_colpiv_optpose3pt_v2(C); % solve polynomial system
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
        m = [v^3,v^2*w,w^2*v,w^3,v^2*x,v*x*w,w^2*x,v*x^2,w*x^2,x^3,v^2*y,y*w*v,y*w^2,v*x*y,w*x*y,y*x^2,y^2*v,y^2*w,y^2*x,y^3,v^2*z,z*w*v,z*w^2,z*x*v,z*x*w,z*x^2,z*y*v,z*y*w,y*x*z,z*y^2,z^2*v,z^2*w,z^2*x,z^2*y,z^3,v^2,w*v,w^2,x*v,x*w,x^2,v*y,w*y,y*x,y^2,v*z,w*z,x*z,y*z,z^2,v,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(48,length(M))),'fro');

    Err_optpose3pt_v2 = [Err_optpose3pt_v2 err];
    Tm_optpose3pt_v2 = [Tm_optpose3pt_v2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_optpose3pt_v2.mat'),'Err_optpose3pt_v2');

fprintf('Problem: optpose3pt_v2. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_optpose3pt_v2),median(Err_optpose3pt_v2));
