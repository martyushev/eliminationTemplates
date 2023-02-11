rng(23);
N = 10000;

stats = struct('problem','3v_triang_laurent_w_sat','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    %[ix,jx,kx] = find(M0);
    %clipboard('copy', ix');clipboard('copy', jx');clipboard('copy', kx');clipboard('copy', size(M0));
    data = inidata_num_3v_triang_laurent_w_sat(); % generate initial data
    M0 = getM0_red_401x448_colpiv();

    try
        C = coefs_3v_triang_laurent_w_sat(data); % compute coefficients of polynomial system
        tic;
        S = std_401x448_colpiv_3v_triang_laurent_w_sat(C,M0); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^4*y^2,x^3*y^3,x^2*y^4,x^3*y^2*z,x^2*y^3*z,x^3*y^2,x^2*y^3,x^2*y^2*z,x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3*z,x^2*y*z,x*y^2*z,y^3*z,x^2*z^2,y^2*z^2,x^3,w*x*y,x^2*y,x*y^2,y^3,x^2*z,y^2*z,x^2,y^2,1];
    [err,k,kr] = numerr(C,mon,S,47); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);