rng(23);
N = 10000;
d = 66;

stats = ini_stats('IOD');

for i = 1:N

    data = inidata_num_IOD();
    [C,U,dU] = coefs_IOD(data);

    tic;
    S = red_481x561_IOD(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);