rng(23);
N = 10000;
d = 28;

stats = ini_stats('optpose4pt_v2');

for i = 1:N

    data = inidata_num_optpose4pt_v2();
    [C,U,dU] = coefs_optpose4pt_v2(data);

    tic;
    S = red_105x138_optpose4pt_v2(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);