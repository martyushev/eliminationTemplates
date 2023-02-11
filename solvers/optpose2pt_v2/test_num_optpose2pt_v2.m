rng(23);
N = 10000;

stats = struct('problem','optpose2pt_v2','tm',[],'err',[],'k',[],'kr',[]);

for i = 1:N

    %[ix,jx,kx] = find(M0);
    %clipboard('copy', ix');clipboard('copy', jx');clipboard('copy', kx');clipboard('copy', size(M0));
    data = inidata_num_optpose2pt_v2(); % generate initial data
    %M0 = getM0_red_87x120_colpiv();
    M0 = getM0_std_139x163_colpiv();

    try
        C = coefs_optpose2pt_v2(data); % compute coefficients of polynomial system
        tic;
        %S = red_87x120_colpiv_optpose2pt_v2(C,M0); % solve polynomial system
        S = std_139x163_colpiv_optpose2pt_v2(C,M0);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(v,w,x,y,z) [v^2,w*v,w^2,x*v,x*w,x^2,v*y,y*w,y*x,y^2,v*z,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,24); % compute backward errors
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);