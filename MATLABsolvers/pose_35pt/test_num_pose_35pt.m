warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q{1} = rand(4,1);
q{2} = rand(3,1);
Q = rand(3,4);

try
    tic;
    C = coefs_pose_35pt(q{1},q{2},Q); % coefficients of polynomial system
    [xx,yy] = std_pose_35pt(C);
    tm = toc;
catch ME
    continue;
end

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    m = [x^6, x^4*y^2, x^2*y^4, y^6, x^5, y*x^4, y^2*x^3, y^3*x^2, y^4*x, y^5, x^4, y*x^3, y^2*x^2, y^3*x, y^4, x^3, y*x^2, y^2*x, y^3, x^2, y*x, y^2, x, y, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_pose_35pt = Err;
Tm_pose_35pt = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_pose_35pt.mat'),'Err_pose_35pt');
save(strcat(folder, '\_results\Tm_pose_35pt.mat'),'Tm_pose_35pt');

sprintf('Prob. #23, Runtime: %0.1f ms, Error: %0.2e', 10^3*mean(Tm), 10^median(Err))

warning ('on', 'all');