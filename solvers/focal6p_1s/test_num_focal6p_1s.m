rng(23);
N = 10000;
d = 9;

stats = struct('problem','focal6p_1s','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_focal6p_1s(); % generate initial data

    try
        C = coefs_focal6p_1s(data); % compute coefficients of polynomial system
        tic;
        S = red_11x20_focal6p_1s(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x*y^3,x*y^2*z,x*y*z^2,x*z^3,x*y^2,y^3,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);