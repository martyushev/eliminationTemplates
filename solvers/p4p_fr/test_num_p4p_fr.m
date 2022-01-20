rng(23);

N = 10000;

Err_p4p_fr = [];
Tm_p4p_fr = [];

for i = 1:N

    data = inidata_p4p_fr(); % generate initial data of the problem

    try
        tic;
        C = coefs_p4p_fr(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = std_p4p_fr_colpiv_sprs(C); % solve polynomial system
        tm = toc;
        if isempty(ww); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(ww)
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [w^2*x, y*w*x, y^2*x, x*z*w, y*z*x, z^2*x, w^2, x*w, w*y, y*x, y^2, z*w, z*x, y*z, z^2, w, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_p4p_fr = [Err_p4p_fr err];
    Tm_p4p_fr = [Tm_p4p_fr tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_p4p_fr.mat'),'Err_p4p_fr');
save(strcat(folder,'\_results\Tm_p4p_fr.mat'),'Tm_p4p_fr');

fprintf('Problem #6. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_p4p_fr),median(Err_p4p_fr));