rng(23);
N = 10000;
d = 20;

stats = struct('problem','r6p','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_r6p(); % generate initial data

    try
        C = coefs_r6p(data); % compute coefficients of polynomial system
        tic;
        S = red_66x92_r6p(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w,x,y,z) [u*x,v*x,w*x,u*y,v*y,w*y,u*z,v*z,w*z,u,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);