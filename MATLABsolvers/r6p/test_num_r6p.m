warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q = rand(2,3);
X = rand(3,3);
A = rand(6,16);

try
    tic;
    C = coefs_r6p(q,X,A); % coefficients of polynomial system
    [uu,vv,ww,xx,yy,zz] = std_r6p(C);
    tm = toc;
catch ME
    continue;
end

M = [];
for j=1:length(uu)
    u = uu(j);
    v = vv(j);
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [x*u, x*v, w*x, y*u, y*v, y*w, z*u, v*z, w*z, u, v, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_r6p = Err;
Tm_r6p = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_r6p.mat'),'Err_r6p');
save(strcat(folder, '\_results\Tm_r6p.mat'),'Tm_r6p');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');