rng(23);
N = 10000;

stats = struct('problem','relpose_7p_fuv_angle','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_fuv_angle(); % generate initial data

    try
        B = coefs_relpose_7p_fuv_angle(data); % compute coefficients of polynomial system
        tic;
        C = sat_relpose_7p_fuv_angle(B); % saturation of 1-dimensional ideal
        %S = red_14x26_relpose_7p_fuv_angle(C); % solve polynomial system
        S = nstd_40x46_colpiv_relpose_7p_fuv_angle(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a,b,p) [a^4,a^3*b,b^2*a^2,a*b^3,b^4,a^3,b*a^2,a*b^2,b^3,a^2*p,a*b*p,b^2*p,a^2,b*a,b^2,p*a,b*p,p^2,a,b,p,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,6); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);