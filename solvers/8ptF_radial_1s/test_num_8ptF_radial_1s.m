rng(23);
N = 10000;

stats = struct('problem','8ptF_radial_1s','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_8ptF_radial_1s(); % generate initial data

    try
        C = coefs_8ptF_radial_1s(data); % compute coefficients of polynomial system
        tic;
        %S = red_7x15_8ptF_radial_1s(C); % solve polynomial system
        S = nstd_7x15_8ptF_radial_1s(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y) [y^3*x^3,y^2*x^3,y^3*x^2,y*x^3,y^2*x^2,y^3*x,x^3,y*x^2,y^2*x,y^3,x^2,y*x,y^2,x,y,1];
    [maxe,gme,k,kr] = bwe2(C,mon,S,8); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);