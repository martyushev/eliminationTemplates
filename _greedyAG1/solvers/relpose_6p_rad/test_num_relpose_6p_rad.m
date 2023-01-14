rng(23);

N = 10000;

Err_relpose_6p_rad = [];
Tm_relpose_6p_rad = [];

for i = 1:N

    data = inidata_relpose_6p_rad(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_113x165_colpiv_relpose_6p_rad(C); % solve polynomial system
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
        m = [z^3*w^3,w^2*z^3*x,w*z^3*x^2,x^3*z^3,y*w^2*z^3,x*z^3*y*w,x^2*z^3*y,y^2*w*z^3,x*z^3*y^2,y^3*z^3,z^4*w^2,z^4*x*w,x^2*z^4,z^4*y*w,x*z^4*y,z^4*y^2,z^5*w,x*z^5,z^5*y,z^6,w^3*z^2,x*z^2*w^2,w*z^2*x^2,x^3*z^2,z^2*y*w^2,y*w*z^2*x,y*x^2*z^2,z^2*y^2*w,x*z^2*y^2,z^2*y^3,z^3*w^2,z^3*x*w,z^3*x^2,w*z^3*y,x*z^3*y,z^3*y^2,z^4*w,z^4*x,z^4*y,z^5,z*w^3,x*z*w^2,x^2*z*w,x^3*z,y*w^2*z,z*y*w*x,y*x^2*z,y^2*w*z,z*y^2*x,y^3*z,w^2*z^2,x*w*z^2,x^2*z^2,y*w*z^2,y*x*z^2,y^2*z^2,z^3*w,x*z^3,y*z^3,z^4,w^3,w^2*x,w*x^2,x^3,y*w^2,y*w*x,y*x^2,w*y^2,x*y^2,y^3,z*w^2,x*z*w,z*x^2,y*w*z,y*z*x,z*y^2,w*z^2,z^2*x,z^2*y,z^3,w^2,x*w,x^2,y*w,x*y,y^2,z*w,x*z,y*z,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(52,length(M))),'fro');

    Err_relpose_6p_rad = [Err_relpose_6p_rad err];
    Tm_relpose_6p_rad = [Tm_relpose_6p_rad tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_6p_rad.mat'),'Err_relpose_6p_rad');

fprintf('Problem: relpose_6p_rad. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_6p_rad),median(Err_relpose_6p_rad));
