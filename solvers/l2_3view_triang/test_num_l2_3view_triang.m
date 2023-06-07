rng(23);
N = 10000;
d = 31;

stats = struct('problem','l2_3view_triang','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_l2_3view_triang(); % generate initial data

    try
        C = coefs_l2_3view_triang(data); % compute coefficients of polynomial system
        tic;
        S = red_190x227_l2_3view_triang(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x1,x2,x3,x4,x5,x6,x7,x8) [x3*x1,x3*x2,x4*x1,x4*x2,x5*x3,x5*x4,x6*x3,x6*x4,x7*x1,x7*x2,x7*x3,x7*x4,x8*x3,x8*x4,x8*x5,x8*x6,x1,x2,x3,x4,x5,x6,x7,x8,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);