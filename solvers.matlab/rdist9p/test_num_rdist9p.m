rng(23);
N = 10000;
d = 24;

stats = ini_stats('rdist9p');

for i = 1:N

    data = inidata_num_rdist9p();
    [C,U,dU] = coefs_rdist9p(data);

    tic;
    S = red_73x97_rdist9p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);