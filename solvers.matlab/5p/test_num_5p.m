rng(23);
N = 10000;
nRoots = 10;
iterRef = 0;

stats = ini_stats('5p');
stats.solver = 'red_10x20_5p';

for i = 1:N

    tic;
    data = inidata_num_5p();
    [C,U,dU] = coefs_5p(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);