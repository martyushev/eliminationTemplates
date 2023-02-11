rng(23);

N = 10000;

Err_toy = [];
Tm_toy = [];

for i = 1:N

    data = inidata_toy(); % generate initial data of the problem

    try
        tic;
        C = coefs_toy(data); % compute coefficients of polynomial system
        [xx,yy] = std_13x21_colpiv_toy(C); % solve polynomial system
        zz = arrayfun(@(j) get_z(C,xx(j),yy(j)), 1:length(xx));
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
        m = [x^3,y^3,x*z^2,x^2,x*y,y^2,y*z,z^2,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(8,length(M))),'fro');

    Err_toy = [Err_toy err];
    Tm_toy = [Tm_toy tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_toy.mat'),'Err_toy');

fprintf('Problem: toy. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_toy),median(Err_toy));
