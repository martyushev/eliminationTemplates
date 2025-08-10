rng(23);
N = 10000;
nRoots = 24;
iterRef = 0;

stats = ini_stats('tdoa_pose_5pt');
stats.solver = 'red_195x237_tdoa_pose_5pt';

for i = 1:N

    tic;
    data = inidata_num_tdoa_pose_5pt();
    [C,U,dU] = coefs_tdoa_pose_5pt(data);

    S = feval(stats.solver,C);
    if isempty(S); continue; end
    [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef);

    stats.tm = [stats.tm toc];
    stats = update_stats_o(stats,Ir,e);

end

disp_stats(stats,'plotHist',1,'saveHist',1);