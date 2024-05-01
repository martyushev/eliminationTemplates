rng(23);
N = 10000;
d = 40;

stats = ini_stats('opt_pnp_nakanoC');

for i = 1:N

    data = inidata_num_opt_pnp_nakanoC();
    [C,U,dU] = coefs_opt_pnp_nakanoC(data);

    tic;
    S = red_78x131_opt_pnp_nakanoC(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);