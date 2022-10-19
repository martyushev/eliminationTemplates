rng(23);
N = 10000;

stats = struct('problem','optpose2pt_v2','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    [data,M0] = inidata_num_optpose2pt_v2(); % generate initial data

    try
        C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
        tic;
        S = red_99x130_colpiv_optpose2pt_v2(C,M0); % solve polynomial system
        %S = std_139x163_colpiv_optpose2pt_v2(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^2,w*v,w^2,x*v,x*w,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,24); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);