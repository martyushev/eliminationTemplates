rng(23);
N = 10000;
d = 20;

stats = struct('problem','relpose_4pt','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_4pt(); % generate initial data

    try
        C = coefs_relpose_4pt(data); % compute coefficients of polynomial system
        tic;
        S = red_72x108_relpose_4pt(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [w*x^2,v*x*y,w*x*y,v*y^2,v*x*z,w*x*z,v*y*z,w*y*z,v*z^2,w*z^2,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v*z,w*z,x*z,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);