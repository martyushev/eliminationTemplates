rng(23);

N = 10000;

Err_p6pf_refract = [];
Tm_p6pf_refract = [];

for i = 1:N

    data = inidata_p6pf_refract(); % generate initial data of the problem

    try
        tic;
        C = coefs_p6pf_refract(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_126x162_colpiv_p6pf_refract(C); % solve polynomial system
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
        m = [z*y*x^2*w,z*y^2*x*w,z^3*x*w,z^3*y*w,y*x^2*w,y*x^3,y^2*x*w,y^3*x,z^2*x*w,x^2*z^2,z^2*y*w,z^2*y*x,z^2*y^2,z^4,z*x*w,x^2*z,z*y*w,y^2*z,z^3,w*x,x^2,y*w,y*x,y^2,z^2,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(36,length(M))),'fro');

    Err_p6pf_refract = [Err_p6pf_refract err];
    Tm_p6pf_refract = [Tm_p6pf_refract tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_p6pf_refract.mat'),'Err_p6pf_refract');

fprintf('Problem: p6pf_refract. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_p6pf_refract),median(Err_p6pf_refract));
