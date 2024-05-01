rng(23);
N = 10000;
d = 19;

stats = ini_stats('relpose_7p_fr_1s');

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s();
    [C,U,dU] = coefs_relpose_7p_fr_1s(data);

    tic;
    S = red_34x56_relpose_7p_fr_1s(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);