rng(23);
N = 10000;

stats = struct('problem','relpose_9lines','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_9lines(); % generate initial data

    try
        C = coefs_relpose_9lines(data); % compute coefficients of polynomial system
        tic;
        S = red_1984x2047_colpiv_relpose_9lines(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x11,x13,x14,x2,x3,x4,x5,x6,x8,x9) [x11^2*x3^2,x11*x3^2*x13,x13^2*x3^2,x14*x3^2*x11,x14*x3^2*x13,x14^2*x3^2,x3^2*x8*x11,x3^2*x8*x13,x14*x3^2*x8,x3^2*x8^2,x11*x3*x2*x9,x13*x3*x2*x9,x14*x3*x2*x9,x3^2*x9*x11,x3^2*x9*x13,x14*x3^2*x9,x6*x9*x11*x3,x6*x9*x13*x3,x6*x9*x14*x3,x3*x8*x2*x9,x3^2*x8*x9,x6*x9*x3*x8,x3*x9^2*x2,x3^2*x9^2,x6*x9^2*x2,x6*x9^2*x3,x6^2*x9^2,x11^2*x3,x13*x11*x3,x13^2*x3,x14*x11*x3,x14*x13*x3,x14^2*x3,x11*x3^2,x13*x3^2,x14*x3^2,x4*x11*x3,x4*x13*x3,x4*x14*x3,x11*x3*x6,x13*x3*x6,x14*x3*x6,x11*x3*x8,x13*x3*x8,x14*x3*x8,x3^2*x8,x4*x3*x8,x8*x6*x3,x8^2*x3,x13*x2*x9,x9*x11*x3,x13*x3*x9,x14*x3*x9,x3*x2*x9,x3^2*x9,x4*x2*x9,x4*x3*x9,x11*x6*x9,x13*x6*x9,x9*x6*x14,x9*x6*x2,x9*x6*x3,x9*x6*x4,x9*x6^2,x9*x8*x3,x9*x8*x6,x9^2*x3,x9^2*x6,x13*x11,x13^2,x14*x13,x2*x11,x2*x13,x2*x14,x3*x11,x3*x13,x3*x14,x4*x11,x4*x13,x4*x14,x4*x3,x4^2,x5*x11,x5*x13,x5*x14,x6*x11,x6*x13,x14*x6,x6*x4,x8*x13,x2*x8,x3*x8,x8*x4,x5*x8,x6*x8,x9*x13,x2*x9,x3*x9,x4*x9,x5*x9,x6*x9,x11,x13,x14,x2,x3,x4,x5,x6,x8,x9,1];
    [err,k,kr] = numerr(C,mon,S,36); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);