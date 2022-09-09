rng(23);
N = 10000;

stats = struct('problem','relpose_7p_fr','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_fr(); % generate initial data

    try
        C = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        tic;
        S = red_138x210_colpiv_relpose_7p_fr(C); % solve polynomial system
        %S = std_209x277_colpiv_relpose_7p_fr(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v*w^3*z^3,v*w^2*z^3*x,v*w*z^3*x^2,v*x^3*z^3,v*w^2*z^3*y,v*x*z^3*y*w,v*x^2*z^3*y,v*w*z^3*y^2,v*x*z^3*y^2,v*y^3*z^3,v*w^3*z^2,v*x*w^2*z^2,v*w*z^2*x^2,v*x^3*z^2,v*y*w^2*z^2,v*y*w*z^2*x,v*y*x^2*z^2,v*w*z^2*y^2,v*x*z^2*y^2,v*y^3*z^2,v*w^2*z^3,w^3*z^3,v*w*z^3*x,w^2*z^3*x,v*x^2*z^3,w*z^3*x^2,x^3*z^3,v*w*z^3*y,w^2*z^3*y,v*x*z^3*y,x*z^3*y*w,x^2*z^3*y,v*y^2*z^3,w*z^3*y^2,x*z^3*y^2,y^3*z^3,v*w^3*z,x*v^2*w*z,v*w^2*x*z,x^2*v^2*z,x^2*v*w*z,x^3*v*z,v^2*y*w*z,v*y*w^2*z,x*v^2*y*z,x*v*y*w*z,x^2*v*y*z,z*y^2*v^2,v*y^2*w*z,x*v*y^2*z,z*y^3*v,v*w^2*z^2,w^3*z^2,v*w*z^2*x,x*w^2*z^2,v*x^2*z^2,w*z^2*x^2,x^3*z^2,v*w*z^2*y,y*w^2*z^2,v*x*z^2*y,y*w*z^2*x,y*x^2*z^2,z^2*y^2*v,w*z^2*y^2,x*z^2*y^2,z^2*y^3,v*z^3*w,w^2*z^3,v*z^3*x,w*z^3*x,x^2*z^3,z^3*y*v,w*z^3*y,x*z^3*y,z^3*y^2,v*w^3,x*w*v^2,x*w^2*v,x^2*v^2,x^2*w*v,x^3*v,y*w*v^2,y*w^2*v,y*x*v^2,y*x*w*v,y*x^2*v,y^2*v^2,v*y^2*w,x*v*y^2,v*y^3,z*v^2*w,v*w^2*z,w^3*z,x*v^2*z,x*v*w*z,w^2*x*z,x^2*v*z,w*x^2*z,x^3*z,z*v^2*y,v*y*w*z,y*w^2*z,z*y*x*v,y*w*x*z,y*x^2*z,v*y^2*z,y^2*w*z,z*y^2*x,y^3*z,v*w*z^2,w^2*z^2,v*x*z^2,w*z^2*x,x^2*z^2,v*y*z^2,w*z^2*y,x*z^2*y,y^2*z^2,v*z^3,z^3*w,z^3*x,z^3*y,v^2*w,v*w^2,w^3,v^2*x,x*v*w,w^2*x,x^2*v,w*x^2,x^3,v^2*y,v*y*w,y*w^2,x*v*y,y*w*x,y*x^2,y^2*v,y^2*w,x*y^2,y^3,z*v^2,v*w*z,w^2*z,x*v*z,w*x*z,z*x^2,v*y*z,y*w*z,x*y*z,y^2*z,v*z^2,w*z^2,z^2*x,y*z^2,z^3,v^2,v*w,w^2,x*v,w*x,x^2,y*v,y*w,x*y,y^2,v*z,z*w,x*z,y*z,z^2,v,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,68); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);