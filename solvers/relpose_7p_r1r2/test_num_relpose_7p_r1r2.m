rng(23);
N = 10000;
d = 76;

stats = struct('problem','relpose_7p_r1r2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_r1r2(); % generate initial data

    try
        C = coefs_relpose_7p_r1r2(data); % compute coefficients of polynomial system
        tic;
        S = red_214x296_colpiv_relpose_7p_r1r2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [y^3*v^3,z*w*y^2*v^2,y^2*v^2*z*x,v*y*z^2*w^2,v*y*z^2*w*x,v*y*z^2*x^2,z^3*w^3,w^2*x*z^3,w*x^2*z^3,z^3*x^3,y^2*v^3,w*y^2*v^2,v^2*x*y^2,v^2*y^3,v^2*y*w*z,v*y*w^2*z,v^2*x*y*z,v*w*x*y*z,v*x^2*y*z,v^2*y^2*z,v*w*y^2*z,v*x*y^2*z,v*z^2*w^2,w^3*z^2,v*w*x*z^2,w^2*x*z^2,v*x^2*z^2,z^2*w*x^2,x^3*z^2,v*w*y*z^2,w^2*y*z^2,v*x*y*z^2,w*x*y*z^2,x^2*z^2*y,w^2*z^3,w*x*z^3,x^2*z^3,y*v^3,y*w*v^2,y*w^2*v,v^2*x*y,v*w*x*y,v*x^2*y,v^2*y^2,v*w*y^2,v*x*y^2,v*y^3,v^2*w*z,v*z*w^2,w^3*z,v^2*x*z,v*w*x*z,w^2*x*z,v*x^2*z,w*x^2*z,z*x^3,v^2*y*z,v*w*y*z,w^2*y*z,v*x*y*z,w*x*y*z,z*x^2*y,v*y^2*z,w*y^2*z,z*x*y^2,v*w*z^2,z^2*w^2,v*x*z^2,w*x*z^2,z^2*x^2,v*y*z^2,z^2*y*w,x*z^2*y,z^3*w,x*z^3,v^3,v^2*w,v*w^2,w^3,v^2*x,v*w*x,w^2*x,v*x^2,w*x^2,x^3,v^2*y,v*w*y,w^2*y,v*x*y,w*x*y,x^2*y,v*y^2,w*y^2,x*y^2,y^3,v^2*z,v*z*w,w^2*z,v*x*z,w*x*z,z*x^2,v*y*z,w*y*z,x*y*z,z*y^2,v*z^2,w*z^2,z^2*x,z^2*y,z^3,v^2,w*v,w^2,x*v,x*w,x^2,y*v,y*w,x*y,y^2,z*v,z*w,x*z,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);