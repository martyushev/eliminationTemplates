rng(23);
N = 10000;
d = 20;

stats = ini_stats('r6p');

for i = 1:N

    data = inidata_num_r6p();
    [C,U,dU] = coefs_r6p(data);

    tic;
    S = red_66x92_r6p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);