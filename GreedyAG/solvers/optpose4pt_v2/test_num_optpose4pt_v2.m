rng(23);

N = 10000;

Err_optpose4pt_v2 = [];
Tm_optpose4pt_v2 = [];

for i = 1:N

    data = inidata_optpose4pt_v2(); % generate initial data of the problem

    try
        tic;
        C = coefs_optpose4pt_v2(data); % compute coefficients of polynomial system
        [vv,ww,xx,yy,zz] = std_134x162_colpiv_optpose4pt_v2(C); % solve polynomial system
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
        m = [v^2,w^2,v*x,w*x,x^2,v*y,w*y,x*y,y^2,v*z,z*w,x*z,y*z,z^2,v,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(28,length(M))),'fro');

    Err_optpose4pt_v2 = [Err_optpose4pt_v2 err];
    Tm_optpose4pt_v2 = [Tm_optpose4pt_v2 tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_optpose4pt_v2.mat'),'Err_optpose4pt_v2');

fprintf('Problem: optpose4pt_v2. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_optpose4pt_v2),median(Err_optpose4pt_v2));
