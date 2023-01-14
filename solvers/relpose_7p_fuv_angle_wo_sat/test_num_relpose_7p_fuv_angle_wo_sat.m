rng(23);
N = 10000;

stats = struct('problem','relpose_7p_fuv_angle_wo_sat','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_fuv_angle_wo_sat(); % generate initial data

    try
        C = coefs_relpose_7p_fuv_angle_wo_sat(data); % compute coefficients of polynomial system
        tic;
        S = red_26x33_relpose_7p_fuv_angle_wo_sat(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^4,x^3*y,y^2*x^2,x*y^3,y^4,x^3,y*x^2,x*y^2,y^3,x^2*z,x*y*z,y^2*z,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,6); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);