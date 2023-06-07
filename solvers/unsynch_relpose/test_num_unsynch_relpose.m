rng(23);
N = 10000;
d = 16;

stats = struct('problem','unsynch_relpose','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_unsynch_relpose(); % generate initial data

    try
        C = coefs_unsynch_relpose(data); % compute coefficients of polynomial system
        tic;
        S = red_59x79_unsynch_relpose(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w^3*z^3,w^2*z^3*x,x^2*z^3*w,x^3*z^3,w^2*z^3*y,w*z^3*x*y,x^2*z^3*y,y^2*z^3*w,y^2*z^3*x,y^3*z^3,w^3*z^2,w^2*z^2*x,x^2*z^2*w,x^3*z^2,w^2*z^2*y,w*z^2*x*y,x^2*z^2*y,y^2*z^2*w,y^2*z^2*x,y^3*z^2,w^2*z^3,w*z^3*x,x^2*z^3,w*z^3*y,x*z^3*y,y^2*z^3,w^3*z,w^2*x*z,w*x^2*z,x^3*z,w^2*y*z,w*x*y*z,x^2*y*z,w*y^2*z,x*y^2*z,y^3*z,w^2*z^2,w*z^2*x,x^2*z^2,w*z^2*y,x*z^2*y,y^2*z^2,w*z^3,x*z^3,y*z^3,w^3,w^2*x,w*x^2,x^3,w^2*y,w*x*y,x^2*y,w*y^2,x*y^2,y^3,w^2*z,w*z*x,x^2*z,w*z*y,x*z*y,y^2*z,w*z^2,x*z^2,y*z^2,z^3,w^2,w*x,x^2,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);