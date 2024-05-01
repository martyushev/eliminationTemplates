rng(23);
N = 10000;
d = 20;

stats = ini_stats('4pra');

for i = 1:N

    data = inidata_num_4pra();
    [C,U,dU] = coefs_4pra(data);

    tic;
    S = red_12x36_4pra(C,data{3}^2-1);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);