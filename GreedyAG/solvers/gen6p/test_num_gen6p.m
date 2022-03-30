rng(23);

N = 10000;

Err_gen6p = [];
Tm_gen6p = [];

for i = 1:N

    data = inidata_gen6p(); % generate initial data of the problem

    try
        tic;
        C = coefs_gen6p(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_99x163_colpiv_gen6p(C); % solve polynomial system
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
        m = [x^6,y*x^5,x^4*y^2,y^3*x^3,y^4*x^2,y^5*x,y^6,x^5*z,y*x^4*z,x^3*z*y^2,z*y^3*x^2,z*y^4*x,z*y^5,z^2*x^4,z^2*y*x^3,x^2*z^2*y^2,z^2*y^3*x,z^2*y^4,z^3*x^3,z^3*y*x^2,x*z^3*y^2,y^3*z^3,z^4*x^2,z^4*y*x,z^4*y^2,x*z^5,y*z^5,z^6,x^5,y*x^4,y^2*x^3,x^2*y^3,x*y^4,y^5,z*x^4,y*z*x^3,z*x^2*y^2,x*z*y^3,z*y^4,x^3*z^2,z^2*x^2*y,x*y^2*z^2,z^2*y^3,x^2*z^3,y*x*z^3,y^2*z^3,z^4*x,y*z^4,z^5,x^4,x^3*y,x^2*y^2,y^3*x,y^4,z*x^3,z*x^2*y,z*x*y^2,y^3*z,z^2*x^2,z^2*x*y,y^2*z^2,z^3*x,z^3*y,z^4,x^3,y*x^2,x*y^2,y^3,z*x^2,y*z*x,y^2*z,x*z^2,y*z^2,z^3,x^2,y*x,y^2,z*x,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(64,length(M))),'fro');

    Err_gen6p = [Err_gen6p err];
    Tm_gen6p = [Tm_gen6p tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_gen6p.mat'),'Err_gen6p');

fprintf('Problem: gen6p. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_gen6p),median(Err_gen6p));
