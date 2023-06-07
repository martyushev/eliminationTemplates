rng(23);
N = 10000;
d = 26;

stats = struct('problem','relpose_6p_rad_1s','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_6p_rad_1s(); % generate initial data

    try
        C = coefs_relpose_6p_rad_1s(data); % compute coefficients of polynomial system
        tic;
        S = red_14x40_relpose_6p_rad_1s(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [z^3*x^3,z^3*x^2*y,z^3*x*y^2,z^3*y^3,z^2*x^3,z^2*x^2*y,z^2*x*y^2,z^2*y^3,z^3*x^2,z^3*x*y,z^3*y^2,z*x^3,z*x^2*y,z*x*y^2,z*y^3,z^2*x^2,z^2*x*y,z^2*y^2,z^3*x,z^3*y,x^3,y*x^2,x*y^2,y^3,z*x^2,y*z*x,z*y^2,z^2*x,z^2*y,z^3,x^2,y*x,y^2,z*x,z*y,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);