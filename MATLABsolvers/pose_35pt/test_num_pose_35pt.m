warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err = [];
Tm = [];

for i = 1:N

    data = inidata_pose_35pt(); % generate initial data of the problem

    try
        tic;
        C = coefs_pose_35pt(data); % compute coefficients of polynomial system
        [xx, yy] = std_pose_35pt(C); % solve polynomial system
        tm = toc;
        if isempty(xx); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(xx)
        x = xx(j);
        y = yy(j);
        m = [x^6, y^2*x^4, x^2*y^4, y^6, x^5, x^4*y, x^3*y^2, x^2*y^3, x*y^4, y^5, x^4, y*x^3, y^2*x^2, y^3*x, y^4, x^3, y*x^2, y^2*x, y^3, x^2, y*x, y^2, x, y, 1];
        m = m/norm(m,'fro');
        M = [M; m];
    end
    err = norm(C*M','fro');

    Err = [Err err];
    Tm = [Tm tm];

end

Err_pose_35pt = Err;
Tm_pose_35pt = Tm;

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_pose_35pt.mat'),'Err_pose_35pt');
save(strcat(folder,'\_results\Tm_pose_35pt.mat'),'Tm_pose_35pt');

fprintf('Problem: pose_35pt. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm),median(Err));

warning ('on','all');