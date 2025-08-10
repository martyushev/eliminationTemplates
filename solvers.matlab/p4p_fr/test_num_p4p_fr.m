rng(23);
N = 10000;
nRoots = 16;
iterRef = 0;

stats = ini_stats('p4p_fr');
stats.solver = 'red_42x60_p4p_fr';

for i = 1:N

    tic;
    data = inidata_num_p4p_fr();
    [C,U,dU] = coefs_p4p_fr(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);