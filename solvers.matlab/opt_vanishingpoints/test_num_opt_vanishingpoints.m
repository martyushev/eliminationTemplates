rng(23);
N = 10000;
d = 40;

stats = ini_stats('opt_vanishingpoints');

for i = 1:N

    data = inidata_num_opt_vanishingpoints();
    [C,U,dU] = coefs_opt_vanishingpoints(data);

    tic;
    S = red_136x194_opt_vanishingpoints(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);