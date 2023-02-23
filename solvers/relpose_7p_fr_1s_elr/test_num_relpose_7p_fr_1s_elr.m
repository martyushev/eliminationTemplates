rng(23);
N = 10000;
d = 19;

stats = struct('problem','relpose_7p_fr_1s_elr','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s_elr(); % generate initial data

    try
        C = coefs_relpose_7p_fr_1s_elr(data); % compute coefficients of polynomial system
        tic;
        S = red_22x41_colpiv_relpose_7p_fr_1s_elr(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [z^2*y^2*x^2,z^2*y^3*x,z^2*y^4,x^3*y*z,z*x^2*y^2,x*y^3*z,y^4*z,x^2*z^2*y,x*z^2*y^2,y^3*z^2,x^4,x^3*y,x^2*y^2,y^3*x,y^4,z*x^3,z*x^2*y,z*x*y^2,y^3*z,z^2*x^2,x*z^2*y,z^2*y^2,x^3,x^2*y,x*y^2,y^3,z*x^2,x*y*z,z*y^2,z^2*x,z^2*y,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);