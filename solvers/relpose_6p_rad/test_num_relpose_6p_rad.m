rng(23);
N = 10000;
d = 52;

stats = struct('problem','relpose_6p_rad','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_6p_rad(); % generate initial data

    try
        C = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
        tic;
        S = red_39x95_relpose_6p_rad(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z^3*w^3,z^3*w^2*x,z^3*w*x^2,z^3*x^3,y*w^2*z^3,y*w*z^3*x,z^3*x^2*y,y^2*w*z^3,z^3*x*y^2,z^3*y^3,z^4*w^2,z^4*w*x,z^4*x^2,y*w*z^4,z^4*x*y,z^4*y^2,z^5*w,z^5*x,z^5*y,z^6,z^2*w^3,x*z^2*w^2,z^2*w*x^2,z^2*x^3,y*z^2*w^2,y*z^2*w*x,y*z^2*x^2,y^2*w*z^2,z^2*x*y^2,z^2*y^3,z^3*w^2,x*z^3*w,z^3*x^2,y*z^3*w,y*z^3*x,z^3*y^2,z^4*w,x*z^4,y*z^4,z^5,z*w^3,w^2*x*z,w*x^2*z,z*x^3,y*w^2*z,y*w*z*x,y*z*x^2,y^2*w*z,x*z*y^2,z*y^3,z^2*w^2,z^2*w*x,z^2*x^2,y*w*z^2,z^2*x*y,z^2*y^2,z^3*w,z^3*x,z^3*y,z^4,w^3,w^2*x,w*x^2,x^3,y*w^2,y*w*x,y*x^2,y^2*w,x*y^2,y^3,z*w^2,w*z*x,z*x^2,y*w*z,x*z*y,z*y^2,z^2*w,z^2*x,z^2*y,z^3,w^2,w*x,x^2,y*w,x*y,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);