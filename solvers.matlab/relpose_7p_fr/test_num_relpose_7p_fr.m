rng(23);
N = 10000;
d = 68;

stats = ini_stats('relpose_7p_fr');

for i = 1:N

    data = inidata_num_relpose_7p_fr();
    [C,U,dU] = coefs_relpose_7p_fr(data);

    tic;
    S = red_138x210_relpose_7p_fr(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);