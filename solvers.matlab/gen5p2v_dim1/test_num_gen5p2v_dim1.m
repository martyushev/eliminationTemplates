rng(23);
N = 10000;
d = 16;

stats = ini_stats('gen5p2v_dim1');

for i = 1:N

    data = inidata_num_gen5p2v_dim1();
    [CC,U,dU] = coefs_gen5p2v_dim1(data);
    [TT0,TT1] = red1_6x26_gen5p2v_dim1(CC);

    tic;
    s = randn;
    S = red2_6x26_gen5p2v_dim1(TT0,TT1,s);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    C = CC{1}+CC{2}*s+CC{3}*s^2+CC{4}*s^3+CC{5}*s^4+CC{6}*s^5;
    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);