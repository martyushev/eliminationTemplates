rng(23);
N = 10000;
d = 8;

stats = ini_stats('gp4p_scale');

for i = 1:N

    data = inidata_num_gp4p_scale();
    [C,U,dU] = coefs_gp4p_scale(data);

    tic;
    S = red_40x52_gp4p_scale(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);