rng(23);

N = 10000;

Err_4pra = [];
Tm_4pra = [];

for i = 1:N

    data = inidata_4pra(); % generate initial data of the problem

    try
        tic;
        C = coefs_4pra(data); % compute coefficients of polynomial system
        [uu, vv, ww] = std_16x36_colpiv_4pra(C); % solve polynomial system
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
        m = [u^5, u^4*v, u^3*v^2, u^4*w, v^3*w*u, w^2*v^3, u*v*w^3, v^2*w^3, u*w^4, w^4*v, w^5, u^4, u^3*v, u^2*v^2, u*v^3, u^3*w, u^2*v*w, u*v^2*w, w^3*v, w^4, u^3, v*u^2, v^2*u, v^3, u^2*w, u*v*w, w*v^2, u^2, v*u, v^2, u*w, w*v, u, v, w, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_4pra = [Err_4pra err];
    Tm_4pra = [Tm_4pra tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_4pra.mat'),'Err_4pra');
save(strcat(folder,'\_results\Tm_4pra.mat'),'Tm_4pra');

fprintf('Problem #25. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_4pra),median(Err_4pra));