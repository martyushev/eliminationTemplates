rng(23);
N = 10000;
d = 48;

stats = ini_stats('optpose3pt_v2');

for i = 1:N

    data = inidata_num_optpose3pt_v2();
    [C,U,dU] = coefs_optpose3pt_v2(data);

    tic;
    S = red_297x356_optpose3pt_v2(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);