rng(23);
N = 10000;
d = 16;

stats = ini_stats('8ptF_radial');

for i = 1:N

    data = inidata_num_8ptF_radial();
    [C,U,dU] = coefs_8ptF_radial(data);

    tic;
    S = red_19x39_8ptF_radial(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);