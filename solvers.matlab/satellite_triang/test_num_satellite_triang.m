rng(23);
N = 10000;
nRoots = 27;
iterRef = 0;

stats = ini_stats('satellite_triang');
stats.solver = 'red_74x104_satellite_triang';

for i = 1:N

    tic;
    data = inidata_num_satellite_triang();
    [C,U,dU] = coefs_satellite_triang(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);