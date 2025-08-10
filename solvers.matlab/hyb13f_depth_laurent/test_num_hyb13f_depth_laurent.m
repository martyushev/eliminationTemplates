rng(23);
N = 10000;
nRoots = 12;
iterRef = 0;

stats = ini_stats('hyb13f_depth_laurent');
stats.solver = 'red_115x134_colpiv_hyb13f_depth_laurent';

for i = 1:N

    tic;
    data = inidata_num_hyb13f_depth_laurent();
    [C,U,dU] = coefs_hyb13f_depth_laurent(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);