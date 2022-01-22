rng(23);

N = 10000;

Err_relpose_7p_fuv_angle = [];
Tm_relpose_7p_fuv_angle = [];

for i = 1:N

    data = inidata_relpose_7p_fuv_angle(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_7p_fuv_angle(data); % compute coefficients of polynomial system
        [aa, bb, pp] = nstd_relpose_7p_fuv_angle_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(aa); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(aa)
        a = aa(j);
        b = bb(j);
        p = pp(j);
        m = [a^4, a^3*b, b^2*a^2, a*b^3, b^4, a^3, b*a^2, a*b^2, b^3, a^2*p, a*b*p, b^2*p, a^2, b*a, b^2, p*a, b*p, p^2, a, b, p, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_7p_fuv_angle = [Err_relpose_7p_fuv_angle err];
    Tm_relpose_7p_fuv_angle = [Tm_relpose_7p_fuv_angle tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fuv_angle.mat'),'Err_relpose_7p_fuv_angle');
save(strcat(folder,'\_results\Tm_relpose_7p_fuv_angle.mat'),'Tm_relpose_7p_fuv_angle');

fprintf('Problem #27. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fuv_angle),median(Err_relpose_7p_fuv_angle));