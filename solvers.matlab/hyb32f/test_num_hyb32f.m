rng(23);
N = 10000;
d = 28;

stats = ini_stats('hyb32f');

for i = 1:N

    data = inidata_num_hyb32f();
    [C,U,dU] = coefs_hyb32f(data);

    tic;
    S = red_162x221_hyb32f(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);