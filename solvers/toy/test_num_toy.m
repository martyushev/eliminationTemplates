rng(23);
N = 10000;
d = 8;

stats = struct('problem','toy','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_toy(); % generate initial data

    try
        C = coefs_toy(data); % compute coefficients of polynomial system
        tic;
        S = red_14x22_toy(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3,y^3,z^2*x,x^2,y*x,y^2,y*z,z^2,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);