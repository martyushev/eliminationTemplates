warning ('off', 'all');

%clear
%clc
rng(23);

%N = 10000;

Err = [];
Tm = [];

for i = 1:N

q{1} = rand(2,7);
q{2} = rand(2,7);

try
    tic;
    C = coefs_relpose_7p_fr_1s(q{1},q{2}); % coefficients of polynomial system
    [xx,yy,zz] = std_relpose_7p_fr_1s(C);
    tm = toc;
catch ME
    continue;
end

M = [];
c = C(11,:);
for j=1:length(xx)
    x = xx(j);
    y = yy(j);
    z = zz(j);
    w = get_w(c,x,y,z);
    m = [x^3*z^3, x^2*z^3*y, y^2*z^3*x, y^3*z^3, w*x^3*z, w*x^2*z*y, w*x*y^2*z, w*y^3*z, x^3*z^2, y*x^2*z^2, x*z^2*y^2, y^3*z^2, x^2*z^3, x*z^3*y, y^2*z^3, w*x^3, w*x^2*y, w*x*y^2, w*y^3, w*x^2*z, w*x*y*z, x^2*z*y, w*y^2*z, x*z*y^2, y^3*z, x^2*z^2, x*z^2*y, z^2*y^2, x*z^3, z^3*y, x^2*w, y*x*w, y^2*w, y^2*x, y^3, w*x*z, x^2*z, w*y*z, x*z*y, y^2*z, x*z^2, y*z^2, z^3, w*x, w*y, x*y, y^2, w*z, z*x, y*z, z^2, w, x, y, z, 1];
    m = m/norm(m,'fro');
    M = [M; m];
end
err = log10(norm(C*M','fro'));

Err = [Err err];
Tm = [Tm tm];

end

Err_relpose_7p_fr_1s = Err;
Tm_relpose_7p_fr_1s = Tm;
%folder = fileparts(which('test_num_all.m'));
save(strcat(folder, '\_results\Err_relpose_7p_fr_1s.mat'),'Err_relpose_7p_fr_1s');
save(strcat(folder, '\_results\Tm_relpose_7p_fr_1s.mat'),'Tm_relpose_7p_fr_1s');

sprintf('%0.1f, %0.2e', 10^3*median(Tm), 10^median(Err))

warning ('on', 'all');




function w = get_w(c,x,y,z)

w = -(c(9)*x^3*z^2+c(46)*x*y+c(4)*y^3*z^3+c(30)*z^3*y+c(15)*y^2*z^3+c(34)*y^2*x+c(50)*y*z+c(42)*y*z^2+c(29)*x*z^3+c(37)*x^2*z+c(40)*y^2*z+c(25)*y^3*z+c(26)*x^2*z^2+c(12)*y^3*z^2+c(13)*x^2*z^3+c(1)*x^3*z^3+c(41)*x*z^2+c(28)*z^2*y^2+c(49)*z*x+c(51)*z^2+c(53)*x+c(54)*y+c(55)*z+c(35)*y^3+c(43)*z^3+c(47)*y^2+c(22)*x^2*z*y+c(24)*x*z*y^2+c(27)*x*z^2*y+c(39)*x*z*y+c(2)*x^2*z^3*y+c(3)*y^2*z^3*x+c(10)*y*x^2*z^2+c(11)*x*z^2*y^2+c(14)*x*z^3*y+c(56))/...
    (x^3*z*c(5)+x^2*y*z*c(6)+x*y^2*z*c(7)+y^3*z*c(8)+x^3*c(16)+x^2*y*c(17)+x^2*z*c(20)+x*y^2*c(18)+x*y*z*c(21)+y^3*c(19)+y^2*z*c(23)+x^2*c(31)+x*y*c(32)+x*z*c(36)+y^2*c(33)+y*z*c(38)+x*c(44)+y*c(45)+z*c(48)+c(52));

end