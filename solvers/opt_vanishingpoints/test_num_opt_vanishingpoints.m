rng(23);
N = 10000;

stats = struct('problem','opt_vanishingpoints','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_opt_vanishingpoints(); % generate initial data

    try
        C = coefs_opt_vanishingpoints(data); % compute coefficients of polynomial system
        tic;
        S = red_199x255_colpiv_opt_vanishingpoints(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^5,x^4*y,x^3*y^2,x^2*y^3,x*y^4,y^5,x^4*z,x^3*z*y,x^2*z*y^2,x*y^3*z,y^4*z,x^3*z^2,x^2*y*z^2,x*y^2*z^2,y^3*z^2,x^2*z^3,x*y*z^3,y^2*z^3,x*z^4,y*z^4,z^5,w*x^3,x^4,w*x^2*y,x^3*y,w*x*y^2,x^2*y^2,w*y^3,x*y^3,y^4,w*x^2*z,x^3*z,w*x*y*z,x^2*z*y,w*y^2*z,x*z*y^2,y^3*z,w*x*z^2,x^2*z^2,w*y*z^2,x*y*z^2,y^2*z^2,w*z^3,x*z^3,y*z^3,z^4,w*x^2,x^3,w*x*y,x^2*y,w*y^2,x*y^2,y^3,w*x*z,x^2*z,w*y*z,x*y*z,y^2*z,w*z^2,x*z^2,y*z^2,z^3,w*x,x^2,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,40); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);