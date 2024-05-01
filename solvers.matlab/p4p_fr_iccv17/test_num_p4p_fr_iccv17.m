rng(23);
N = 10000;
d = 12;

stats = ini_stats('p4p_fr_iccv17');

for i = 1:N

    data = inidata_num_p4p_fr_iccv17();
    [C,U,dU] = coefs_p4p_fr_iccv17(data);

    tic;
    S = red_28x40_p4p_fr_iccv17(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);