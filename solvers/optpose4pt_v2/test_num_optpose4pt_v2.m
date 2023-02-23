rng(23);
N = 10000;
d = 28;

stats = struct('problem','optpose4pt_v2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_optpose4pt_v2(); % generate initial data

    try
        C = coefs_optpose4pt_v2(data); % compute coefficients of polynomial system
        tic;
        S = red_105x138_colpiv_optpose4pt_v2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^2,w^2,x*v,x*w,x^2,y*v,y*w,x*y,y^2,z*v,z*w,x*z,y*z,z^2,v,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);