rng(23);
N = 1;

stats = struct('problem','satellite_triang','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_satellite_triang(); % generate initial data

    try
        C = coefs_satellite_triang(data); % compute coefficients of polynomial system
        tic;
        S = red_82x110_colpiv_satellite_triang(C); % solve polynomial system
        %S = std_87x114_colpiv_satellite_triang(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3,x^2*y,x*y^2,y^3,x^2*z,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,27); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);