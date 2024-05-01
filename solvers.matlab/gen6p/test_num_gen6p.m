rng(23);
N = 10000;
d = 64;

stats = ini_stats('gen6p');

for i = 1:N

    data = inidata_num_gen6p();
    [C,U,dU] = coefs_gen6p(data);

    tic;
    S = red_78x155_gen6p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);