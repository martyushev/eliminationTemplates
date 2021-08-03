warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q = rand(3,6);
Q = rand(3,6);

try
    tic;
    C = coefs_p6pf_refract(q,Q); % coefficients of polynomial system
    [ww,xx,yy,zz] = std_p6pf_refract(C);
    tm = toc;
catch ME
    continue;
end

M = [];
for j=1:length(ww)
    w = ww(j);
    x = xx(j);
    y = yy(j);
    z = zz(j);
    m = [z*y*x^2*w, z*y^2*x*w, z^3*x*w, z^3*y*w, y*x^2*w, y*x^3, y^2*x*w, y^3*x, z^2*x*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, w*x, x^2, w*y, y*x, y^2, z^2, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_p6pf_refract = Err;
Tm_p6pf_refract = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_p6pf_refract.mat'),'Err_p6pf_refract');
save(strcat(folder, '\_results\Tm_p6pf_refract.mat'),'Tm_p6pf_refract');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');