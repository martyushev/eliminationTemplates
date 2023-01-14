rng(23);

N = 10000;

Err_gen5pra = [];
Tm_gen5pra = [];

for i = 1:N

    data = inidata_gen5pra(); % generate initial data of the problem

    try
        tic;
        C = coefs_gen5pra(data); % compute coefficients of polynomial system
        [uu,vv,ww] = std_37x81_colpiv_gen5pra(C); % solve polynomial system
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
        m = [u^6,u^5*v,v^2*u^4,u^3*v^3,u^2*v^4,u*v^5,v^6,w*u^5,w*u^4*v,v^2*u^3*w,u^2*v^3*w,u*v^4*w,v^5*w,w^2*u^4,w^2*u^3*v,u^2*v^2*w^2,w^2*v^3*u,w^2*v^4,u^3*w^3,u^2*w^3*v,v^2*w^3*u,v^3*w^3,u^2*w^4,u*w^4*v,v^2*w^4,u*w^5,w^5*v,w^6,u^5,u^4*v,u^3*v^2,u^2*v^3,u*v^4,v^5,u^4*w,u^3*v*w,u^2*v^2*w,u*v^3*w,v^4*w,u^3*w^2,u^2*v*w^2,u*v^2*w^2,v^3*w^2,u^2*w^3,u*v*w^3,v^2*w^3,u*w^4,v*w^4,w^5,u^4,u^3*v,u^2*v^2,u*v^3,v^4,u^3*w,u^2*v*w,u*v^2*w,v^3*w,u^2*w^2,u*v*w^2,v^2*w^2,u*w^3,v*w^3,w^4,u^3,u^2*v,u*v^2,v^3,u^2*w,u*v*w,v^2*w,u*w^2,v*w^2,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(44,length(M))),'fro');

    Err_gen5pra = [Err_gen5pra err];
    Tm_gen5pra = [Tm_gen5pra tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_gen5pra.mat'),'Err_gen5pra');

fprintf('Problem: gen5pra. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_gen5pra),median(Err_gen5pra));
