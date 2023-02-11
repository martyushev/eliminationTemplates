rng(23);
N = 10000;

stats = struct('problem','r6p','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_r6p(); % generate initial data

    try
        C = coefs_r6p(data); % compute coefficients of polynomial system
        tic;
        %S = red_66x92_colpiv_r6p(C); % solve polynomial system
        S = std_120x140_colpiv_r6p(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w,x,y,z) [x*u,x*v,x*w,y*u,y*v,y*w,u*z,v*z,w*z,u,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,20); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);