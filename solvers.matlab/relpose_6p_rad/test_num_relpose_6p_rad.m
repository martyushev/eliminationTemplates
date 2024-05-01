rng(23);
N = 10000;
d = 52;

stats = ini_stats('relpose_6p_rad');

for i = 1:N

    data = inidata_num_relpose_6p_rad();
    [C,U,dU] = coefs_relpose_6p_rad(data);

    tic;
    S = red_39x95_relpose_6p_rad(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);