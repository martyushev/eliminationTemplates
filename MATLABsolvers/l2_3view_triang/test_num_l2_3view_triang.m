warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

E12 = rand(3,3);
E23 = rand(3,3);
u = rand(2,3);

try
    tic;
    C = coefs_l2_3view_triang(E12,E23,u); % coefficients of polynomial system
    [xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8] = std_l2_3view_triang(C);
    tm = toc;
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
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_l2_3view_triang = Err;
Tm_l2_3view_triang = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_l2_3view_triang.mat'),'Err_l2_3view_triang');
save(strcat(folder, '\_results\Tm_l2_3view_triang.mat'),'Tm_l2_3view_triang');

sprintf('Prob. #31, Runtime: %0.1f ms, Error: %0.2e', 10^3*mean(Tm), 10^median(Err))

warning ('on', 'all');