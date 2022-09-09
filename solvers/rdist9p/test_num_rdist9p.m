rng(23);
N = 10000;

stats = struct('problem','rdist9p','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_rdist9p(); % generate initial data

    try
        C = coefs_rdist9p(data); % compute coefficients of polynomial system
        tic;
        S = red_73x97_colpiv_rdist9p(C); % solve polynomial system
        %S = std_76x100_colpiv_rdist9p(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z^2*w^2*x,y*z^2*w^2,y*x*z^2*w,y^2*z^2*w,x*y^2*z^2,y^3*z^2,z*w^2*x,z*w*x^2,y*z*w^2,z*w*x*y,x^2*z*y,z*w*y^2,x*z*y^2,y^3*z,z^2*w^2,x*z^2*w,z^2*w*y,y*x*z^2,y^2*z^2,w^2*x,w*x^2,x^3,y*w^2,w*x*y,y*x^2,y^2*w,x*y^2,y^3,z*w^2,x*z*w,z*x^2,z*w*y,z*x*y,z*y^2,z^2*w,x*z^2,y*z^2,w^2,w*x,x^2,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,24); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);