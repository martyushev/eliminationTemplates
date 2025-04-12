rng(23);
N = 10000;
d = 20;

stats = ini_stats('kuramoto_oscillator');

for i = 1:N

    data = inidata_num_kuramoto_oscillator();
    [C,U,dU] = coefs_kuramoto_oscillator(data);

    tic;
    S = red_87x110_kuramoto_oscillator(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);