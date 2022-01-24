rng(23);

N = 10000;

Err_l2_3view_triang = [];
Tm_l2_3view_triang = [];

for i = 1:N

    data = inidata_l2_3view_triang(); % generate initial data of the problem

    try
        tic;
        C = coefs_l2_3view_triang(data); % compute coefficients of polynomial system
        [xx1, xx2, xx3, xx4, xx5, xx6, xx7, xx8] = std_217x248_colpiv_l2_3view_triang(C); % solve polynomial system
        tm = toc;
        if isempty(xx1); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx1)
        x1 = xx1(j);
        x2 = xx2(j);
        x3 = xx3(j);
        x4 = xx4(j);
        x5 = xx5(j);
        x6 = xx6(j);
        x7 = xx7(j);
        x8 = xx8(j);
        m = [x1*x3, x2*x3, x4*x1, x4*x2, x3*x5, x4*x5, x3*x6, x6*x4, x7*x1, x7*x2, x3*x7, x4*x7, x3*x8, x4*x8, x5*x8, x6*x8, x1, x2, x3, x4, x5, x6, x7, x8, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_l2_3view_triang = [Err_l2_3view_triang err];
    Tm_l2_3view_triang = [Tm_l2_3view_triang tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_l2_3view_triang.mat'),'Err_l2_3view_triang');
save(strcat(folder,'\_results\Tm_l2_3view_triang.mat'),'Tm_l2_3view_triang');

fprintf('Problem #31. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_l2_3view_triang),median(Err_l2_3view_triang));