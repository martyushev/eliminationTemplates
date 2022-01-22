rng(23);

N = 10000;

Err_relpose_7p_fr = [];
Tm_relpose_7p_fr = [];

for i = 1:N

    data = inidata_relpose_7p_fr(); % generate initial data of the problem

    try
        tic;
        [C,~] = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_relpose_7p_fr_colpiv(C); % solve polynomial system
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
        m = [v*w^3*z^3, v*w^2*z^3*x, v*w*z^3*x^2, v*x^3*z^3, v*w^2*z^3*y, v*x*z^3*y*w, v*x^2*z^3*y, v*w*z^3*y^2, v*x*z^3*y^2, v*y^3*z^3, v*w^3*z^2, v*x*w^2*z^2, v*w*z^2*x^2, v*x^3*z^2, v*y*w^2*z^2, v*y*w*z^2*x, v*y*x^2*z^2, v*w*z^2*y^2, v*x*z^2*y^2, v*y^3*z^2, v*w^2*z^3, z^3*w^3, v*w*z^3*x, z^3*x*w^2, v*x^2*z^3, z^3*w*x^2, z^3*x^3, v*w*z^3*y, z^3*y*w^2, v*x*z^3*y, z^3*w*x*y, z^3*x^2*y, v*y^2*z^3, z^3*w*y^2, z^3*x*y^2, z^3*y^3, z*w^3*v, x*v^2*w*z, v*w^2*x*z, x^2*v^2*z, x^2*v*w*z, x^3*v*z, v^2*y*w*z, v*y*w^2*z, x*v^2*y*z, x*v*y*w*z, x^2*v*y*z, z*y^2*v^2, v*y^2*w*z, x*v*y^2*z, z*y^3*v, z^2*w^2*v, z^2*w^3, v*w*z^2*x, z^2*w^2*x, v*x^2*z^2, z^2*x^2*w, z^2*x^3, v*w*z^2*y, y*z^2*w^2, v*x*z^2*y, y*x*z^2*w, z^2*x^2*y, z^2*y^2*v, y^2*z^2*w, x*y^2*z^2, y^3*z^2, z^3*w*v, z^3*w^2, v*z^3*x, z^3*x*w, z^3*x^2, z^3*y*v, w*y*z^3, z^3*y*x, z^3*y^2, v*w^3, w*x*v^2, x*w^2*v, x^2*v^2, w*x^2*v, x^3*v, w*y*v^2, y*w^2*v, x*y*v^2, w*x*y*v, x^2*y*v, y^2*v^2, w*y^2*v, x*y^2*v, v*y^3, z*w*v^2, v*w^2*z, w^3*z, z*x*v^2, z*w*x*v, z*w^2*x, x^2*v*z, z*w*x^2, z*x^3, z*v^2*y, v*y*w*z, y*z*w^2, z*y*x*v, z*w*x*y, z*x^2*y, v*y^2*z, z*w*y^2, z*y^2*x, z*y^3, v*w*z^2, z^2*w^2, v*x*z^2, x*z^2*w, z^2*x^2, v*y*z^2, z^2*y*w, z^2*y*x, z^2*y^2, z^3*v, z^3*w, z^3*x, z^3*y, v^2*w, v*w^2, w^3, v^2*x, x*v*w, x*w^2, x^2*v, x^2*w, x^3, v^2*y, v*y*w, y*w^2, x*v*y, y*x*w, x^2*y, y^2*v, y^2*w, x*y^2, y^3, z*v^2, v*w*z, z*w^2, x*v*z, z*x*w, z*x^2, z*y*v, z*y*w, z*x*y, z*y^2, z^2*v, z^2*w, z^2*x, z^2*y, z^3, v^2, w*v, w^2, x*v, x*w, x^2, y*v, y*w, y*x, y^2, v*z, z*w, x*z, z*y, z^2, v, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_7p_fr = [Err_relpose_7p_fr err];
    Tm_relpose_7p_fr = [Tm_relpose_7p_fr tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fr.mat'),'Err_relpose_7p_fr');
save(strcat(folder,'\_results\Tm_relpose_7p_fr.mat'),'Tm_relpose_7p_fr');

fprintf('Problem #33. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fr),median(Err_relpose_7p_fr));