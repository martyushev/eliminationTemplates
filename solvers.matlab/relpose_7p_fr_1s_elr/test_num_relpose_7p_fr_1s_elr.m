rng(23);
N = 10000;
d = 19;

stats = ini_stats('relpose_7p_fr_1s_elr');

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s_elr();
    [C,U,dU] = coefs_relpose_7p_fr_1s_elr(data);

    tic;
    S = red_22x41_relpose_7p_fr_1s_elr(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);