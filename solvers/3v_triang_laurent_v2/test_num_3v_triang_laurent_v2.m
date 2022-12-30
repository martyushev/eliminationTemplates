rng(23);
N = 10000;

stats = struct('problem','3v_triang_laurent_v2','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_3v_triang_laurent_v2(); % generate initial data

    try
        C = coefs_3v_triang_laurent_v2(data); % compute coefficients of polynomial system
        tic;
        S = red_71x131_colpiv_3v_triang_laurent_v2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x,y,z,1,1/y^3*x^2,1/y^2*x,1/y,1/x,1/x^2*y,1/x^3*y^2,1/y^3*x*z,1/y^2*z,1/x^2*z,1/x^3*y*z,1/y^3*z^2,1/x^3*z^2,1/y^3*x,1/y^2,1/x^2,1/x^3*y,1/y^3*z,1/x^3*z,1/y^3,1/x^3];
    [maxe,gme,k,kr] = bwe(C,mon,S,47); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);