rng(23);
N = 10000;

stats = struct('problem','relpose_7p_r1r2','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_r1r2(); % generate initial data

    try
        C = coefs_relpose_7p_r1r2(data); % compute coefficients of polynomial system
        tic;
        S = red_214x296_relpose_7p_r1r2(C); % solve polynomial system
        %S = std_436x512_colpiv_relpose_7p_r1r2(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^3*y^3,w*z*v^2*y^2,v^2*y^2*x*z,w^2*z^2*v*y,w*z^2*v*y*x,v*y*x^2*z^2,w^3*z^3,w^2*z^3*x,x^2*z^3*w,x^3*z^3,v^3*y^2,v^2*y^2*w,y^2*x*v^2,v^2*y^3,v^2*w*z*y,w^2*v*z*y,v^2*x*z*y,x*w*z*v*y,v*x^2*y*z,v^2*y^2*z,w*z*v*y^2,v*y^2*x*z,z^2*w^2*v,z^2*w^3,z^2*w*v*x,z^2*w^2*x,z^2*x^2*v,z^2*x^2*w,x^3*z^2,z^2*v*y*w,z^2*w^2*y,z^2*v*x*y,w*z^2*x*y,z^2*y*x^2,z^3*w^2,z^3*w*x,z^3*x^2,v^3*y,v^2*y*w,v*y*w^2,v^2*x*y,v*y*w*x,v*y*x^2,v^2*y^2,w*v*y^2,v*y^2*x,v*y^3,w*z*v^2,v*z*w^2,z*w^3,z*x*v^2,w*z*x*v,z*w^2*x,z*v*x^2,z*w*x^2,z*x^3,y*z*v^2,w*y*z*v,z*w^2*y,y*z*x*v,z*w*x*y,z*x^2*y,v*y^2*z,z*y^2*w,z*x*y^2,v*z^2*w,z^2*w^2,z^2*x*v,w*z^2*x,z^2*x^2,v*z^2*y,z^2*w*y,z^2*x*y,z^3*w,z^3*x,v^3,w*v^2,w^2*v,w^3,x*v^2,w*x*v,x*w^2,x^2*v,w*x^2,x^3,y*v^2,w*v*y,w^2*y,v*x*y,x*y*w,y*x^2,y^2*v,w*y^2,x*y^2,y^3,z*v^2,z*w*v,z*w^2,x*z*v,w*x*z,z*x^2,v*y*z,y*z*w,y*z*x,z*y^2,z^2*v,z^2*w,x*z^2,z^2*y,z^3,v^2,w*v,w^2,x*v,w*x,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,z*y,z^2,v,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,64); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);