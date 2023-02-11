rng(23);
N = 10000;

stats = struct('problem','p6pf_refract','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_p6pf_refract(); % generate initial data

    try
        C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
        tic;
        %S = red_40x61_colpiv_p6pf_refract(C); % solve polynomial system
        S = std_126x162_colpiv_p6pf_refract(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w*x^2*y*z,w*x*y^2*z,w*x*z^3,w*y*z^3,w*x^2*y,x^3*y,w*x*y^2,x*y^3,w*x*z^2,x^2*z^2,w*y*z^2,x*y*z^2,y^2*z^2,z^4,w*x*z,x^2*z,w*y*z,y^2*z,z^3,w*x,x^2,w*y,x*y,y^2,z^2,z,1];
    [err,k,kr] = numerr(C,mon,S,36); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);