rng(23);
N = 10000;
d = 16;

stats = ini_stats('unsynch_relpose');

for i = 1:N

    data = inidata_num_unsynch_relpose();
    [C,U,dU] = coefs_unsynch_relpose(data);

    tic;
    S = red_59x79_unsynch_relpose(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);