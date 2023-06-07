rng(23);
N = 10000;
d = 10;

stats = struct('problem','pose_35pt','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_pose_35pt(); % generate initial data

    try
        C = coefs_pose_35pt(data); % compute coefficients of polynomial system
        tic;
        S = red_12x26_pose_35pt(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y) [x^6,y^2*x^4,x^2*y^4,y^6,x^5,x^4*y,x^3*y^2,x^2*y^3,y^4*x,y^5,x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3,x^2*y,x*y^2,y^3,x^2,x*y,y^2,x,y,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);