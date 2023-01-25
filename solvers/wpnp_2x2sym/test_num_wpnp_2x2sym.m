rng(23);
N = 1;

stats = struct('problem','wpnp_2x2sym','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_wpnp_2x2sym(); % generate initial data

    try
        C = coefs_wpnp_2x2sym(data); % compute coefficients of polynomial system
        tic;
        S = red_10x20_wpnp_2x2sym(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w1,x1,y1,z1) [w1^2*x1*y1,w1*x1*y1^2,w1^2*x1*z1,w1*x1*y1*z1,w1*x1*z1^2,w1*x1*y1,x1*y1^2,w1*x1*z1,x1*y1*z1,x1*z1^2,x1*y1,x1*z1,w1,y1,z1,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,16); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);