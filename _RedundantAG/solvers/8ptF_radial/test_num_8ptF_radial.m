rng(23);
N = 1;

stats = struct('problem','8ptF_radial','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_8ptF_radial(); % generate initial data

    %try
        C = coefs_8ptF_radial(data); % compute coefficients of polynomial system
        tic;
        S = red_19x39_colpiv_8ptF_radial(C); % solve polynomial system
        %S = std_31x47_colpiv_8ptF_radial(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    %catch ME
    %    continue;
    %end

    mon = @(x,y,z) [z^2*x^3,z^2*y*x^2,z^2*y^2*x,z^2*y^3,z^3*x^2,z^3*y*x,z^3*y^2,z^4*x,z^4*y,z*x^3,z*y*x^2,z*y^2*x,z*y^3,z^2*x^2,z^2*y*x,z^2*y^2,z^3*x,z^3*y,z^4,x^3,y*x^2,y^2*x,y^3,z*x^2,z*y*x,z*y^2,z^2*x,z^2*y,z^3,x^2,y*x,y^2,x*z,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,16); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);