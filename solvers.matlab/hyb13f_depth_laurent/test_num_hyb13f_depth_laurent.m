rng(23);
N = 10000;
d = 12;

stats = ini_stats('hyb13f_depth_laurent');

for i = 1:N

    data = inidata_num_hyb13f_depth_laurent();
    [C,U,dU] = coefs_hyb13f_depth_laurent(data);

    tic;
    S = red_115x134_colpiv_hyb13f_depth_laurent(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);