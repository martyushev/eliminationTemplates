rng(23);
N = 10000;
d = 24;

stats = struct('problem','rdist9p','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_rdist9p(); % generate initial data

    try
        C = coefs_rdist9p(data); % compute coefficients of polynomial system
        tic;
        S = red_73x97_rdist9p(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x*z^2*w^2,y*z^2*w^2,x*z^2*y*w,z^2*y^2*w,x*z^2*y^2,z^2*y^3,x*z*w^2,z*w*x^2,y*z*w^2,y*z*w*x,z*y*x^2,w*z*y^2,z*y^2*x,z*y^3,z^2*w^2,x*z^2*w,z^2*y*w,x*z^2*y,z^2*y^2,x*w^2,w*x^2,x^3,y*w^2,y*w*x,y*x^2,w*y^2,x*y^2,y^3,z*w^2,z*w*x,z*x^2,w*z*y,z*y*x,z*y^2,z^2*w,x*z^2,z^2*y,w^2,w*x,x^2,w*y,x*y,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);