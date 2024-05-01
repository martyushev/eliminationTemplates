rng(23);
N = 10000;
d = 20;

stats = ini_stats('pose_quiver');

for i = 1:N

    data = inidata_num_pose_quiver();
    [C,U,dU] = coefs_pose_quiver(data);

    tic;
    S = red_38x74_pose_quiver(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);