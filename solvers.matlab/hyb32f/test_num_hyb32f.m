rng(23);
N = 10000;
nRoots = 28;
iterRef = 0;

stats = ini_stats('hyb32f');
stats.solver = 'red_162x221_hyb32f';

for i = 1:N

    tic;
    data = inidata_num_hyb32f();
    [C,U,dU] = coefs_hyb32f(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);