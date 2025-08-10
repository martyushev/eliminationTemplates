rng(23);
N = 10000;
nRoots = 15;
iterRef = 0;

stats = ini_stats('focal6p');
stats.solver = 'red_11x26_focal6p';

for i = 1:N

    tic;
    data = inidata_num_focal6p();
    [C,U,dU] = coefs_focal6p(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);