rng(23);
N = 10000;
d = 8;

stats = struct('problem','8ptF_radial_1s','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_8ptF_radial_1s(); % generate initial data

    try
        C = coefs_8ptF_radial_1s(data); % compute coefficients of polynomial system
        tic;
        S = red_7x15_8ptF_radial_1s(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y) [y^3*x^3,y^2*x^3,y^3*x^2,y*x^3,y^2*x^2,y^3*x,x^3,y*x^2,y^2*x,y^3,x^2,y*x,y^2,x,y,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);