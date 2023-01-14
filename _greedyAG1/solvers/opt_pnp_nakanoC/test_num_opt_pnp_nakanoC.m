rng(23);

N = 10000;

Err_opt_pnp_nakanoC = [];
Tm_opt_pnp_nakanoC = [];

for i = 1:N

    data = inidata_opt_pnp_nakanoC(); % generate initial data of the problem

    try
        tic;
        C = coefs_opt_pnp_nakanoC(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_118x158_opt_pnp_nakanoC(C); % solve polynomial system
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
        m = [x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3*z,y*z*x^2,x*z*y^2,z*y^3,z^2*x^2,y*z^2*x,z^2*y^2,z^3*x,z^3*y,z^4,x^3,y*x^2,x*y^2,y^3,z*x^2,x*y*z,z*y^2,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(40,length(M))),'fro');

    Err_opt_pnp_nakanoC = [Err_opt_pnp_nakanoC err];
    Tm_opt_pnp_nakanoC = [Tm_opt_pnp_nakanoC tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_opt_pnp_nakanoC.mat'),'Err_opt_pnp_nakanoC');

fprintf('Problem: opt_pnp_nakanoC. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_opt_pnp_nakanoC),median(Err_opt_pnp_nakanoC));
