rng(23);
N = 10000;

stats = struct('problem','4pra','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_4pra(); % generate initial data

    try
        C = coefs_4pra(data); % compute coefficients of polynomial system
        tic;
        S = red_12x36_4pra(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w) [u^4,u^3*v,u^2*v^2,v^3*u,v^4,u^3*w,u^2*v*w,w*v^2*u,w*v^3,u^2*w^2,w^2*v*u,v^2*w^2,u*w^3,v*w^3,w^4,u^3,u^2*v,u*v^2,v^3,u^2*w,u*v*w,w*v^2,u*w^2,v*w^2,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,1); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);