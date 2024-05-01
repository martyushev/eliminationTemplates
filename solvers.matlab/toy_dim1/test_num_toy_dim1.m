rng(23);
N = 10000;
d = 8;

stats = ini_stats('toy_dim1');

for i = 1:N

    data = inidata_num_toy_dim1();
    [CC,U,dU] = coefs_toy_dim1(data);
    [TT0,TT1] = red1_12x20_toy_dim1(CC);

    tic;
    z = randn;
    S = red2_12x20_toy_dim1(TT0,TT1,z);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    C = CC{1}+CC{2}*z+CC{3}*z^2;
    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);