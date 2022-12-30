rng(23);
N = 10000;

stats = struct('problem','relpose_7p_fr_1s','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_relpose_7p_fr_1s(); % generate initial data

    try
        C = coefs_relpose_7p_fr_1s(data); % compute coefficients of polynomial system
        tic;
        %S = red_34x56_colpiv_relpose_7p_fr_1s(C); % solve polynomial system
        [xx,yy,zz] = std_55x74_colpiv_relpose_7p_fr_1s(C);
        ww = arrayfun(@(j) get_w(C,xx(j),yy(j),zz(j)),1:length(xx));
        S = [ww; xx; yy; zz];
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^3*z^3,x^2*z^3*y,y^2*z^3*x,y^3*z^3,w*x^3*z,w*x^2*z*y,w*x*y^2*z,w*y^3*z,x^3*z^2,y*x^2*z^2,x*z^2*y^2,y^3*z^2,x^2*z^3,x*z^3*y,y^2*z^3,w*x^3,w*x^2*y,w*x*y^2,w*y^3,w*x^2*z,w*x*y*z,x^2*z*y,w*y^2*z,x*z*y^2,y^3*z,x^2*z^2,x*z^2*y,z^2*y^2,x*z^3,z^3*y,x^2*w,y*x*w,y^2*w,y^2*x,y^3,w*x*z,x^2*z,w*y*z,x*z*y,y^2*z,x*z^2,y*z^2,z^3,w*x,w*y,x*y,y^2,w*z,z*x,y*z,z^2,w,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,19); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);