rng(23);
N = 1000;
d = 66;

stats = struct('problem','IOD','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_IOD(); % generate initial data

    try
        C = coefs_IOD(data); % compute coefficients of polynomial system
        tic;
        S = red_635x717_colpiv_IOD(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x11,x12,x13,x14,x22,x23,x24,x34,x44) [x11^2,x12*x11,x12^2,x13*x12,x13^2,x14*x11,x14*x12,x14*x13,x14^2,x22*x11,x22*x12,x22*x13,x22*x14,x22^2,x23*x11,x23*x12,x23*x13,x23*x14,x23^2,x24*x11,x24*x12,x24*x13,x24*x14,x24*x22,x24*x23,x24^2,x34*x11,x34*x12,x34*x13,x34*x14,x34*x22,x34*x23,x34*x24,x34^2,x44*x11,x44*x12,x44*x13,x44*x22,x44*x23,x11,x12,x13,x14,x22,x23,x24,x34,x44,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);