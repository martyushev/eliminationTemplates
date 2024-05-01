rng(23);
N = 10000;
d = 76;

stats = ini_stats('relpose_7p_r1r2');

for i = 1:N

    data = inidata_num_relpose_7p_r1r2();
    [C,U,dU] = coefs_relpose_7p_r1r2(data);

    tic;
    S = red_204x289_relpose_7p_r1r2(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);