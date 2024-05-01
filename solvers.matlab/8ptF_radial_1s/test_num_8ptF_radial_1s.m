rng(23);
N = 10000;
d = 8;

stats = ini_stats('8ptF_radial_1s');

for i = 1:N

    data = inidata_num_8ptF_radial_1s();
    [C,U,dU] = coefs_8ptF_radial_1s(data);

    tic;
    S = red_7x15_8ptF_radial_1s(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);