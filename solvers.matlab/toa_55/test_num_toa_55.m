rng(23);
N = 10000;
d = 42;

stats = ini_stats('toa_55');

for i = 1:N

    data = inidata_num_toa_55();
    [C,U,dU] = coefs_toa_55(data);

    tic;
    S = red_772x832_toa_55(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);