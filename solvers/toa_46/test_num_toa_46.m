rng(23);
N = 10000;
d = 38;

stats = struct('problem','toa_46','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_toa_46(); % generate initial data

    try
        C = coefs_toa_46(data); % compute coefficients of polynomial system
        tic;
        S = red_427x475_toa_46(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^4,v^3*w,v^2*w^2,v*w^3,w^4,v^3*x,v^2*w*x,v*w^2*x,w^3*x,v^2*x^2,v*w*x^2,w^2*x^2,v*x^3,w*x^3,x^4,v^3*y,v^2*w*y,v*w^2*y,w^3*y,v^2*x*y,v*w*x*y,w^2*x*y,v*x^2*y,w*x^2*y,x^3*y,v^2*y^2,v*w*y^2,w^2*y^2,v*x*y^2,w*x*y^2,x^2*y^2,v*y^3,w*y^3,x*y^3,y^4,v^3,v^2*w,v*w^2,w^3,v^2*x,v*w*x,w^2*x,v*x^2,w*x^2,x^3,v^2*y,v*w*y,w^2*y,v*x*y,w*x*y,x^2*y,v*y^2,w*y^2,x*y^2,y^3,v^2,v*w,w^2,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);