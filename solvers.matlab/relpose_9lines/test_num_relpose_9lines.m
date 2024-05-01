rng(23);
N = 10000;
d = 36;

stats = ini_stats('relpose_9lines');

for i = 1:N

    data = inidata_num_relpose_9lines();
    [C,U,dU] = coefs_relpose_9lines(data);

    tic;
    S = red_1610x1726_relpose_9lines(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);