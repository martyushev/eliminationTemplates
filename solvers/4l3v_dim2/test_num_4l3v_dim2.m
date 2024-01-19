rng(23);
N = 10000;
d = 56;

stats = struct('problem','4l3v_dim2','tm',[],'err',[],'k',[],'kr',[],'N',N);

for i = 1:N

    data = inidata_num_4l3v_dim2(); % generate initial data

    try
        C = coefs_4l3v_dim2(data); % compute coefficients of polynomial system
        tic;
        S = red_57x117_4l3v_dim2(C); % solve polynomial system
        stats.tm = [stats.tm toc];
        if isempty(S); continue; end
    catch ME
        continue;
    end

    mon = @(u2,u3,v3,w3) [u3^2*u2^2,v3*u3*u2^2,v3^2*u2^2,w3*u3*u2^2,w3*v3*u2^2,w3^2*u2^2,u3*u2^2,u3^2*u2,v3*u2^2,u2*u3*v3,v3^2*u2,w3*u2^2,u2*u3*w3,w3*v3*u2,w3^2*u2,u2^2,u3*u2,u3^2,u2*v3,u3*v3,v3^2,u2*w3,u3*w3,w3*v3,w3^2,u2,u3,v3,w3,1];
    [err,k,kr] = numerr(C,mon,S,d); % compute numerical error
    stats.err = [stats.err err];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end

disp_stats(stats,1);