rng(23);
N = 10000;
d = 12;

stats = struct('problem','3pra_st0','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_3pra_st0(); % generate initial data

    try
        C = coefs_3pra_st0(data); % compute coefficients of polynomial system
        tic;
        S = red_12x25_colpiv_3pra_st0(C,data{3}^2-1); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w) [u^4,v*u^3,v^2*u^2,v^3*u,v^4,w*u^3,w*v*u^2,w*v^2*u,w*v^3,w^2*u^2,w^2*v*u,w^2*v^2,w^3*u,w^3*v,w^4,u^3,v*u^2,v^2*u,v^3,w*u^2,w*v*u,w*v^2,w^2*u,w^2*v,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);