rng(23);
N = 10000;
d = 56;

stats = ini_stats('hyb51f');

for i = 1:N

    data = inidata_num_hyb51f();
    [C,U,dU] = coefs_hyb51f(data);

    tic;
    S = red_742x811_hyb51f(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);