rng(23);
N = 10000;
d = 16;

stats = ini_stats('wpnp');

for i = 1:N

    data = inidata_num_wpnp();
    [C,U,dU] = coefs_wpnp(data);

    tic;
    S = red_85x107_wpnp(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);