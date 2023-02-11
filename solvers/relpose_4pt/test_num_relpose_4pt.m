rng(23);
N = 10000;

stats = struct('problem','relpose_4pt','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_4pt(); % generate initial data

    try
        C = coefs_relpose_4pt(data); % compute coefficients of polynomial system
        tic;
        %S = red_72x108_colpiv_relpose_4pt(C); % solve polynomial system
        S = std_99x119_colpiv_relpose_4pt(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [w*x^2,y*x*v,y*x*w,y^2*v,z*x*v,z*x*w,z*y*v,z*y*w,z^2*v,z^2*w,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v*z,w*z,x*z,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,20); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);