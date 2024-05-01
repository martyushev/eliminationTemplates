rng(23);
N = 10000;
d = 27;

stats = ini_stats('satellite_triang');

for i = 1:N

    data = inidata_num_satellite_triang();
    [C,U,dU] = coefs_satellite_triang(data);

    tic;
    S = red_74x104_satellite_triang(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);