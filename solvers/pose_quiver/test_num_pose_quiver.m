rng(23);
N = 10000;

stats = struct('problem','pose_quiver','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_pose_quiver(); % generate initial data

    try
        C = coefs_pose_quiver(data); % compute coefficients of polynomial system
        tic;
        S = red_56x80_colpiv_pose_quiver(C); % solve polynomial system
        %S = std_65x85_colpiv_pose_quiver(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [w*x^2,y^2*w,z*x*w,z*y*w,w*z^2,w*x,x^2,w*y,x*y,y^2,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,20); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);