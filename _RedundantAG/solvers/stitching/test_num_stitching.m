rng(23);
N = 10000;

stats = struct('problem','stitching','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_stitching(); % generate initial data

    try
        C = coefs_stitching(data); % compute coefficients of polynomial system
        tic;
        S = red_14x34_colpiv_stitching(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y) [x^6*y^3,x^5*y^3,x^4*y^3,x^4*y^2,x^3*y^3,y^2*x^3,x^2*y^3,x^2*y^2,x*y^3,x^2*y,x*y^2,y^3,x*y,y^2,y,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,18); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);