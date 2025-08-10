rng(23);
N = 10000;
nRoots = 8;
iterRef = 0;

stats = ini_stats('toy');
stats.solver = 'red_14x22_toy';

for i = 1:N

    tic;
    data = inidata_num_toy();
    [C,U,dU] = coefs_toy(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);