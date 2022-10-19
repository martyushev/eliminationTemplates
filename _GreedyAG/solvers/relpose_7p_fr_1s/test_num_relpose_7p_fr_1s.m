rng(23);

N = 10000;

Err_relpose_7p_fr_1s = [];
Tm_relpose_7p_fr_1s = [];

for i = 1:N

    data = inidata_relpose_7p_fr_1s(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_7p_fr_1s(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_55x74_colpiv_relpose_7p_fr_1s(C); % solve polynomial system
        ww = arrayfun(@(j) get_w(C,xx(j),yy(j),zz(j)), 1:length(xx));
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
        m = [x^3*z^3,x^2*z^3*y,y^2*z^3*x,y^3*z^3,w*x^3*z,w*x^2*z*y,w*x*y^2*z,w*y^3*z,z^2*x^3,y*x^2*z^2,x*z^2*y^2,y^3*z^2,x^2*z^3,x*z^3*y,y^2*z^3,w*x^3,w*x^2*y,w*x*y^2,w*y^3,w*x^2*z,w*x*y*z,x^2*z*y,w*y^2*z,x*z*y^2,y^3*z,x^2*z^2,x*z^2*y,y^2*z^2,z^3*x,z^3*y,x^2*w,y*x*w,y^2*w,y^2*x,y^3,w*x*z,x^2*z,w*y*z,x*z*y,y^2*z,x*z^2,y*z^2,z^3,w*x,w*y,x*y,y^2,w*z,x*z,y*z,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(19,length(M))),'fro');

    Err_relpose_7p_fr_1s = [Err_relpose_7p_fr_1s err];
    Tm_relpose_7p_fr_1s = [Tm_relpose_7p_fr_1s tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fr_1s.mat'),'Err_relpose_7p_fr_1s');

fprintf('Problem: relpose_7p_fr_1s. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fr_1s),median(Err_relpose_7p_fr_1s));
