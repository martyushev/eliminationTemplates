rng(23);
N = 10000;
d = 44;

stats = struct('problem','gen5pra','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_gen5pra(); % generate initial data

    try
        C = coefs_gen5pra(data); % compute coefficients of polynomial system
        tic;
        S = red_34x79_colpiv_gen5pra(C,data{5}^2-1); % solve polynomial system
        %S = std_37x81_colpiv_gen5pra(C);
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u,v,w) [u^6,u^5*v,u^4*v^2,u^3*v^3,u^2*v^4,v^5*u,v^6,u^5*w,u^4*v*w,u^3*v^2*w,u^2*v^3*w,w*v^4*u,w*v^5,u^4*w^2,u^3*w^2*v,u^2*v^2*w^2,w^2*v^3*u,w^2*v^4,u^3*w^3,u^2*w^3*v,v^2*w^3*u,v^3*w^3,u^2*w^4,w^4*u*v,v^2*w^4,w^5*u,w^5*v,w^6,u^5,v*u^4,u^3*v^2,u^2*v^3,v^4*u,v^5,u^4*w,v*u^3*w,u^2*v^2*w,v^3*u*w,v^4*w,u^3*w^2,v*u^2*w^2,w^2*u*v^2,v^3*w^2,w^3*u^2,v*w^3*u,w^3*v^2,u*w^4,v*w^4,w^5,u^4,u^3*v,u^2*v^2,v^3*u,v^4,u^3*w,u^2*v*w,v^2*u*w,v^3*w,u^2*w^2,w^2*u*v,v^2*w^2,w^3*u,w^3*v,w^4,u^3,v*u^2,u*v^2,v^3,u^2*w,v*u*w,v^2*w,u*w^2,v*w^2,w^3,u^2,u*v,v^2,u*w,v*w,w^2,u,v,w,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);