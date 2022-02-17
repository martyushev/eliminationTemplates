rng(23);

N = 10000;

Err_r6p = [];
Tm_r6p = [];

for i = 1:N

    data = inidata_r6p(); % generate initial data of the problem

    try
        tic;
        C = coefs_r6p(data); % compute coefficients of polynomial system
        [uu,vv,ww,xx,yy,zz] = std_120x140_colpiv_r6p(C); % solve polynomial system
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
        m = [u*x,v*x,w*x,u*y,v*y,w*y,u*z,z*v,w*z,u,v,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(20,length(M))),'fro');

    Err_r6p = [Err_r6p err];
    Tm_r6p = [Tm_r6p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_r6p.mat'),'Err_r6p');

fprintf('Problem: r6p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_r6p),median(Err_r6p));
