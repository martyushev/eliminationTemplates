rng(23);

N = 10000;

Err_3pra_st0 = [];
Tm_3pra_st0 = [];

for i = 1:N

    data = inidata_3pra_st0(); % generate initial data of the problem

    try
        tic;
        C = coefs_3pra_st0(data); % compute coefficients of polynomial system
        [uu,vv,ww] = std_13x25_colpiv_3pra_st0(C); % solve polynomial system
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
        m = [u^4,u^3*v,u^2*v^2,u*v^3,v^4,u^3*w,u^2*v*w,u*v^2*w,v^3*w,u^2*w^2,u*v*w^2,v^2*w^2,w^3*u,w^3*v,w^4,u^3,u^2*v,v^2*u,v^3,u^2*w,w*v*u,w*v^2,u*w^2,v*w^2,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(12,length(M))),'fro');

    Err_3pra_st0 = [Err_3pra_st0 err];
    Tm_3pra_st0 = [Tm_3pra_st0 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_3pra_st0.mat'),'Err_3pra_st0');

fprintf('Problem: 3pra_st0. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_3pra_st0),median(Err_3pra_st0));
