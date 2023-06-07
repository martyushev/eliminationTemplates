rng(23);
N = 10000;
d = 16;

stats = struct('problem','wpnp','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_wpnp(); % generate initial data

    try
        C = coefs_wpnp(data); % compute coefficients of polynomial system
        tic;
        S = red_85x107_wpnp(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w1,x1,y1,z1) [x1*w1^3,x1*y1*w1^2,x1*w1*y1^2,x1*y1^3,x1*z1*w1^2,x1*y1*w1*z1,x1*z1*y1^2,x1*w1*z1^2,x1*y1*z1^2,x1*z1^3,x1*w1^2,x1*w1*y1,x1*y1^2,x1*w1*z1,x1*y1*z1,x1*z1^2,x1*w1,x1*y1,x1*z1,w1,x1,y1,z1,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);