rng(23);

N = 10000;

Err_wpnp = [];
Tm_wpnp = [];

for i = 1:N

    data = inidata_wpnp(); % generate initial data of the problem

    try
        tic;
        C = coefs_wpnp(data); % compute coefficients of polynomial system
        [w1w1,x1x1,y1y1,z1z1] = nstd_132x148_colpiv_wpnp(C); % solve polynomial system
        tm = toc;
        if isempty(w1w1); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(w1w1)
        w1 = w1w1(j);
        x1 = x1x1(j);
        y1 = y1y1(j);
        z1 = z1z1(j);
        m = [w1^3*x1,w1^2*x1*y1,y1^2*x1*w1,y1^3*x1,w1^2*z1*x1,x1*y1*w1*z1,y1^2*x1*z1,z1^2*x1*w1,z1^2*y1*x1,z1^3*x1,w1^2*x1,y1*x1*w1,y1^2*x1,z1*x1*w1,z1*y1*x1,z1^2*x1,w1*x1,x1*y1,z1*x1,w1,x1,y1,z1,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(16,length(M))),'fro');

    Err_wpnp = [Err_wpnp err];
    Tm_wpnp = [Tm_wpnp tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_wpnp.mat'),'Err_wpnp');

fprintf('Problem: wpnp. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_wpnp),median(Err_wpnp));
