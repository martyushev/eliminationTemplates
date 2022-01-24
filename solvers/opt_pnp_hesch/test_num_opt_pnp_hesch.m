rng(23);

N = 10000;

Err_opt_pnp_hesch = [];
Tm_opt_pnp_hesch = [];

for i = 1:N

    data = inidata_opt_pnp_hesch(); % generate initial data of the problem

    try
        tic;
        C = coefs_opt_pnp_hesch(data); % compute coefficients of polynomial system
        [xx, yy, zz] = std_87x114_colpiv_opt_pnp_hesch(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [x^3, x^2*y, y^2*x, y^3, z*x^2, y*z*x, y^2*z, z^2*x, y*z^2, z^3, x^2, y*x, y^2, z*x, y*z, z^2, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_opt_pnp_hesch = [Err_opt_pnp_hesch err];
    Tm_opt_pnp_hesch = [Tm_opt_pnp_hesch tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_opt_pnp_hesch.mat'),'Err_opt_pnp_hesch');
save(strcat(folder,'\_results\Tm_opt_pnp_hesch.mat'),'Tm_opt_pnp_hesch');

fprintf('Problem #18. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_opt_pnp_hesch),median(Err_opt_pnp_hesch));