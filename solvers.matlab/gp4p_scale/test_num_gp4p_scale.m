rng(23);
N = 10000;
nRoots = 8;
iterRef = 0;

stats = ini_stats('gp4p_scale');
stats.solver = 'red_40x52_gp4p_scale';

for i = 1:N

    tic;
    data = inidata_num_gp4p_scale();
    [C,U,dU] = coefs_gp4p_scale(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);