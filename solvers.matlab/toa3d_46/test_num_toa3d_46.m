rng(23);
N = 10000;
nRoots = 38;
iterRef = 0;

stats = ini_stats('toa3d_46');
stats.solver = 'red_148x211_toa3d_46';

for i = 1:N

    tic;
    data = inidata_num_toa3d_46();
    [C,U,dU] = coefs_toa3d_46(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);