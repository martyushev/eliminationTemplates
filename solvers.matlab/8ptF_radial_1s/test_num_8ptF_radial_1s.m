rng(23);
N = 10000;
nRoots = 8;
iterRef = 0;

stats = ini_stats('8ptF_radial_1s');
stats.solver = 'red_7x15_8ptF_radial_1s';

for i = 1:N

    tic;
    data = inidata_num_8ptF_radial_1s();
    [C,U,dU] = coefs_8ptF_radial_1s(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);