rng(23);
N = 10000;
d = 18;

stats = struct('problem','stitching','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_stitching(); % generate initial data

    try
        C = coefs_stitching(data); % compute coefficients of polynomial system
        tic;
        S = red_6x30_stitching(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y) [x^6*y^3,y^3*x^5,x^4*y^3,x^4*y^2,x^3*y^3,x^3*y^2,x^2*y^3,x^2*y^2,y^3*x,x^2*y,x*y^2,y^3,x*y,y^2,y,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);