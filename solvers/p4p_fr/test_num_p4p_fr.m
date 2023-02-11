rng(23);
N = 10000;

stats = struct('problem','p4p_fr','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_p4p_fr(); % generate initial data

    try
        C = coefs_p4p_fr(data); % compute coefficients of polynomial system
        tic;
        %S = red_42x60_colpiv_p4p_fr(C); % solve polynomial system
        S = std_52x68_colpiv_p4p_fr(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w^2*x,w*x*y,x*y^2,w*x*z,x*y*z,x*z^2,w^2,w*x,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,16); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);