rng(23);
N = 10000;

stats = struct('problem','5p','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_5p(); % generate initial data

    try
        C = coefs_5p(data); % compute coefficients of polynomial system
        tic;
        %S = red_10x20_5p(C); % solve polynomial system
        S = std_10x20_5p(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^3,y*x^2,y^2*x,y^3,z*x^2,z*y*x,z*y^2,z^2*x,z^2*y,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,10); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);