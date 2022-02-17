rng(23);

N = 10000;

Err_p4p_fr_iccv17 = [];
Tm_p4p_fr_iccv17 = [];

for i = 1:N

    data = inidata_p4p_fr_iccv17(); % generate initial data of the problem

    try
        tic;
        C = coefs_p4p_fr_iccv17(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_28x40_colpiv_p4p_fr_iccv17(C); % solve polynomial system
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
        m = [x^3*w,x^2*w*y,x*y^2*w,y^3*w,x^2*w*z,x*y*w*z,y^2*w*z,x*z^2*w,y*z^2*w,z^3*w,x^2*w,x^3,x*y*w,x^2*y,y^2*w,x*y^2,y^3,x*z*w,x^2*z,z*y*w,x*y*z,z*y^2,z^2*w,x*z^2,z^2*y,z^3,w*x,x^2,w*y,x*y,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(12,length(M))),'fro');

    Err_p4p_fr_iccv17 = [Err_p4p_fr_iccv17 err];
    Tm_p4p_fr_iccv17 = [Tm_p4p_fr_iccv17 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_p4p_fr_iccv17.mat'),'Err_p4p_fr_iccv17');

fprintf('Problem: p4p_fr_iccv17. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_p4p_fr_iccv17),median(Err_p4p_fr_iccv17));
