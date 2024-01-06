rng(23);
N = 10000;
d = 20;

stats = struct('problem','pose_quiver','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_pose_quiver(); % generate initial data

    try
        C = coefs_pose_quiver(data); % compute coefficients of polynomial system
        tic;
        S = red_47x76_pose_quiver(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w*x^2,w*y^2,w*x*z,w*y*z,w*z^2,w*x,x^2,w*y,x*y,y^2,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);