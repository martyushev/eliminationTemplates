rng(23);
N = 10000;
d = 56;

stats = struct('problem','hyb51f','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_hyb51f(); % generate initial data

    try
        C = coefs_hyb51f(data); % compute coefficients of polynomial system
        tic;
        S = red_742x811_colpiv_hyb51f(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a1,a2,a3,a4,a5) [a1^2*a3^2,a2^2*a3^2,a1^2*a4^2,a2^2*a4^2,a1^2*a3*a5,a1*a2*a3*a5,a2^2*a3*a5,a1^2*a4*a5,a1*a2*a4*a5,a2^2*a4*a5,a1^2*a3,a1*a2*a3,a2^2*a3,a1*a3^2,a2*a3^2,a1^2*a4,a1*a2*a4,a2^2*a4,a1*a4^2,a2*a4^2,a1^2*a5,a2^2*a5,a1*a3*a5,a2*a3*a5,a1*a4*a5,a2*a4*a5,a1*a3,a2*a3,a3^2,a1*a4,a2*a4,a4^2,a1*a5,a2*a5,a3*a5,a4*a5,a3,a4,a5];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);