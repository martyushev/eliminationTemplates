rng(23);
N = 10000;
d = 6;

stats = ini_stats('4p2v_dim1');

for i = 1:N

    data = inidata_num_4p2v_dim1();
    [CC,U,dU] = coefs_4p2v_dim1(data);
    [TT0,TT1] = red1_3x9_4p2v_dim1(CC);

    tic;
    v = randn;
    S = red2_3x9_4p2v_dim1(TT0,TT1,v);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    C = CC{1}+CC{2}*v+CC{3}*v^2+CC{4}*v^3;
    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);