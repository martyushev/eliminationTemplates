rng(23);
N = 10000;
d = 16;

stats = struct('problem','refract5p','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_refract5p(); % generate initial data

    try
        C = coefs_refract5p(data); % compute coefficients of polynomial system
        tic;
        S = red_38x58_refract5p(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3*z,x^2*y*z,x*y^2*z,y^3*z,x^2*z^2,x*y*z^2,y^2*z^2,x*z^3,y*z^3,z^4,x^3,x^2*y,x*y^2,y^3,x^2*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);