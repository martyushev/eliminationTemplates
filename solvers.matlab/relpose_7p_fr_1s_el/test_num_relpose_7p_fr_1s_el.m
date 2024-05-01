rng(23);
N = 10000;
d = 19;

stats = ini_stats('relpose_7p_fr_1s_el');

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s_el();
    [C,U,dU] = coefs_relpose_7p_fr_1s_el(data);

    tic;
    S = red_51x70_relpose_7p_fr_1s_el(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);