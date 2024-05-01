rng(29);
N = 10000;
d = 47;

stats = ini_stats('3v_triang_laurent');

for i = 1:N

    data = inidata_num_3v_triang_laurent();
    [C,U,dU] = coefs_3v_triang_laurent(data);
    
    tic;
    S = red_69x127_colpiv_3v_triang_laurent(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,S] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);