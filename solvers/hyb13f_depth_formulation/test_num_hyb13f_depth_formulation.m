rng(23);
N = 10000;
d = 12;

stats = struct('problem','hyb13f_depth_formulation','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_hyb13f_depth_formulation(); % generate initial data

    try
        C = coefs_hyb13f_depth_formulation(data); % compute coefficients of polynomial system
        tic;
        S = red_168x190_colpiv_hyb13f_depth_formulation(C); % solve polynomial system
        %S = red_293x334_colpiv_hyb13f_depth_formulation(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a1,a2,a3,a4,b1,f) [a1^2*f,a1*a2*f,a2^2*f,a1*a3*f,a2*a3*f,a3^2*f,a1*a4*f,a2*a4*f,a3*a4*f,a4^2*f,b1^2*f,a1^2,a1*a2,a2^2,a1*a3,a2*a3,a3^2,a1*a4,a2*a4,a3*a4,a4^2,b1*f,f];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);