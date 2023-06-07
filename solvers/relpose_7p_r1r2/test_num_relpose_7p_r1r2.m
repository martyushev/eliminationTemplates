rng(23);
N = 10000;
d = 76;

stats = struct('problem','relpose_7p_r1r2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_r1r2(); % generate initial data

    try
        C = coefs_relpose_7p_r1r2(data); % compute coefficients of polynomial system
        tic;
        S = red_204x289_relpose_7p_r1r2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [y^3*v^3,z*w*y^2*v^2,y^2*v^2*z*x,z^2*w^2*y*v,z^2*w*y*v*x,y*v*z^2*x^2,z^3*w^3,z^3*w^2*x,z^3*x^2*w,z^3*x^3,y^2*v^3,w*y^2*v^2,x*y^2*v^2,y^3*v^2,z*w*y*v^2,z*w^2*y*v,y*v^2*z*x,x*z*w*y*v,y*v*z*x^2,y^2*v^2*z,z*w*y^2*v,y^2*v*z*x,z^2*w^2*v,z^2*w^3,x*v*z^2*w,x*z^2*w^2,z^2*x^2*v,z^2*w*x^2,z^2*x^3,z^2*w*y*v,z^2*w^2*y,y*v*z^2*x,y*z^2*w*x,z^2*x^2*y,z^3*w^2,z^3*w*x,z^3*x^2,y*v^3,w*v^2*y,w^2*y*v,x*v^2*y,x*w*y*v,x^2*v*y,y^2*v^2,w*y^2*v,x*y^2*v,y^3*v,z*w*v^2,w^2*v*z,z*w^3,x*v^2*z,x*v*z*w,x*z*w^2,x^2*v*z,w*z*x^2,z*x^3,y*v^2*z,z*w*y*v,y*z*w^2,y*v*z*x,x*y*z*w,y*z*x^2,y^2*z*v,y^2*z*w,y^2*z*x,z^2*w*v,z^2*w^2,v*z^2*x,z^2*w*x,z^2*x^2,y*v*z^2,y*z^2*w,y*z^2*x,z^3*w,z^3*x,v^3,w*v^2,w^2*v,w^3,x*v^2,x*v*w,x*w^2,x^2*v,w*x^2,x^3,y*v^2,w*y*v,y*w^2,x*v*y,x*y*w,y*x^2,y^2*v,w*y^2,x*y^2,y^3,v^2*z,z*w*v,z*w^2,x*v*z,w*z*x,z*x^2,y*v*z,y*z*w,y*z*x,y^2*z,v*z^2,z^2*w,z^2*x,y*z^2,z^3,v^2,w*v,w^2,x*v,w*x,x^2,y*v,y*w,y*x,y^2,v*z,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);