rng(23);

N = 10000;

Err_relpose_4pt = [];
Tm_relpose_4pt = [];

for i = 1:N

    data = inidata_relpose_4pt(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_4pt(data); % compute coefficients of polynomial system
        [vv,ww,xx,yy,zz] = std_99x119_colpiv_relpose_4pt(C); % solve polynomial system
        tm = toc;
        if isempty(vv); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(vv)
        v = vv(j);
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [w*x^2,y*x*v,y*x*w,y^2*v,z*x*v,w*x*z,y*z*v,y*z*w,z^2*v,z^2*w,x*v,x*w,x^2,y*v,w*y,x*y,y^2,z*v,z*w,x*z,z*y,z^2,v,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(20,length(M))),'fro');

    Err_relpose_4pt = [Err_relpose_4pt err];
    Tm_relpose_4pt = [Tm_relpose_4pt tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_4pt.mat'),'Err_relpose_4pt');

fprintf('Problem: relpose_4pt. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_4pt),median(Err_relpose_4pt));
