rng(23);

N = 1;

Err_3v_triang_laurent_w_sat = [];
Tm_3v_triang_laurent_w_sat = [];

for i = 1:N

    data = inidata_3v_triang_laurent_w_sat(); % generate initial data of the problem

    try
        tic;
        C = coefs_3v_triang_laurent_w_sat(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_401x448_colpiv_3v_triang_laurent_w_sat(C); % solve polynomial system
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
        m = [x^4*y^2,x^3*y^3,x^2*y^4,x^3*y^2*z,x^2*y^3*z,x^3*y^2,x^2*y^3,x^2*y^2*z,x^4,x^3*y,x^2*y^2,x*y^3,y^4,x^3*z,x^2*y*z,x*y^2*z,y^3*z,x^2*z^2,y^2*z^2,x^3,w*x*y,x^2*y,x*y^2,y^3,x^2*z,y^2*z,x^2,y^2,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(47,length(M))),'fro');

    Err_3v_triang_laurent_w_sat = [Err_3v_triang_laurent_w_sat err];
    Tm_3v_triang_laurent_w_sat = [Tm_3v_triang_laurent_w_sat tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_3v_triang_laurent_w_sat.mat'),'Err_3v_triang_laurent_w_sat');

fprintf('Problem: 3v_triang_laurent_w_sat. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_3v_triang_laurent_w_sat),median(Err_3v_triang_laurent_w_sat));
