rng(23);
N = 10000;
d = 10;

stats = ini_stats('5p');

for i = 1:N

    data = inidata_num_5p();
    [C,U,dU] = coefs_5p(data);

    tic;
    S = red_10x20_5p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);