rng(23);
N = 10000;
d = 27;

stats = ini_stats('opt_pnp_hesch');

for i = 1:N

    data = inidata_num_opt_pnp_hesch();
    [C,U,dU] = coefs_opt_pnp_hesch(data);

    tic;
    S = red_62x97_opt_pnp_hesch(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);