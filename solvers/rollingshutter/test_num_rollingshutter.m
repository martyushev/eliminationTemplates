rng(23);

N = 10000;

Err_rollingshutter = [];
Tm_rollingshutter = [];

for i = 1:N

    data = inidata_rollingshutter(); % generate initial data of the problem

    try
        tic;
        C = coefs_rollingshutter(data); % compute coefficients of polynomial system
        [x1x1, x2x2, x3x3, x4x4, x5x5] = std_47x55_colpiv_rollingshutter(C); % solve polynomial system
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
        m = [x1^2, x1*x2, x2^2, x1*x3, x2*x3, x3^2, x1*x4, x2*x4, x4*x3, x4^2, x1*x5, x2*x5, x5*x3, x5*x4, x5^2, x1, x2, x3, x4, x5, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M.','fro');

    Err_rollingshutter = [Err_rollingshutter err];
    Tm_rollingshutter = [Tm_rollingshutter tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_rollingshutter.mat'),'Err_rollingshutter');
save(strcat(folder,'\_results\Tm_rollingshutter.mat'),'Tm_rollingshutter');

fprintf('Problem #13. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_rollingshutter),median(Err_rollingshutter));