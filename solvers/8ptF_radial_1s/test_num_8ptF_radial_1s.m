rng(23);

N = 10000;

Err_8ptF_radial_1s = [];
Tm_8ptF_radial_1s = [];

for i = 1:N

    data = inidata_8ptF_radial_1s(); % generate initial data of the problem

    try
        tic;
        C = coefs_8ptF_radial_1s(data); % compute coefficients of polynomial system
        [xx, yy] = nstd_7x15_8ptF_radial_1s(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        m = [y^3*x^3, y^2*x^3, x^2*y^3, x^3*y, x^2*y^2, x*y^3, x^3, x^2*y, y^2*x, y^3, x^2, y*x, y^2, x, y, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_8ptF_radial_1s = [Err_8ptF_radial_1s err];
    Tm_8ptF_radial_1s = [Tm_8ptF_radial_1s tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_8ptF_radial_1s.mat'),'Err_8ptF_radial_1s');
save(strcat(folder,'\_results\Tm_8ptF_radial_1s.mat'),'Tm_8ptF_radial_1s');

fprintf('Problem #1. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_8ptF_radial_1s),median(Err_8ptF_radial_1s));