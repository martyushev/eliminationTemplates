rng(23);
N = 10000;

stats = struct('problem','toy_laurent','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_toy_laurent(); % generate initial data

    try
        C = coefs_toy_laurent(data); % compute coefficients of polynomial system
        tic;
        S = red_14x28_toy_laurent(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^2,z*y,x^2/z,x,y,y/z,x/y,1,x/z^2,1/y];
    [maxe,gme,k,kr] = bwe(C,mon,S,14); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);