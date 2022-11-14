rng(23);
N = 10000;

stats = struct('problem','focal6p','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_focal6p(); % generate initial data

    try
        C = coefs_focal6p(data); % compute coefficients of polynomial system
        tic;
        S = red_11x26_focal6p(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(g,u,v) [g^2*u^2,g*u^3,g^2*u*v,g*u^2*v,g^2*v^2,v^2*u*g,v^3*g,u*g^2,u^2*g,u^3,v*g^2,g*u*v,v*u^2,g*v^2,v^2*u,v^3,g^2,g*u,u^2,g*v,v*u,v^2,g,u,v,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,15); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);