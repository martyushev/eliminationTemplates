rng(23);

N = 10000;

Err_gen_relpose_scale = [];
Tm_gen_relpose_scale = [];

for i = 1:N

    data = inidata_gen_relpose_scale(); % generate initial data of the problem

    try
        tic;
        C = coefs_gen_relpose_scale(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_144x284_colpiv_gen_relpose_scale(C); % solve polynomial system
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
        m = [x^8,y*x^7,x^6*y^2,x^5*y^3,x^4*y^4,x^3*y^5,x^2*y^6,x*y^7,y^8,z*x^7,y*z*x^6,x^5*z*y^2,x^4*z*y^3,x^3*z*y^4,x^2*z*y^5,x*z*y^6,z*y^7,z^2*x^6,y*z^2*x^5,x^4*z^2*y^2,x^3*z^2*y^3,x^2*z^2*y^4,x*z^2*y^5,z^2*y^6,z^3*x^5,y*z^3*x^4,x^3*z^3*y^2,x^2*z^3*y^3,x*z^3*y^4,z^3*y^5,z^4*x^4,y*z^4*x^3,x^2*z^4*y^2,x*z^4*y^3,z^4*y^4,z^5*x^3,y*z^5*x^2,x*z^5*y^2,z^5*y^3,z^6*x^2,y*z^6*x,z^6*y^2,z^7*x,y*z^7,z^8,x^7,y*x^6,y^2*x^5,x^4*y^3,x^3*y^4,x^2*y^5,x*y^6,y^7,z*x^6,z*y*x^5,x^4*y^2*z,x^3*y^3*z,x^2*y^4*z,x*y^5*z,y^6*z,x^5*z^2,x^4*y*z^2,x^3*y^2*z^2,x^2*y^3*z^2,x*y^4*z^2,y^5*z^2,x^4*z^3,x^3*y*z^3,x^2*y^2*z^3,x*y^3*z^3,y^4*z^3,x^3*z^4,x^2*y*z^4,x*y^2*z^4,y^3*z^4,x^2*z^5,x*y*z^5,y^2*z^5,x*z^6,y*z^6,z^7,x^6,x^5*y,x^4*y^2,x^3*y^3,x^2*y^4,y^5*x,y^6,z*x^5,z*x^4*y,z*x^3*y^2,z*x^2*y^3,z*x*y^4,y^5*z,z^2*x^4,z^2*x^3*y,z^2*x^2*y^2,z^2*x*y^3,y^4*z^2,z^3*x^3,z^3*x^2*y,z^3*x*y^2,y^3*z^3,z^4*x^2,z^4*x*y,y^2*z^4,z^5*x,z^5*y,z^6,x^5,x^4*y,x^3*y^2,y^3*x^2,x*y^4,y^5,z*x^4,z*x^3*y,z*x^2*y^2,x*y^3*z,y^4*z,z^2*x^3,z^2*x^2*y,x*y^2*z^2,y^3*z^2,z^3*x^2,x*z^3*y,z^3*y^2,x*z^4,y*z^4,z^5,x^4,x^3*y,x^2*y^2,y^3*x,y^4,z*x^3,z*x^2*y,z*x*y^2,y^3*z,z^2*x^2,z^2*x*y,y^2*z^2,z^3*x,z^3*y,z^4,x^3,y*x^2,x*y^2,y^3,z*x^2,y*z*x,y^2*z,x*z^2,y*z^2,z^3,x^2,y*x,y^2,z*x,y*z,z^2,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(140,length(M))),'fro');

    Err_gen_relpose_scale = [Err_gen_relpose_scale err];
    Tm_gen_relpose_scale = [Tm_gen_relpose_scale tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_gen_relpose_scale.mat'),'Err_gen_relpose_scale');

fprintf('Problem: gen_relpose_scale. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_gen_relpose_scale),median(Err_gen_relpose_scale));
