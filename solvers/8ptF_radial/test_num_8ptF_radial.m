rng(23);

N = 10000;

Err_8ptF_radial = [];
Tm_8ptF_radial = [];

for i = 1:N

    data = inidata_8ptF_radial(); % generate initial data of the problem

    try
        tic;
        C = coefs_8ptF_radial(data); % compute coefficients of polynomial system
        [xx, yy, zz] = std_8ptF_radial_colpiv(C); % solve polynomial system
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
        m = [x^3*z^2, x^2*z^2*y, x*y^2*z^2, y^3*z^2, z^3*x^2, z^3*y*x, z^3*y^2, z^4*x, z^4*y, z*x^3, z*y*x^2, z*y^2*x, y^3*z, z^2*x^2, x*y*z^2, y^2*z^2, z^3*x, z^3*y, z^4, x^3, x^2*y, y^2*x, y^3, z*x^2, y*z*x, y^2*z, z^2*x, y*z^2, z^3, x^2, y*x, y^2, z*x, y*z, z^2, x, y, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_8ptF_radial = [Err_8ptF_radial err];
    Tm_8ptF_radial = [Tm_8ptF_radial tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_8ptF_radial.mat'),'Err_8ptF_radial');
save(strcat(folder,'\_results\Tm_8ptF_radial.mat'),'Tm_8ptF_radial');

fprintf('Problem #22. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_8ptF_radial),median(Err_8ptF_radial));