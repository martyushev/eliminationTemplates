rng(23);
N = 10000;

stats = struct('problem','wpnp_2x2sym','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_wpnp_2x2sym(); % generate initial data

    try
        C = coefs_wpnp_2x2sym(data); % compute coefficients of polynomial system
        tic;
        %S = red_10x20_colpiv_wpnp_2x2sym(C); % solve polynomial system
        S = nstd_18x34_colpiv_wpnp_2x2sym(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w1,x1,y1,z1) [w1^2*x1*y1,w1*x1*y1^2,w1^2*x1*z1,w1*x1*y1*z1,w1*x1*z1^2,w1*x1*y1,x1*y1^2,w1*x1*z1,x1*y1*z1,x1*z1^2,x1*y1,x1*z1,w1,y1,z1,1];
    [err,k,kr] = numerr(C,mon,S,16); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);