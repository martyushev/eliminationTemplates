rng(23);
N = 10000;

stats = struct('problem','rollingshutter','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_rollingshutter(); % generate initial data

    try
        C = coefs_rollingshutter(data); % compute coefficients of polynomial system
        tic;
        %S = red_40x52_colpiv_rollingshutter(C); % solve polynomial system
        S = std_47x55_colpiv_rollingshutter(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x1,x2,x3,x4,x5) [x1^2,x1*x2,x2^2,x1*x3,x2*x3,x3^2,x1*x4,x2*x4,x3*x4,x4^2,x1*x5,x2*x5,x3*x5,x4*x5,x5^2,x1,x2,x3,x4,x5,1];
    [err,k,kr] = numerr(C,mon,S,8); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);