rng(23);
N = 10000;

stats = struct('problem','wpnp_2x2sym','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_wpnp_2x2sym(); % generate initial data

    try
        C = coefs_wpnp_2x2sym(data); % compute coefficients of polynomial system
        tic;
        S = red_26x42_colpiv_wpnp_2x2sym(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w^2*y,y*x*w,y*x^2,y^2*w,y^2*x,w^2*z,x*w*z,x^2*z,y*z*w,y*z*x,z^2*w,z^2*x,w,x,y,z];
    [maxe,gme,k,kr] = bwe(C,mon,S,32); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);