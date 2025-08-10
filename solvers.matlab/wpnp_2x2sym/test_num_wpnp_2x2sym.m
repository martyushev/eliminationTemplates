rng(23);
N = 10000;
nRoots = 16;
iterRef = 0;

stats = ini_stats('wpnp_2x2sym');
stats.solver = 'red_10x20_wpnp_2x2sym';

for i = 1:N

    tic;
    data = inidata_num_wpnp_2x2sym();
    [C,U,dU] = coefs_wpnp_2x2sym(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);