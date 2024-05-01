rng(23);
N = 10000;
d = 140;

stats = ini_stats('gen_relpose_scale');

for i = 1:N

    data = inidata_num_gen_relpose_scale();
    [C,U,dU] = coefs_gen_relpose_scale(data);

    tic;
    S = red_130x275_gen_relpose_scale(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);