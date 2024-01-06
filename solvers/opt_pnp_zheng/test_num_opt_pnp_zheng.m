rng(23);
N = 10000;
d = 40;

stats = struct('problem','opt_pnp_zheng','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_opt_pnp_zheng(); % generate initial data

    try
        C = coefs_opt_pnp_zheng(data); % compute coefficients of polynomial system
        tic;
        S = red_109x161_opt_pnp_zheng(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w1,x1,y1,z1) [w1^3*x1,y1*w1^2*x1,y1^2*w1*x1,y1^3*x1,z1*w1^2*x1,z1*y1*w1*x1,y1^2*z1*x1,z1^2*w1*x1,y1*z1^2*x1,z1^3*x1,w1^2*x1,w1*y1*x1,y1^2*x1,w1*z1*x1,y1*z1*x1,z1^2*x1,w1*x1,y1*x1,z1*x1,w1,x1,y1,z1,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);