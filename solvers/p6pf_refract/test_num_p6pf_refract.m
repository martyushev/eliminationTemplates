rng(23);
N = 10000;
d = 18;

stats = struct('problem','p6pf_refract','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_p6pf_refract(); % generate initial data

    try
        C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
        tic;
        S = red_40x61_colpiv_p6pf_refract(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w*x^2*y*z,w*x*y^2*z,w*x*z^3,z^3*y*w,w*x^2*y,x^3*y,w*x*y^2,y^3*x,w*x*z^2,z^2*x^2,z^2*y*w,x*z^2*y,z^2*y^2,z^4,w*x*z,z*x^2,w*y*z,z*y^2,z^3,x*w,x^2,y*w,x*y,y^2,z^2,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);