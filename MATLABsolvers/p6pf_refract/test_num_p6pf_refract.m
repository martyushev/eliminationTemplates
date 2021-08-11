warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err = [];
Tm = [];

for i = 1:N

    data = inidata_p6pf_refract(); % generate initial data of the problem

    try
        tic;
        C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = std_p6pf_refract_colpiv(C); % solve polynomial system
        tm = toc;
        if isempty(ww); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(ww)
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [y*z*x^2*w, y^2*z*w*x, x*w*z^3, y*w*z^3, x^2*w*y, y*x^3, w*x*y^2, y^3*x, x*z^2*w, z^2*x^2, z^2*y*w, z^2*y*x, y^2*z^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, x*w, x^2, y*w, y*x, y^2, z^2, z, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M','fro');

    Err = [Err err];
    Tm = [Tm tm];

end

Err_p6pf_refract = Err;
Tm_p6pf_refract = Tm;

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_p6pf_refract.mat'),'Err_p6pf_refract');
save(strcat(folder,'\_results\Tm_p6pf_refract.mat'),'Tm_p6pf_refract');

fprintf('Problem: p6pf_refract. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm),median(Err));

warning ('on','all');