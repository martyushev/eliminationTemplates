warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q2 = rand(3,5);
Q = rand(3,5);

try
    tic;
    C = coefs_refract5p(q2,Q); % coefficients of polynomial system
    [xx,yy,zz] = std_refract5p(C);
    tm = toc;
catch ME
    continue;
end

if isempty(xx); continue; end

M = [];
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [z*x^3, z*x^2*y, z*x*y^2, z*y^3, z^2*x^2, z^2*x*y, z^2*y^2, z^3*x, z^3*y, z^4, x^3, x^2*y, x*y^2, y^3, x^2*z, z*y^2, z^2*x, z^2*y, z^3, x^2, y*x, y^2, z*x, z*y, z^2, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_refract5p = Err;
Tm_refract5p = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_refract5p.mat'),'Err_refract5p');
save(strcat(folder, '\_results\Tm_refract5p.mat'),'Tm_refract5p');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');