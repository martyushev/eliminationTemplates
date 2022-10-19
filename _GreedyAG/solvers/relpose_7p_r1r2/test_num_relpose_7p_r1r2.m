rng(23);

N = 10000;

Err_relpose_7p_r1r2 = [];
Tm_relpose_7p_r1r2 = [];

for i = 1:N

    data = inidata_relpose_7p_r1r2(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_7p_r1r2(data); % compute coefficients of polynomial system
        [vv,ww,xx,yy,zz] = std_436x512_colpiv_relpose_7p_r1r2(C); % solve polynomial system
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
        m = [v^3*y^3,w*z*v^2*y^2,v^2*y^2*x*z,w^2*z^2*v*y,w*z^2*v*y*x,v*y*x^2*z^2,w^3*z^3,w^2*z^3*x,x^2*z^3*w,x^3*z^3,v^3*y^2,v^2*y^2*w,y^2*x*v^2,v^2*y^3,v^2*w*z*y,w^2*v*z*y,v^2*x*z*y,x*w*z*v*y,v*x^2*y*z,v^2*y^2*z,w*z*v*y^2,v*y^2*x*z,z^2*w^2*v,z^2*w^3,z^2*w*v*x,z^2*w^2*x,z^2*x^2*v,z^2*x^2*w,x^3*z^2,z^2*v*y*w,z^2*w^2*y,z^2*v*x*y,w*z^2*x*y,z^2*y*x^2,z^3*w^2,z^3*w*x,z^3*x^2,v^3*y,v^2*y*w,v*y*w^2,v^2*x*y,v*y*w*x,v*y*x^2,v^2*y^2,w*v*y^2,v*y^2*x,v*y^3,w*z*v^2,v*z*w^2,z*w^3,z*x*v^2,w*z*x*v,z*w^2*x,z*v*x^2,z*w*x^2,z*x^3,y*z*v^2,w*y*z*v,z*w^2*y,y*z*x*v,z*w*x*y,z*x^2*y,v*y^2*z,z*y^2*w,z*x*y^2,v*z^2*w,z^2*w^2,z^2*x*v,w*z^2*x,z^2*x^2,v*z^2*y,z^2*w*y,z^2*x*y,z^3*w,z^3*x,v^3,w*v^2,w^2*v,w^3,x*v^2,w*x*v,x*w^2,x^2*v,w*x^2,x^3,y*v^2,w*v*y,w^2*y,v*x*y,x*y*w,y*x^2,y^2*v,w*y^2,x*y^2,y^3,z*v^2,z*w*v,z*w^2,x*z*v,w*x*z,z*x^2,v*y*z,y*z*w,y*z*x,z*y^2,z^2*v,z^2*w,x*z^2,z^2*y,z^3,v^2,w*v,w^2,x*v,w*x,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,z*y,z^2,v,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(76,length(M))),'fro');

    Err_relpose_7p_r1r2 = [Err_relpose_7p_r1r2 err];
    Tm_relpose_7p_r1r2 = [Tm_relpose_7p_r1r2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_r1r2.mat'),'Err_relpose_7p_r1r2');

fprintf('Problem: relpose_7p_r1r2. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_r1r2),median(Err_relpose_7p_r1r2));
