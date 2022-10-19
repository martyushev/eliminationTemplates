rng(23);

N = 10000;

Err_l2_3view_triang = [];
Tm_l2_3view_triang = [];

for i = 1:N

    data = inidata_l2_3view_triang(); % generate initial data of the problem

    try
        tic;
        C = coefs_l2_3view_triang(data); % compute coefficients of polynomial system
        [x1x1,x2x2,x3x3,x4x4,x5x5,x6x6,x7x7,x8x8] = std_217x248_colpiv_l2_3view_triang(C); % solve polynomial system
        tm = toc;
        if isempty(x1x1); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(x1x1)
        x1 = x1x1(j);
        x2 = x2x2(j);
        x3 = x3x3(j);
        x4 = x4x4(j);
        x5 = x5x5(j);
        x6 = x6x6(j);
        x7 = x7x7(j);
        x8 = x8x8(j);
        m = [x3*x1,x3*x2,x4*x1,x4*x2,x5*x3,x4*x5,x3*x6,x6*x4,x7*x1,x7*x2,x3*x7,x4*x7,x3*x8,x4*x8,x5*x8,x6*x8,x1,x2,x3,x4,x5,x6,x7,x8,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(31,length(M))),'fro');

    Err_l2_3view_triang = [Err_l2_3view_triang err];
    Tm_l2_3view_triang = [Tm_l2_3view_triang tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_l2_3view_triang.mat'),'Err_l2_3view_triang');

fprintf('Problem: l2_3view_triang. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_l2_3view_triang),median(Err_l2_3view_triang));
