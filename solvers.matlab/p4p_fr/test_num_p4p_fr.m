rng(23);
N = 10000;
d = 16;

stats = ini_stats('p4p_fr');

for i = 1:N

    data = inidata_num_p4p_fr();
    [C,U,dU] = coefs_p4p_fr(data);

    tic;
    S = red_42x60_p4p_fr(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);