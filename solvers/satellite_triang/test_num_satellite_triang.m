rng(23);

N = 10000;

Err_satellite_triang = [];
Tm_satellite_triang = [];

for i = 1:N

    data = inidata_satellite_triang(); % generate initial data of the problem

    try
        tic;
        C = coefs_satellite_triang(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_87x114_colpiv_satellite_triang(C); % solve polynomial system
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
        m = [x^3,x^2*y,y^2*x,y^3,z*x^2,y*z*x,y^2*z,z^2*x,y*z^2,z^3,x^2,y*x,y^2,z*x,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_satellite_triang = [Err_satellite_triang err];
    Tm_satellite_triang = [Tm_satellite_triang tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_satellite_triang.mat'),'Err_satellite_triang');

fprintf('Problem #14. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_satellite_triang),median(Err_satellite_triang));