rng(23);
N = 10000;
nRoots = 16;
iterRef = 0;

stats = ini_stats('unsynch_relpose');
stats.solver = 'red_59x79_unsynch_relpose';

for i = 1:N

    tic;
    data = inidata_num_unsynch_relpose();
    [C,U,dU] = coefs_unsynch_relpose(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);