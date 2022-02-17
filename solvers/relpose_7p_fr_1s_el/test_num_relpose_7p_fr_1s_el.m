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
        m = [w^4,w^3*x,w^2*x^2,x^3*w,x^4,w^3*y,w^2*y*x,x^2*w*y,y*x^3,w^2*y^2,w*x*y^2,y^2*x^2,y^3*w,y^3*x,y^4,z*w^3,w^2*x*z,z*w*x^2,z*x^3,z*w^2*y,y*z*w*x,z*y*x^2,w*y^2*z,z*y^2*x,z*y^3,z^2*w^2,x*z^2*w,z^2*x^2,z^2*w*y,x*y*z^2,z^2*y^2,z^3*w,z^3*x,z^3*y,z^4,w^3,w^2*x,x^2*w,x^3,w^2*y,y*w*x,x^2*y,w*y^2,y^2*x,y^3,w^2*z,x*z*w,x^2*z,y*z*w,y*z*x,y^2*z,w*z^2,z^2*x,y*z^2,z^3,w^2,w*x,x^2,w*y,y*x,y^2,z*w,z*x,y*z,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_relpose_7p_fr_1s_el = [Err_relpose_7p_fr_1s_el err];
    Tm_relpose_7p_fr_1s_el = [Tm_relpose_7p_fr_1s_el tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_relpose_7p_fr_1s_el.mat'),'Err_relpose_7p_fr_1s_el');

fprintf('Problem #12. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_relpose_7p_fr_1s_el),median(Err_relpose_7p_fr_1s_el));