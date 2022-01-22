rng(23);

N = 10000;

Err_relpose_6p_rad_1s = [];
Tm_relpose_6p_rad_1s = [];

for i = 1:N

    data = inidata_relpose_6p_rad_1s(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_6p_rad_1s(data); % compute coefficients of polynomial system
        [xx, yy, zz] = nstd_relpose_6p_rad_1s_colpiv(C); % solve polynomial system
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
        m = [x^3*z^3, x^2*z^3*y, y^2*z^3*x, y^3*z^3, x^3*z^2, x^2*z^2*y, x*y^2*z^2, y^3*z^2, z^3*x^2, z^3*y*x, z^3*y^2, z*x^3, z*y*x^2, z*y^2*x, z*y^3, z^2*x^2, x*y*z^2, z^2*y^2, z^3*x, z^3*y, x^3, x^2*y, y^2*x, y^3, x^2*z, x*y*z, y^2*z, z^2*x, y*z^2, z^3, x^2, y*x, y^2, z*x, y*z, z^2, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_6p_rad_1s = [Err_relpose_6p_rad_1s err];
    Tm_relpose_6p_rad_1s = [Tm_relpose_6p_rad_1s tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_6p_rad_1s.mat'),'Err_relpose_6p_rad_1s');
save(strcat(folder,'\_results\Tm_relpose_6p_rad_1s.mat'),'Tm_relpose_6p_rad_1s');

fprintf('Problem #4. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_6p_rad_1s),median(Err_relpose_6p_rad_1s));