rng(23);
N = 10000;
d = 26;

stats = struct('problem','hyb32f_w_sat','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_hyb32f_w_sat(); % generate initial data

    try
        C = coefs_hyb32f_w_sat(data); % compute coefficients of polynomial system
        tic;
        S = std_258x284_colpiv_hyb32f_w_sat(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(r1,r2,t3,w) [r1^9*t3,r1^8*r2*t3,r1^7*r2^2*t3,r1^6*r2^3*t3,r1^5*r2^4*t3,r1^4*r2^5*t3,r1^3*r2^6*t3,r1^2*r2^7*t3,r1*r2^8*t3,r2^9*t3,r1^9,r1^8*r2,r1^7*r2^2,r1^6*r2^3,r1^5*r2^4,r1^4*r2^5,r1^3*r2^6,r1^2*r2^7,r1*r2^8,r2^9,r1^8*t3,r1^7*r2*t3,r1^6*r2^2*t3,r1^5*r2^3*t3,r1^4*r2^4*t3,r1^3*r2^5*t3,r1^2*r2^6*t3,r1*r2^7*t3,r2^8*t3,r1^8,r1^7*r2,r1^6*r2^2,r1^5*r2^3,r1^4*r2^4,r1^3*r2^5,r1^2*r2^6,r1*r2^7,r2^8,r1^7*t3,r1^6*r2*t3,r1^5*r2^2*t3,r1^4*r2^3*t3,r1^3*r2^4*t3,r1^2*r2^5*t3,r1*r2^6*t3,r2^7*t3,r1^6*t3^2,r1^4*r2^2*t3^2,r1^2*r2^4*t3^2,r2^6*t3^2,r1^7,r1^6*r2,r1^5*r2^2,r1^4*r2^3,r1^3*r2^4,r1^2*r2^5,r1*r2^6,r2^7,r1^6*t3,r1^5*r2*t3,r1^4*r2^2*t3,r1^3*r2^3*t3,r1^2*r2^4*t3,r1*r2^5*t3,r2^6*t3,r1^5*t3^2,r1^4*r2*t3^2,r1^3*r2^2*t3^2,r1^2*r2^3*t3^2,r1*r2^4*t3^2,r2^5*t3^2,r1^6,r1^5*r2,r1^4*r2^2,r1^3*r2^3,r1^2*r2^4,r1*r2^5,r2^6,r1^5*t3,r1^4*r2*t3,r1^3*r2^2*t3,r1^2*r2^3*t3,r1*r2^4*t3,r2^5*t3,r1^4*t3^2,r1^2*r2^2*t3^2,r2^4*t3^2,r1^5,r1^4*r2,r1^3*r2^2,r1^2*r2^3,r1*r2^4,r2^5,r1^4*t3,r1^3*r2*t3,r1^2*r2^2*t3,r1*r2^3*t3,r2^4*t3,r1^3*t3^2,r1^2*r2*t3^2,r1*r2^2*t3^2,r2^3*t3^2,r1^4,r1^3*r2,r1^2*r2^2,r1*r2^3,r2^4,r1^3*t3,r1^2*r2*t3,r1*r2^2*t3,r2^3*t3,r1^2*t3^2,r2^2*t3^2,r1^3,r1^2*r2,r1*r2^2,r2^3,r1^2*t3,r1*r2*t3,r2^2*t3,r1*t3^2,r2*t3^2,r1^2*w,r2^2*w,r1^2,r1*r2,r2^2,r1*t3,r2*t3,t3^2,r1,r2,t3,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);