rng(23);
N = 10000;
d = 15;

stats = struct('problem','focal6p','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_focal6p(); % generate initial data

    try
        C = coefs_focal6p(data); % compute coefficients of polynomial system
        tic;
        S = red_11x26_focal6p(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [z*y^2*x^2,y*x^2*z^2,x^2*z^3,x*y^3,y*z*x^2,z*x*y^2,x^2*z^2,z^2*y*x,z^3*x,x*y^2,y^3,z*x^2,z*y*x,z*y^2,z^2*x,z^2*y,z^3,x*y,y^2,x*z,z*y,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);