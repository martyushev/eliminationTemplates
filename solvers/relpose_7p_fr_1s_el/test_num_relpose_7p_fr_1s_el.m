rng(23);
N = 10000;

stats = struct('problem','relpose_7p_fr_1s_el','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s_el(); % generate initial data

    try
        C = coefs_relpose_7p_fr_1s_el(data); % compute coefficients of polynomial system
        tic;
        %S = red_51x70_relpose_7p_fr_1s_el(C); % solve polynomial system
        S = std_51x70_colpiv_relpose_7p_fr_1s_el(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w^4,w^3*x,w^2*x^2,w*x^3,x^4,w^3*y,w^2*x*y,w*x^2*y,x^3*y,w^2*y^2,w*x*y^2,x^2*y^2,w*y^3,x*y^3,y^4,w^3*z,w^2*x*z,w*x^2*z,x^3*z,w^2*y*z,w*x*y*z,x^2*y*z,w*y^2*z,x*y^2*z,y^3*z,w^2*z^2,w*x*z^2,x^2*z^2,z^2*y*w,z^2*y*x,z^2*y^2,z^3*w,z^3*x,z^3*y,z^4,w^3,w^2*x,w*x^2,x^3,w^2*y,w*x*y,x^2*y,y^2*w,y^2*x,y^3,w^2*z,w*x*z,x^2*z,w*y*z,x*y*z,y^2*z,w*z^2,x*z^2,y*z^2,z^3,w^2,x*w,x^2,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,19); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);