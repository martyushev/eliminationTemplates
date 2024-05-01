rng(23);
N = 10000;
d = 31;

stats = ini_stats('l2_3view_triang');

for i = 1:N

    data = inidata_num_l2_3view_triang();
    [C,U,dU] = coefs_l2_3view_triang(data);

    tic;
    S = red_190x227_l2_3view_triang(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);