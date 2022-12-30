rng(23);
N = 10000;

stats = struct('problem','relpose_6p_rad_1s','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_6p_rad_1s(); % generate initial data

    try
        C = coefs_relpose_6p_rad_1s(data); % compute coefficients of polynomial system
        tic;
        %S = red_14x40_colpiv_relpose_6p_rad_1s(C); % solve polynomial system
        S = nstd_14x40_colpiv_relpose_6p_rad_1s(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3*z^3,x^2*y*z^3,x*y^2*z^3,y^3*z^3,x^3*z^2,x^2*y*z^2,x*y^2*z^2,y^3*z^2,z^3*x^2,z^3*y*x,z^3*y^2,z*x^3,z*y*x^2,z*y^2*x,z*y^3,x^2*z^2,x*y*z^2,y^2*z^2,x*z^3,y*z^3,x^3,x^2*y,x*y^2,y^3,x^2*z,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,26); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);