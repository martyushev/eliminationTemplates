rng(23);
N = 10000;
nRoots = 140;
iterRef = 0;

stats = ini_stats('gen_relpose_scale');
stats.solver = 'red_130x275_gen_relpose_scale';

for i = 1:N

    tic;
    data = inidata_num_gen_relpose_scale();
    [C,U,dU] = coefs_gen_relpose_scale(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);