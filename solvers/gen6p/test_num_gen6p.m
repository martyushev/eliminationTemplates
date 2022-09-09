rng(23);
N = 10000;

stats = struct('problem','gen6p','tm',[],'maxe',[],'gme',[],'k',[],'kr',[]);

for i = 1:N

    data = inidata_num_gen6p(); % generate initial data

    try
        C = coefs_gen6p(data); % compute coefficients of polynomial system
        tic;
        S = red_89x156_colpiv_gen6p(C); % solve polynomial system
        %S = std_99x163_colpiv_gen6p(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(x,y,z) [x^6,y*x^5,y^2*x^4,y^3*x^3,y^4*x^2,y^5*x,y^6,z*x^5,z*y*x^4,z*y^2*x^3,z*y^3*x^2,z*y^4*x,z*y^5,z^2*x^4,z^2*y*x^3,z^2*y^2*x^2,z^2*y^3*x,z^2*y^4,z^3*x^3,z^3*y*x^2,z^3*y^2*x,y^3*z^3,z^4*x^2,z^4*x*y,y^2*z^4,z^5*x,z^5*y,z^6,x^5,x^4*y,x^3*y^2,y^3*x^2,x*y^4,y^5,z*x^4,z*x^3*y,z*x^2*y^2,x*y^3*z,y^4*z,z^2*x^3,z^2*x^2*y,x*y^2*z^2,y^3*z^2,z^3*x^2,x*z^3*y,z^3*y^2,x*z^4,y*z^4,z^5,x^4,x^3*y,x^2*y^2,y^3*x,y^4,z*x^3,z*x^2*y,z*x*y^2,y^3*z,z^2*x^2,z^2*x*y,y^2*z^2,z^3*x,z^3*y,z^4,x^3,y*x^2,x*y^2,y^3,z*x^2,y*z*x,y^2*z,x*z^2,y*z^2,z^3,x^2,y*x,y^2,z*x,y*z,z^2,x,y,z,1];
    [maxe,gme,k,kr] = bwe(C,mon,S,64); % compute backward errors
    stats.maxe = [stats.maxe maxe];
    stats.gme = [stats.gme gme];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'.mat'),'stats');

disp_stats(stats,N);