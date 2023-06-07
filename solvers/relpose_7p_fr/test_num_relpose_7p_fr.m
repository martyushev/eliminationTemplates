rng(23);
N = 10000;
d = 68;

stats = struct('problem','relpose_7p_fr','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_fr(); % generate initial data

    try
        C = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        tic;
        S = red_138x210_relpose_7p_fr(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v*z^3*w^3,v*z^3*w^2*x,v*z^3*w*x^2,v*z^3*x^3,v*z^3*w^2*y,v*z^3*w*x*y,v*z^3*x^2*y,v*z^3*w*y^2,v*z^3*x*y^2,v*z^3*y^3,v*z^2*w^3,v*x*z^2*w^2,v*z^2*w*x^2,v*z^2*x^3,v*y*z^2*w^2,v*y*z^2*w*x,v*y*z^2*x^2,v*z^2*w*y^2,v*z^2*x*y^2,v*z^2*y^3,v*z^3*w^2,z^3*w^3,v*z^3*w*x,z^3*w^2*x,v*z^3*x^2,z^3*w*x^2,z^3*x^3,v*z^3*w*y,z^3*w^2*y,v*z^3*x*y,z^3*w*x*y,z^3*x^2*y,v*z^3*y^2,z^3*w*y^2,z^3*x*y^2,z^3*y^3,v*z*w^3,x*v^2*z*w,v*w^2*x*z,x^2*v^2*z,x^2*v*z*w,x^3*v*z,v^2*y*w*z,v*y*w^2*z,x*v^2*y*z,x*v*y*z*w,x^2*v*z*y,v^2*z*y^2,v*y^2*w*z,x*v*y^2*z,v*z*y^3,v*z^2*w^2,z^2*w^3,v*z^2*w*x,x*z^2*w^2,v*z^2*x^2,z^2*w*x^2,z^2*x^3,v*z^2*w*y,y*z^2*w^2,v*z^2*x*y,y*z^2*w*x,y*z^2*x^2,v*z^2*y^2,z^2*w*y^2,z^2*x*y^2,z^2*y^3,v*z^3*w,z^3*w^2,v*z^3*x,z^3*w*x,z^3*x^2,v*z^3*y,z^3*w*y,z^3*x*y,z^3*y^2,v*w^3,x*v^2*w,v*w^2*x,x^2*v^2,x^2*v*w,x^3*v,v^2*y*w,v*y*w^2,x*v^2*y,x*v*y*w,x^2*v*y,y^2*v^2,v*y^2*w,x*v*y^2,v*y^3,v^2*w*z,v*z*w^2,z*w^3,x*v^2*z,x*v*z*w,w^2*x*z,x^2*v*z,w*x^2*z,z*x^3,v^2*y*z,v*y*w*z,y*w^2*z,x*v*y*z,y*w*z*x,y*z*x^2,v*z*y^2,y^2*w*z,x*z*y^2,z*y^3,v*z^2*w,z^2*w^2,v*z^2*x,z^2*w*x,z^2*x^2,v*z^2*y,z^2*w*y,z^2*x*y,z^2*y^2,v*z^3,z^3*w,z^3*x,z^3*y,v^2*w,v*w^2,w^3,x*v^2,x*v*w,w^2*x,x^2*v,w*x^2,x^3,v^2*y,v*y*w,y*w^2,x*v*y,y*w*x,y*x^2,y^2*v,y^2*w,x*y^2,y^3,v^2*z,v*z*w,z*w^2,x*v*z,w*z*x,z*x^2,v*z*y,y*w*z,x*z*y,z*y^2,v*z^2,z^2*w,z^2*x,z^2*y,z^3,v^2,v*w,w^2,x*v,w*x,x^2,y*v,y*w,x*y,y^2,v*z,z*w,z*x,z*y,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);