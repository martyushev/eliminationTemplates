rng(23);
N = 10000;
d = 40;

stats = struct('problem','parallel_robot_66','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_parallel_robot_66(); % generate initial data

    try
        C = coefs_parallel_robot_66(data); % compute coefficients of polynomial system
        tic;
        S = red_293x362_parallel_robot_66(C,data{3}(1)); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(a,b,c,u,v,w) [a^2*u^2,b^2*u^2,c^2*u^2,a^2*v^2,b^2*v^2,c^2*v^2,a^2*w^2,b^2*w^2,c^2*w^2,u*a^2,u*b*a,u*b^2,u*c*a,u*c^2,v*a^2,v*b*a,v*b^2,v*c*b,v*c^2,w*a^2,w*b^2,w*c*a,w*c*b,w*c^2,a^2,b*a,b^2,c*a,b*c,c^2,u*b,u*c,u^2,v*a,v*c,v^2,w*a,w*b,w^2,a,b,c,u,v,w,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);