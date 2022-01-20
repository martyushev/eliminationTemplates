rng(23);

N = 10000;

Err_stitching = [];
Tm_stitching = [];

for i = 1:N

    data = inidata_stitching(); % generate initial data of the problem

    try
        tic;
        C = coefs_stitching(data); % compute coefficients of polynomial system
        [xx, yy] = nstd_stitching_colpiv_sprs(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        m = [x^6*y^3, x^5*y^3, y^3*x^4, y^2*x^4, y^3*x^3, y^2*x^3, x^2*y^3, x^2*y^2, x*y^3, x^2*y, y^2*x, y^3, y*x, y^2, y, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_stitching = [Err_stitching err];
    Tm_stitching = [Tm_stitching tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_stitching.mat'),'Err_stitching');
save(strcat(folder,'\_results\Tm_stitching.mat'),'Tm_stitching');

fprintf('Problem #5. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_stitching),median(Err_stitching));