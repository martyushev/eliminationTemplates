rng(23);
N = 10000;

stats = struct('problem','opt_vanishingpoints_w_sat','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    %[ix,jx,kx] = find(M0);
    %clipboard('copy', ix');clipboard('copy', jx');clipboard('copy', kx');clipboard('copy', size(M0));
    data = inidata_num_opt_vanishingpoints_w_sat(); % generate initial data
    M0 = getM0_red_343x383_colpiv();

    try
        C = coefs_opt_vanishingpoints_w_sat(data); % compute coefficients of polynomial system
        tic;
        S = std_343x383_colpiv_opt_vanishingpoints_w_sat(C,M0); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^5,x^4*y,x^3*y^2,x^2*y^3,x*y^4,y^5,x^4*z,x^3*y*z,x^2*y^2*z,x*y^3*z,y^4*z,x^3*z^2,x^2*y*z^2,x*y^2*z^2,y^3*z^2,x^2*z^3,x*y*z^3,y^2*z^3,x*z^4,y*z^4,z^5,x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3*z,x^2*y*z,x*y^2*z,y^3*z,x^2*z^2,x*y*z^2,y^2*z^2,x*z^3,y*z^3,z^4,w*x^2,x^3,x^2*y,w*y^2,x*y^2,y^3,x^2*z,x*y*z,y^2*z,w*z^2,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,40); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);