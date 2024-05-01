rng(23);
N = 10000;
d = 15;

stats = ini_stats('focal6p');

for i = 1:N

    data = inidata_num_focal6p();
    [C,U,dU] = coefs_focal6p(data);

    tic;
    S = red_11x26_focal6p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);