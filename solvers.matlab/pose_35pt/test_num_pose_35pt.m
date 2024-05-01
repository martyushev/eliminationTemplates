rng(23);
N = 10000;
d = 10;

stats = ini_stats('pose_35pt');

for i = 1:N

    data = inidata_num_pose_35pt();
    [C,U,dU] = coefs_pose_35pt(data);

    tic;
    S = red_12x26_pose_35pt(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);