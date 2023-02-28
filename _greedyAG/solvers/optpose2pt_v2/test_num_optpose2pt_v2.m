rng(23);
N = 10000;
d = 24;

stats = struct('problem','optpose2pt_v2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_optpose2pt_v2(); % generate initial data

    try
        C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
        tic;
        S = std_139x163_colpiv_optpose2pt_v2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^2,v*w,w^2,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v*z,w*z,x*z,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);