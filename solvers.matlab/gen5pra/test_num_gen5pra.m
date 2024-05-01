rng(23);
N = 10000;
d = 44;

stats = ini_stats('gen5pra');

for i = 1:N

    data = inidata_num_gen5pra();
    [C,U,dU] = coefs_gen5pra(data);

    tic;
    S = red_34x79_gen5pra(C,data{5}^2-1);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);