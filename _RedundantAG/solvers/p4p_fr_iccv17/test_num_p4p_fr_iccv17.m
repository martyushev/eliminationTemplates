rng(23);
N = 10000;

stats = struct('problem','p4p_fr_iccv17','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_p4p_fr_iccv17(); % generate initial data

    try
        C = coefs_p4p_fr_iccv17(data); % compute coefficients of polynomial system
        tic;
        S = red_28x40_colpiv_p4p_fr_iccv17(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^3*w,x^2*w*y,x*y^2*w,y^3*w,x^2*w*z,x*y*w*z,y^2*w*z,x*z^2*w,y*z^2*w,z^3*w,w*x^2,x^3,x*w*y,x^2*y,y^2*w,x*y^2,y^3,z*x*w,x^2*z,z*y*w,x*y*z,z*y^2,z^2*w,z^2*x,z^2*y,z^3,w*x,x^2,w*y,y*x,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,12); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);