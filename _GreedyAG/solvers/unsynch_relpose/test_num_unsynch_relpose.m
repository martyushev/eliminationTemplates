rng(23);

N = 10000;

Err_unsynch_relpose = [];
Tm_unsynch_relpose = [];

for i = 1:N

    data = inidata_unsynch_relpose(); % generate initial data of the problem

    try
        tic;
        C = coefs_unsynch_relpose(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = nstd_139x155_colpiv_unsynch_relpose(C); % solve polynomial system
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
        m = [z^3*w^3,z^3*w^2*x,z^3*w*x^2,z^3*x^3,z^3*w^2*y,z^3*w*x*y,z^3*x^2*y,z^3*w*y^2,z^3*x*y^2,z^3*y^3,z^2*w^3,z^2*w^2*x,z^2*w*x^2,z^2*x^3,z^2*w^2*y,z^2*w*x*y,z^2*x^2*y,z^2*w*y^2,z^2*x*y^2,z^2*y^3,w^2*z^3,w*z^3*x,x^2*z^3,w*z^3*y,x*z^3*y,y^2*z^3,w^3*z,z*w^2*x,z*w*x^2,x^3*z,w^2*y*z,z*w*x*y,z*x^2*y,w*y^2*z,z*x*y^2,y^3*z,w^2*z^2,w*z^2*x,x^2*z^2,w*z^2*y,x*z^2*y,y^2*z^2,w*z^3,x*z^3,y*z^3,w^3,x*w^2,x^2*w,x^3,y*w^2,y*x*w,y*x^2,y^2*w,y^2*x,y^3,z*w^2,z*x*w,z*x^2,z*y*w,z*y*x,z*y^2,z^2*w,z^2*x,z^2*y,z^3,w^2,w*x,x^2,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(16,length(M))),'fro');

    Err_unsynch_relpose = [Err_unsynch_relpose err];
    Tm_unsynch_relpose = [Tm_unsynch_relpose tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_unsynch_relpose.mat'),'Err_unsynch_relpose');

fprintf('Problem: unsynch_relpose. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_unsynch_relpose),median(Err_unsynch_relpose));
