rng(23);

N = 10000;

Err_gp4p_scale = [];
Tm_gp4p_scale = [];

for i = 1:N

    data = inidata_gp4p_scale(); % generate initial data of the problem

    try
        tic;
        C = coefs_gp4p_scale(data); % compute coefficients of polynomial system
        [x1x1, x2x2, x3x3, x4x4, x5x5] = std_47x55_colpiv_gp4p_scale(C); % solve polynomial system
        tm = toc;
        if isempty(x1x1); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(x1x1)
        x1 = x1x1(j);
        x2 = x2x2(j);
        x3 = x3x3(j);
        x4 = x4x4(j);
        x5 = x5x5(j);
        m = [x1^2, x1*x2, x2^2, x1*x3, x2*x3, x3^2, x1*x4, x2*x4, x3*x4, x4^2, x1*x5, x2*x5, x3*x5, x4*x5, x5^2, x1, x2, x3, x4, x5, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_gp4p_scale = [Err_gp4p_scale err];
    Tm_gp4p_scale = [Tm_gp4p_scale tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_gp4p_scale.mat'),'Err_gp4p_scale');
save(strcat(folder,'\_results\Tm_gp4p_scale.mat'),'Tm_gp4p_scale');

fprintf('Problem #24. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_gp4p_scale),median(Err_gp4p_scale));