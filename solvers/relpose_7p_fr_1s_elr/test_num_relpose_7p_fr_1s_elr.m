rng(23);

N = 10000;

Err_relpose_7p_fr_1s_elr = [];
Tm_relpose_7p_fr_1s_elr = [];

for i = 1:N

    data = inidata_relpose_7p_fr_1s_elr(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_7p_fr_1s_elr(data); % compute coefficients of polynomial system
        [xx, yy, zz] = nstd_relpose_7p_fr_1s_elr_colpiv_sprs(C); % solve polynomial system
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
        m = [x^2*y^2*z^2, x*y^3*z^2, y^4*z^2, x^3*z*y, x^2*y^2*z, y^3*z*x, y^4*z, x^2*z^2*y, x*y^2*z^2, y^3*z^2, x^4, y*x^3, y^2*x^2, y^3*x, y^4, z*x^3, z*y*x^2, z*y^2*x, z*y^3, z^2*x^2, x*y*z^2, y^2*z^2, x^3, x^2*y, y^2*x, y^3, x^2*z, y*z*x, y^2*z, z^2*x, y*z^2, x^2, x*y, y^2, z*x, y*z, z^2, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_7p_fr_1s_elr = [Err_relpose_7p_fr_1s_elr err];
    Tm_relpose_7p_fr_1s_elr = [Tm_relpose_7p_fr_1s_elr tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fr_1s_elr.mat'),'Err_relpose_7p_fr_1s_elr');
save(strcat(folder,'\_results\Tm_relpose_7p_fr_1s_elr.mat'),'Tm_relpose_7p_fr_1s_elr');

fprintf('Problem #11. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fr_1s_elr),median(Err_relpose_7p_fr_1s_elr));