rng(23);

N = 10000;

Err_focal6p_1s = [];
Tm_focal6p_1s = [];

for i = 1:N

    data = inidata_focal6p_1s(); % generate initial data of the problem

    try
        tic;
        [C,~] = coefs_focal6p_1s(data); % compute coefficients of polynomial system
        [gg, uu, vv] = std_focal6p_1s_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(gg); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(gg)
        g = gg(j);
        u = uu(j);
        v = vv(j);
        m = [g*u^3, g*u^2*v, g*u*v^2, g*v^3, u^2*g, u^3, v*u*g, v*u^2, v^2*g, v^2*u, v^3, g*u, u^2, g*v, v*u, v^2, g, u, v, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_focal6p_1s = [Err_focal6p_1s err];
    Tm_focal6p_1s = [Tm_focal6p_1s tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_focal6p_1s.mat'),'Err_focal6p_1s');
save(strcat(folder,'\_results\Tm_focal6p_1s.mat'),'Tm_focal6p_1s');

fprintf('Problem #2. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_focal6p_1s),median(Err_focal6p_1s));