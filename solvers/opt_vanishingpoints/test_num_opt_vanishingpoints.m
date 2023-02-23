rng(23);
N = 10000;
d = 40;

stats = struct('problem','opt_vanishingpoints','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_opt_vanishingpoints(); % generate initial data

    try
        C = coefs_opt_vanishingpoints(data); % compute coefficients of polynomial system
        tic;
        S = red_136x194_colpiv_opt_vanishingpoints(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^5,x^4*y,x^3*y^2,x^2*y^3,x*y^4,y^5,x^4*z,x^3*y*z,z*x^2*y^2,x*y^3*z,y^4*z,x^3*z^2,x^2*z^2*y,x*z^2*y^2,y^3*z^2,x^2*z^3,x*z^3*y,y^2*z^3,z^4*x,z^4*y,z^5,x^3*w,x^4,w*x^2*y,x^3*y,w*x*y^2,x^2*y^2,w*y^3,y^3*x,y^4,w*x^2*z,z*x^3,w*x*y*z,z*x^2*y,w*y^2*z,z*x*y^2,y^3*z,w*x*z^2,z^2*x^2,z^2*y*w,x*z^2*y,z^2*y^2,z^3*w,x*z^3,y*z^3,z^4,w*x^2,x^3,w*x*y,x^2*y,w*y^2,x*y^2,y^3,w*x*z,z*x^2,w*y*z,x*y*z,z*y^2,w*z^2,z^2*x,z^2*y,z^3,x*w,x^2,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);