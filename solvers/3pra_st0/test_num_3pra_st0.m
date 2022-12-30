rng(23);
N = 10000;

stats = struct('problem','3pra_st0','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_3pra_st0(); % generate initial data

    try
        C = coefs_3pra_st0(data); % compute coefficients of polynomial system
        tic;
        %S = red_13x25_colpiv_3pra_st0(C); % solve polynomial system
        S = std_13x25_colpiv_3pra_st0(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w) [u^4,u^3*v,u^2*v^2,u*v^3,v^4,u^3*w,u^2*v*w,u*v^2*w,v^3*w,u^2*w^2,u*v*w^2,v^2*w^2,w^3*u,w^3*v,w^4,u^3,u^2*v,v^2*u,v^3,u^2*w,w*v*u,w*v^2,u*w^2,v*w^2,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,12); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);