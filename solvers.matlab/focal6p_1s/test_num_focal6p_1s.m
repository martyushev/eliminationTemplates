rng(23);
N = 10000;
nRoots = 9;
iterRef = 0;

stats = ini_stats('focal6p_1s');
stats.solver = 'red_11x20_focal6p_1s';

for i = 1:N

    tic;
    data = inidata_num_focal6p_1s();
    [C,U,dU] = coefs_focal6p_1s(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);