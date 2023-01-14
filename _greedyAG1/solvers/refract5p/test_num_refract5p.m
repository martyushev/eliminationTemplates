rng(23);

N = 10000;

Err_refract5p = [];
Tm_refract5p = [];

for i = 1:N

    data = inidata_refract5p(); % generate initial data of the problem

    try
        tic;
        C = coefs_refract5p(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_57x73_colpiv_refract5p(C); % solve polynomial system
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
        m = [x^3*z,z*y*x^2,x*y^2*z,y^3*z,z^2*x^2,x*y*z^2,z^2*y^2,z^3*x,y*z^3,z^4,x^3,x^2*y,y^2*x,y^3,x^2*z,z*y^2,x*z^2,z^2*y,z^3,x^2,y*x,y^2,z*x,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(16,length(M))),'fro');

    Err_refract5p = [Err_refract5p err];
    Tm_refract5p = [Tm_refract5p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_refract5p.mat'),'Err_refract5p');

fprintf('Problem: refract5p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_refract5p),median(Err_refract5p));
