rng(23);
N = 10000;
nRoots = 40;
iterRef = 0;

stats = ini_stats('opt_pnp_nakanoC');
stats.solver = 'red_78x131_opt_pnp_nakanoC';

for i = 1:N

    tic;
    data = inidata_num_opt_pnp_nakanoC();
    [C,U,dU] = coefs_opt_pnp_nakanoC(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);