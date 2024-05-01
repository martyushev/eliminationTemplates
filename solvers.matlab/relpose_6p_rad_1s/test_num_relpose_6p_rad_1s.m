rng(23);
N = 10000;
d = 26;

stats = ini_stats('relpose_6p_rad_1s');

for i = 1:N

    data = inidata_num_relpose_6p_rad_1s();
    [C,U,dU] = coefs_relpose_6p_rad_1s(data);

    tic;
    S = red_14x40_relpose_6p_rad_1s(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);