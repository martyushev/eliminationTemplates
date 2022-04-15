rng(23);

N = 10000;

Err_5p = [];
Tm_5p = [];

for i = 1:N

    data = inidata_5p(); % generate initial data of the problem

    try
        tic;
        C = coefs_5p(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_10x20_5p(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [x^3,y*x^2,y^2*x,y^3,z*x^2,z*y*x,z*y^2,z^2*x,z^2*y,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(10,length(M))),'fro');

    Err_5p = [Err_5p err];
    Tm_5p = [Tm_5p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_5p.mat'),'Err_5p');

fprintf('Problem: 5p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_5p),median(Err_5p));
