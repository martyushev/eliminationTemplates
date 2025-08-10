rng(23);
N = 10000;
nRoots = 18;
iterRef = 0;

stats = ini_stats('stitching');
stats.solver = 'red_6x30_stitching';

for i = 1:N

    tic;
    data = inidata_num_stitching();
    [C,U,dU] = coefs_stitching(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);