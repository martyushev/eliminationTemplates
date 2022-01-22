rng(23);

N = 10000;

Err_gen5pra = [];
Tm_gen5pra = [];

for i = 1:N

    data = inidata_gen5pra(); % generate initial data of the problem

    try
        tic;
        C = coefs_gen5pra(data); % compute coefficients of polynomial system
        [uu, vv, ww] = std_gen5pra_colpiv(C); % solve polynomial system
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
        m = [u^8, u*v^7, w*u*v^6, w*v^7, v^5*u*w^2, v^6*w^2, v^4*u*w^3, v^5*w^3, v^3*u*w^4, v^4*w^4, v^2*u*w^5, v^3*w^5, v*u*w^6, v^2*w^6, w^7*u, v*w^7, w^8, u^7, u^6*v, u^6*w, u^5*w*v, u^5*w^2, u^4*w^2*v, u^4*w^3, w^3*u*v^3, v^2*w^4*u, v^3*w^4, v*w^5*u, v^2*w^5, w^6*u, w^6*v, w^7, u^6, u^5*v, u^5*w, w*u^4*v, u^4*w^2, w^2*u^3*v, w^3*u^3, u^2*w^3*v, u^2*w^4, u*w^4*v, u*w^5, w^5*v, w^6, u^5, u^4*v, u^4*w, u^3*v*w, u^3*w^2, u^2*w^2*v, u^2*w^3, u*v*w^3, u*w^4, w^4*v, w^5, u^4, u^3*v, u^3*w, u^2*v*w, u^2*w^2, u*w^2*v, u*w^3, w^3*v, w^4, u^3, v*u^2, u^2*w, u*v*w, u*w^2, w^2*v, w^3, u^2, v*u, u*w, w*v, w^2, u, v, w, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_gen5pra = [Err_gen5pra err];
    Tm_gen5pra = [Tm_gen5pra tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_gen5pra.mat'),'Err_gen5pra');
save(strcat(folder,'\_results\Tm_gen5pra.mat'),'Tm_gen5pra');

fprintf('Problem #26. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_gen5pra),median(Err_gen5pra));