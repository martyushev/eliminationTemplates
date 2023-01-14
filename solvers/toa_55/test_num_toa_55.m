rng(23);
N = 10;

stats = struct('problem','toa_55','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_toa_55(); % generate initial data

    try
        C = coefs_toa_55(data); % compute coefficients of polynomial system
        tic;
        S = red_897x945_colpiv_toa_55(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w,x,y,z) [u^4,u^3*v,v^2*u^2,v^3*u,v^4,u^3*w,w*v*u^2,w*v^2*u,v^3*w,w^2*u^2,w^2*v*u,w^2*v^2,w^3*u,w^3*v,w^4,u^3*x,x*v*u^2,x*v^2*u,v^3*x,x*w*u^2,x*w*u*v,x*v^2*w,x*w^2*u,x*v*w^2,w^3*x,x^2*u^2,x^2*v*u,x^2*v^2,x^2*w*u,x^2*v*w,x^2*w^2,x^3*u,x^3*v,x^3*w,x^4,u^3*y,y*v*u^2,y*v^2*u,v^3*y,y*w*u^2,y*v*u*w,y*v^2*w,y*w^2*u,y*v*w^2,w^3*y,y*x*u^2,y*x*u*v,y*v^2*x,x*w*u*y,x*v*w*y,y*x*w^2,y*x^2*u,y*v*x^2,y*x^2*w,x^3*y,y^2*u^2,y^2*v*u,y^2*v^2,y^2*w*u,y^2*v*w,y^2*w^2,y^2*x*u,y^2*v*x,y^2*x*w,y^2*x^2,y^3*u,y^3*v,y^3*w,y^3*x,y^4,u^3,v*u^2,v^2*u,v^3,w*u^2,w*v*u,w*v^2,w^2*u,w^2*v,w^3,x*u^2,x*v*u,x*v^2,x*w*u,x*v*w,x*w^2,x^2*u,x^2*v,x^2*w,x^3,y*u^2,y*v*u,y*v^2,y*w*u,y*v*w,y*w^2,y*x*u,y*v*x,y*x*w,y*x^2,y^2*u,y^2*v,y^2*w,y^2*x,y^3,u^2,v*u,v^2,w*u,w*v,w^2,x*u,x*v,x*w,x^2,y*u,y*v,y*w,y*x,y^2,u,v,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,42); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);