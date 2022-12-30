rng(23);
N = 10000;

stats = struct('problem','gp4p_scale','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_gp4p_scale(); % generate initial data

    try
        C = coefs_gp4p_scale(data); % compute coefficients of polynomial system
        tic;
        %S = red_40x52_colpiv_gp4p_scale(C); % solve polynomial system
        S = std_47x55_colpiv_gp4p_scale(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x1,x2,x3,x4,x5) [x1^2,x2*x1,x2^2,x3*x1,x3*x2,x3^2,x4*x1,x4*x2,x4*x3,x4^2,x5*x1,x5*x2,x5*x3,x4*x5,x5^2,x1,x2,x3,x4,x5,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,8); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);