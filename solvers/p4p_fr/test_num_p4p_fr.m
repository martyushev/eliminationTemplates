rng(23);
N = 10000;
d = 16;

stats = struct('problem','p4p_fr','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_p4p_fr(); % generate initial data

    try
        C = coefs_p4p_fr(data); % compute coefficients of polynomial system
        tic;
        S = red_42x60_colpiv_p4p_fr(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w^2*x,w*x*y,x*y^2,w*x*z,x*y*z,z^2*x,w^2,x*w,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);