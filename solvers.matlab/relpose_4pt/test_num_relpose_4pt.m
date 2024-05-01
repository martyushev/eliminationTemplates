rng(23);
N = 10000;
d = 20;

stats = ini_stats('relpose_4pt');

for i = 1:N

    data = inidata_num_relpose_4pt();
    [C,U,dU] = coefs_relpose_4pt(data);

    tic;
    S = red_72x108_relpose_4pt(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);