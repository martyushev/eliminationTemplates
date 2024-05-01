rng(23);
N = 10000;
d = 36;

stats = ini_stats('p6pf_refract');

for i = 1:N

    data = inidata_num_p6pf_refract();
    [C,U,dU] = coefs_p6pf_refract(data);

    tic;
    S = red_40x61_p6pf_refract(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);