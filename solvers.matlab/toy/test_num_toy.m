rng(23);
N = 10000;
d = 8;

stats = ini_stats('toy');

for i = 1:N

    data = inidata_num_toy();
    [C,U,dU] = coefs_toy(data);

    tic;
    S = red_14x22_toy(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);