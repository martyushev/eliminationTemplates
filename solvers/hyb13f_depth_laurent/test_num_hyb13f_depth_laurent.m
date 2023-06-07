rng(23);
N = 10000;
d = 12;

stats = struct('problem','hyb13f_depth_laurent','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_hyb13f_depth_laurent(); % generate initial data

    try
        C = coefs_hyb13f_depth_laurent(data); % compute coefficients of polynomial system
        tic;
        S = red_115x134_colpiv_hyb13f_depth_laurent(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a1,a2,a3,a4,b1,f) [a2/a4,a3/a4,a2/a3,1,1/a2*a3,1/a3*a4,1/a2*a4,1/f*a2/a4,1/f*a3/a4,1/f*a2/a3,1/f,1/f/a2*a3,1/f/a3*a4,1/f/a2*a4,a1/a4/b1,a1/a3/b1,a1/a2/b1,1/b1,1/a1*a2/b1,1/a1*a3/b1,1/a1*a4/b1,a2/a3/a4,1/a4,1/a2*a3/a4,1/a3,1/a2,1/a2/a3*a4,1/a1/a4*b1,1/a1/a3*b1,1/a1/a2*b1,a1/a4/b1/f,a1/a3/b1/f,a1/a2/b1/f,1/b1/f,1/a1*a2/b1/f,1/a1*a3/b1/f,1/a1*a4/b1/f,a2/a3/a4/f,1/a4/f,1/a2*a3/a4/f,1/a3/f,1/a2/f,1/a2/a3*a4/f,a1/a3/a4/b1,a1/a2/a4/b1,1/a4/b1,1/a1*a2/a4/b1,1/a1*a3/a4/b1,a1/a2/a3/b1,1/a3/b1,1/a1*a2/a3/b1,1/a2/b1,1/a1/b1,1/a1/a2*a3/b1,1/a1/a3*a4/b1,1/a1/a2*a4/b1,1/a3/a4,1/a2/a4,1/a1/a4,1/a2/a3,1/a1/a3,1/a1/a2,1/a1/a3/a4*b1,1/a1/a2/a4*b1,1/a1/a2/a3*b1,a1/a3/a4/b1/f,a1/a2/a4/b1/f,1/a4/b1/f,1/a1*a2/a4/b1/f,1/a1*a3/a4/b1/f,a1/a2/a3/b1/f,1/a3/b1/f,1/a1*a2/a3/b1/f,1/a2/b1/f,1/a1/b1/f,1/a1/a2*a3/b1/f,1/a1/a3*a4/b1/f,1/a1/a2*a4/b1/f,1/a3/a4/b1,1/a2/a4/b1,1/a1/a4/b1,1/a2/a3/b1,1/a1/a3/b1,1/a1/a2/b1,1/a2/a3/a4,1/a1/a3/a4,1/a1/a2/a4,1/a1/a2/a3,1/a3/a4/b1/f,1/a2/a4/b1/f,1/a1/a4/b1/f,1/a2/a3/b1/f,1/a1/a3/b1/f,1/a1/a2/b1/f,1/a1/a3/a4/b1,1/a1/a2/a4/b1,1/a1/a2/a3/b1,1/a1/a2/a3/a4,1/a1/a2/a3/a4/b1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);