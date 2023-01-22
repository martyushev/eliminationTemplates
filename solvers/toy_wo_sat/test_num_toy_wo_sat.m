rng(23);
N = 10000;

stats = struct('problem','toy_wo_sat','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_toy_wo_sat(); % generate initial data

    try
        C = coefs_toy_wo_sat(data); % compute coefficients of polynomial system
        tic;
        S = red_7x9_colpiv_toy_wo_sat(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^2,x*y,y^2,z*y,z^2,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,1); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);