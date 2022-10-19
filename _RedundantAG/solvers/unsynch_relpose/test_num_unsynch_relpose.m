rng(23);
N = 10000;

stats = struct('problem','unsynch_relpose','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_unsynch_relpose(); % generate initial data

    try
        C = coefs_unsynch_relpose(data); % compute coefficients of polynomial system
        tic;
        %S = red_59x79_colpiv_unsynch_relpose(C); % solve polynomial system
        S = nstd_139x155_colpiv_unsynch_relpose(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z^3*w^3,z^3*w^2*x,z^3*w*x^2,z^3*x^3,z^3*w^2*y,z^3*w*x*y,z^3*x^2*y,z^3*w*y^2,z^3*x*y^2,z^3*y^3,z^2*w^3,z^2*w^2*x,z^2*w*x^2,z^2*x^3,z^2*w^2*y,z^2*w*x*y,z^2*x^2*y,z^2*w*y^2,z^2*x*y^2,z^2*y^3,z^3*w^2,z^3*w*x,z^3*x^2,z^3*w*y,z^3*x*y,z^3*y^2,w^3*z,z*w^2*x,z*w*x^2,x^3*z,z*w^2*y,z*w*x*y,z*x^2*y,z*w*y^2,z*x*y^2,y^3*z,z^2*w^2,z^2*w*x,z^2*x^2,z^2*w*y,z^2*x*y,z^2*y^2,z^3*w,z^3*x,z^3*y,w^3,w^2*x,w*x^2,x^3,w^2*y,w*x*y,x^2*y,w*y^2,x*y^2,y^3,z*w^2,z*w*x,z*x^2,z*w*y,z*x*y,z*y^2,z^2*w,z^2*x,z^2*y,z^3,w^2,w*x,x^2,w*y,x*y,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,16); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);