rng(23);
N = 10000;
d = 38;

stats = ini_stats('toa_46');

for i = 1:N

    data = inidata_num_toa_46();
    [C,U,dU] = coefs_toa_46(data);

    tic;
    S = red_427x475_toa_46(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);