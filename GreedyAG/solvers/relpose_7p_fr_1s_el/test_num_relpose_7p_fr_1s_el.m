rng(23);

N = 10000;

Err_relpose_7p_fr_1s_el = [];
Tm_relpose_7p_fr_1s_el = [];

for i = 1:N

    data = inidata_relpose_7p_fr_1s_el(); % generate initial data of the problem

    try
        tic;
        C = coefs_relpose_7p_fr_1s_el(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_51x70_colpiv_relpose_7p_fr_1s_el(C); % solve polynomial system
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
        m = [w^4,w^3*x,w^2*x^2,w*x^3,x^4,w^3*y,w^2*x*y,w*x^2*y,x^3*y,w^2*y^2,w*x*y^2,x^2*y^2,w*y^3,x*y^3,y^4,z*w^3,w^2*x*z,w*x^2*z,x^3*z,z*w^2*y,w*x*y*z,x^2*y*z,w*y^2*z,x*y^2*z,y^3*z,z^2*w^2,w*x*z^2,x^2*z^2,z^2*w*y,x*y*z^2,z^2*y^2,z^3*w,x*z^3,z^3*y,z^4,w^3,w^2*x,w*x^2,x^3,w^2*y,w*x*y,x^2*y,w*y^2,x*y^2,y^3,z*w^2,w*x*z,x^2*z,z*w*y,x*y*z,z*y^2,z^2*w,x*z^2,z^2*y,z^3,w^2,w*x,x^2,w*y,y*x,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(19,length(M))),'fro');

    Err_relpose_7p_fr_1s_el = [Err_relpose_7p_fr_1s_el err];
    Tm_relpose_7p_fr_1s_el = [Tm_relpose_7p_fr_1s_el tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fr_1s_el.mat'),'Err_relpose_7p_fr_1s_el');

fprintf('Problem: relpose_7p_fr_1s_el. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fr_1s_el),median(Err_relpose_7p_fr_1s_el));
