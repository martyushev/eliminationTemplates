rng(23);
N = 10000;
d = 40;

stats = ini_stats('parallel_robot_66');

for i = 1:N

    data = inidata_num_parallel_robot_66();
    [C,U,dU] = coefs_parallel_robot_66(data);

    tic;
    S = red_293x362_parallel_robot_66(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);