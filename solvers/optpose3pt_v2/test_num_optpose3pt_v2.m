rng(23);
N = 10000;

stats = struct('problem','optpose3pt_v2','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    %[ix,jx,kx] = find(M0);
    %clipboard('copy', ix');clipboard('copy', jx');clipboard('copy', kx');clipboard('copy', size(M0));
    data = inidata_num_optpose3pt_v2(); % generate initial data
    %M0 = getM0_red_297x356_colpiv();
    M0 = getM0_nstd_385x433_colpiv();

    try
        C = coefs_optpose3pt_v2(data); % compute coefficients of polynomial system
        tic;
        %S = red_297x356_colpiv_optpose3pt_v2(C,M0); % solve polynomial system
        S = nstd_385x433_colpiv_optpose3pt_v2(C,M0);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^3,v^2*w,w^2*v,w^3,v^2*x,v*w*x,w^2*x,v*x^2,w*x^2,x^3,v^2*y,y*w*v,y*w^2,v*y*x,y*w*x,y*x^2,v*y^2,y^2*w,y^2*x,y^3,v^2*z,v*z*w,z*w^2,v*z*x,z*w*x,z*x^2,v*y*z,y*z*w,y*z*x,y^2*z,v*z^2,z^2*w,z^2*x,y*z^2,z^3,v^2,v*w,w^2,x*v,x*w,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,48); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);