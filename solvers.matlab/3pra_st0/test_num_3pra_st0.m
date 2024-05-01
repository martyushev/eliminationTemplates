rng(23);
N = 10000;
d = 12;

stats = ini_stats('3pra_st0');

for i = 1:N

    data = inidata_num_3pra_st0();
    [C,U,dU] = coefs_3pra_st0(data);

    tic;
    S = red_12x25_3pra_st0(C,data{3}^2-1);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);