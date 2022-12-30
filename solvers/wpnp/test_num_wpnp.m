rng(23);
N = 10000;

stats = struct('problem','wpnp','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_wpnp(); % generate initial data

    try
        C = coefs_wpnp(data); % compute coefficients of polynomial system
        tic;
        %S = red_86x108_colpiv_wpnp(C); % solve polynomial system
        [ww,yy,zz] = std_108x124_colpiv_wpnp(C);
        xx = arrayfun(@(j) get_x(C,ww(j),yy(j),zz(j)),1:length(ww));
        S = [ww; xx; yy; zz];
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w1,x1,y1,z1) [x1*w1^3,x1*y1*w1^2,x1*w1*y1^2,x1*y1^3,x1*z1*w1^2,x1*y1*w1*z1,x1*z1*y1^2,x1*w1*z1^2,x1*y1*z1^2,x1*z1^3,x1*w1^2,y1*x1*w1,y1^2*x1,z1*x1*w1,z1*y1*x1,z1^2*x1,x1*w1,x1*y1,x1*z1,w1,x1,y1,z1,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,16); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);