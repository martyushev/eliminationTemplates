rng(23);
N = 10000;

stats = struct('problem','relpose_6p_rad','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_6p_rad(); % generate initial data

    try
        C = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
        tic;
        %S = red_39x95_colpiv_relpose_6p_rad(C); % solve polynomial system
        %S = nstd_39x95_colpiv_relpose_6p_rad(C);
        S = nstd_53x105_colpiv_relpose_6p_rad(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [z^3*w^3,w^2*z^3*x,w*z^3*x^2,x^3*z^3,y*w^2*z^3,x*z^3*y*w,x^2*z^3*y,y^2*w*z^3,x*z^3*y^2,y^3*z^3,z^4*w^2,w*z^4*x,x^2*z^4,y*w*z^4,x*z^4*y,y^2*z^4,z^5*w,z^5*x,z^5*y,z^6,w^3*z^2,x*z^2*w^2,w*z^2*x^2,x^3*z^2,y*w^2*z^2,y*w*z^2*x,y*x^2*z^2,y^2*w*z^2,x*z^2*y^2,y^3*z^2,z^3*w^2,x*z^3*w,z^3*x^2,y*z^3*w,y*z^3*x,z^3*y^2,z^4*w,x*z^4,y*z^4,z^5,w^3*z,x*z*w^2,x^2*z*w,x^3*z,y*w^2*z,y*w*x*z,y*x^2*z,y^2*w*z,x*y^2*z,y^3*z,z^2*w^2,x*z^2*w,x^2*z^2,y*w*z^2,x*z^2*y,y^2*z^2,z^3*w,z^3*x,z^3*y,z^4,w^3,x*w^2,x^2*w,x^3,y*w^2,y*w*x,y*x^2,y^2*w,x*y^2,y^3,z*w^2,x*z*w,x^2*z,y*w*z,x*y*z,y^2*z,z^2*w,x*z^2,y*z^2,z^3,w^2,x*w,x^2,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,52); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);