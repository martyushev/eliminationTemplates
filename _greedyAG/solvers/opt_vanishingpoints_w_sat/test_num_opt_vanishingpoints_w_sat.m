rng(23);

N = 1;

Err_opt_vanishingpoints_w_sat = [];
Tm_opt_vanishingpoints_w_sat = [];

for i = 1:N

    data = inidata_opt_vanishingpoints_w_sat(); % generate initial data of the problem

    try
        tic;
        C = coefs_opt_vanishingpoints_w_sat(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_343x383_colpiv_opt_vanishingpoints_w_sat(C); % solve polynomial system
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
        m = [x^5,x^4*y,x^3*y^2,x^2*y^3,x*y^4,y^5,x^4*z,x^3*y*z,x^2*y^2*z,x*y^3*z,y^4*z,x^3*z^2,x^2*y*z^2,x*y^2*z^2,y^3*z^2,x^2*z^3,x*y*z^3,y^2*z^3,x*z^4,y*z^4,z^5,x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3*z,x^2*y*z,x*y^2*z,y^3*z,x^2*z^2,x*y*z^2,y^2*z^2,x*z^3,y*z^3,z^4,w*x^2,x^3,x^2*y,w*y^2,x*y^2,y^3,x^2*z,x*y*z,y^2*z,w*z^2,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(40,length(M))),'fro');

    Err_opt_vanishingpoints_w_sat = [Err_opt_vanishingpoints_w_sat err];
    Tm_opt_vanishingpoints_w_sat = [Tm_opt_vanishingpoints_w_sat tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_opt_vanishingpoints_w_sat.mat'),'Err_opt_vanishingpoints_w_sat');

fprintf('Problem: opt_vanishingpoints_w_sat. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_opt_vanishingpoints_w_sat),median(Err_opt_vanishingpoints_w_sat));
