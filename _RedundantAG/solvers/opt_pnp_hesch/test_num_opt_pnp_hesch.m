rng(23);
N = 10000;

stats = struct('problem','opt_pnp_hesch','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_opt_pnp_hesch(); % generate initial data

    try
        C = coefs_opt_pnp_hesch(data); % compute coefficients of polynomial system
        tic;
        S = red_62x97_colpiv_opt_pnp_hesch(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3,y*x^2,y^2*x,y^3,x^2*z,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,27); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);