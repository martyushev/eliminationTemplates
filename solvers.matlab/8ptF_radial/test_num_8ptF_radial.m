rng(23);
N = 10000;
nRoots = 16;
iterRef = 0;

stats = ini_stats('8ptF_radial');
stats.solver = 'red_19x39_8ptF_radial';

for i = 1:N

    tic;
    data = inidata_num_8ptF_radial();
    [C,U,dU] = coefs_8ptF_radial(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);