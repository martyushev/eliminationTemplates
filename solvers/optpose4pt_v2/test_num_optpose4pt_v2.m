rng(23);
N = 10000;

stats = struct('problem','optpose4pt_v2','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    [data,M0] = inidata_num_optpose4pt_v2(); % generate initial data

    try
        C = coefs_optpose4pt_v2(data); % compute coefficients of polynomial system
        tic;
        S = red_105x138_colpiv_optpose4pt_v2(C,M0); % solve polynomial system
        %S = std_134x162_colpiv_optpose4pt_v2(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^2,w^2,x*v,x*w,x^2,y*v,y*w,x*y,y^2,z*v,z*w,x*z,y*z,z^2,v,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,28); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);