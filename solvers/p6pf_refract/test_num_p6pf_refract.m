rng(23);
N = 10000;

stats = struct('problem','p6pf_refract','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_p6pf_refract(); % generate initial data

    try
        C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
        tic;
        S = red_49x85_colpiv_p6pf_refract(C); % solve polynomial system
        %S = std_126x162_colpiv_p6pf_refract(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z*y*x^2*w,z*y^2*x*w,z^3*x*w,z^3*y*w,y*x^2*w,y*x^3,y^2*x*w,y^3*x,z^2*x*w,z^2*x^2,z^2*y*w,z^2*y*x,z^2*y^2,z^4,z*x*w,z*x^2,z*y*w,z*y^2,z^3,w*x,x^2,w*y,y*x,y^2,z^2,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,36); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);