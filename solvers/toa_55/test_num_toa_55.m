rng(23);
N = 10000;
d = 42;

stats = struct('problem','toa_55','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_toa_55(); % generate initial data

    try
        C = coefs_toa_55(data); % compute coefficients of polynomial system
        tic;
        S = red_772x832_toa_55(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w,x,y,z) [u^4,u^3*v,u^2*v^2,u*v^3,v^4,u^3*w,u^2*v*w,u*v^2*w,v^3*w,u^2*w^2,u*v*w^2,v^2*w^2,u*w^3,v*w^3,w^4,u^3*x,u^2*v*x,u*v^2*x,v^3*x,u^2*w*x,u*v*w*x,v^2*w*x,u*w^2*x,v*w^2*x,w^3*x,u^2*x^2,u*v*x^2,v^2*x^2,u*w*x^2,v*w*x^2,w^2*x^2,u*x^3,v*x^3,w*x^3,x^4,u^3*y,u^2*v*y,u*v^2*y,v^3*y,u^2*w*y,u*v*w*y,v^2*w*y,u*w^2*y,v*w^2*y,w^3*y,u^2*x*y,u*v*x*y,v^2*x*y,u*w*x*y,v*w*x*y,w^2*x*y,u*x^2*y,v*x^2*y,w*x^2*y,x^3*y,u^2*y^2,u*v*y^2,v^2*y^2,u*w*y^2,v*w*y^2,w^2*y^2,u*x*y^2,v*x*y^2,w*x*y^2,x^2*y^2,u*y^3,v*y^3,w*y^3,x*y^3,y^4,u^3,u^2*v,u*v^2,v^3,u^2*w,u*v*w,v^2*w,u*w^2,v*w^2,w^3,u^2*x,u*v*x,v^2*x,u*w*x,v*w*x,w^2*x,u*x^2,v*x^2,w*x^2,x^3,u^2*y,u*v*y,v^2*y,u*w*y,v*w*y,w^2*y,u*x*y,v*x*y,w*x*y,x^2*y,u*y^2,v*y^2,w*y^2,x*y^2,y^3,u^2,u*v,v^2,u*w,v*w,w^2,u*x,v*x,w*x,x^2,u*y,v*y,w*y,x*y,y^2,u,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);