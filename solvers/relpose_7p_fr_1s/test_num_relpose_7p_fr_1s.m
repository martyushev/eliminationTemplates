rng(23);
N = 10000;
d = 19;

stats = struct('problem','relpose_7p_fr_1s','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s(); % generate initial data

    try
        C = coefs_relpose_7p_fr_1s(data); % compute coefficients of polynomial system
        tic;
        S = red_34x56_colpiv_relpose_7p_fr_1s(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z^3*x^3,z^3*y*x^2,z^3*y^2*x,z^3*y^3,w*x^3*z,w*x^2*y*z,w*x*y^2*z,w*z*y^3,x^3*z^2,x^2*z^2*y,x*z^2*y^2,y^3*z^2,x^2*z^3,x*z^3*y,y^2*z^3,x^3*w,w*x^2*y,w*x*y^2,w*y^3,w*x^2*z,w*x*y*z,z*x^2*y,w*y^2*z,z*x*y^2,y^3*z,z^2*x^2,x*z^2*y,z^2*y^2,x*z^3,y*z^3,w*x^2,w*x*y,w*y^2,x*y^2,y^3,w*x*z,z*x^2,w*y*z,x*y*z,z*y^2,z^2*x,z^2*y,z^3,x*w,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);