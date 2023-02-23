rng(23);
N = 10000;
d = 27;

stats = struct('problem','satellite_triang','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_satellite_triang(); % generate initial data

    try
        C = coefs_satellite_triang(data); % compute coefficients of polynomial system
        tic;
        S = red_74x104_colpiv_satellite_triang(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3,x^2*y,x*y^2,y^3,z*x^2,x*y*z,z*y^2,z^2*x,z^2*y,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);