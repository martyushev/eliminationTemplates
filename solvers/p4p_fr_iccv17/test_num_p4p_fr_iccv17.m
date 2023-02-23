rng(23);
N = 10000;
d = 12;

stats = struct('problem','p4p_fr_iccv17','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_p4p_fr_iccv17(); % generate initial data

    try
        C = coefs_p4p_fr_iccv17(data); % compute coefficients of polynomial system
        tic;
        S = red_28x40_colpiv_p4p_fr_iccv17(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(w,x,y,z) [x^3*w,w*x^2*y,w*x*y^2,w*y^3,w*x^2*z,w*x*y*z,w*y^2*z,w*x*z^2,z^2*y*w,z^3*w,w*x^2,x^3,w*x*y,x^2*y,w*y^2,x*y^2,y^3,w*x*z,z*x^2,w*y*z,x*y*z,z*y^2,w*z^2,z^2*x,z^2*y,z^3,x*w,x^2,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);