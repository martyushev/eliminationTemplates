rng(23);
N = 10000;
d = 16;

stats = ini_stats('wpnp_2x2sym');

for i = 1:N

    data = inidata_num_wpnp_2x2sym();
    [C,U,dU] = coefs_wpnp_2x2sym(data);

    tic;
    S = red_10x20_wpnp_2x2sym(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);