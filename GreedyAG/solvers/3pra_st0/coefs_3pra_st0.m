function C = coefs_3pra_st0(data)

    x1 = data{1};
    x2 = data{2};
    s = data{3};

    C = zeros(6,35);
    ss = s^2;

    jj = [2 3 1];
    kk = [3 1 2];

    for i = 1:3
        j = jj(i); k = kk(i);
        p1 = [-x1(3,i)*x1(2,j)+x1(2,i)*x1(3,j) x1(3,i)*x1(1,j)-x1(1,i)*x1(3,j) -x1(2,i)*x1(1,j)+x1(1,i)*x1(2,j)];
        p2 = [-x2(3,i)*x2(2,j)+x2(2,i)*x2(3,j) x2(3,i)*x2(1,j)-x2(1,i)*x2(3,j) -x2(2,i)*x2(1,j)+x2(1,i)*x2(2,j)];
        q1 = [-x1(3,i)*x1(2,k)+x1(2,i)*x1(3,k) x1(3,i)*x1(1,k)-x1(1,i)*x1(3,k) -x1(2,i)*x1(1,k)+x1(1,i)*x1(2,k)];
        q2 = [-x2(3,i)*x2(2,k)+x2(2,i)*x2(3,k) x2(3,i)*x2(1,k)-x2(1,i)*x2(3,k) -x2(2,i)*x2(1,k)+x2(1,i)*x2(2,k)];
        M = [-x1(1,j)*p2(1)-x1(2,j)*p2(2)-x1(3,j)*p2(3)+2*x1(1,j)*p2(1)*ss+2*x1(2,j)*p2(2)*ss+2*x1(3,j)*p2(3)*ss 2*x1(1,j)*p2(3)*s-2*x1(3,j)*p2(1)*s -2*x1(2,j)*p2(3)*s+2*x1(3,j)*p2(2)*s -2*x1(1,j)*p2(2)*s+2*x1(2,j)*p2(1)*s 2*x1(1,j)*p2(1) 2*x1(1,j)*p2(2)+2*x1(2,j)*p2(1) 2*x1(1,j)*p2(3)+2*x1(3,j)*p2(1) 2*x1(2,j)*p2(2) 2*x1(2,j)*p2(3)+2*x1(3,j)*p2(2) 2*x1(3,j)*p2(3); -p1(1)*x2(1,j)-p1(2)*x2(2,j)-p1(3)*x2(3,j)+2*p1(1)*x2(1,j)*ss+2*p1(2)*x2(2,j)*ss+2*p1(3)*x2(3,j)*ss 2*p1(1)*x2(3,j)*s-2*p1(3)*x2(1,j)*s -2*p1(2)*x2(3,j)*s+2*p1(3)*x2(2,j)*s 2*p1(2)*x2(1,j)*s-2*p1(1)*x2(2,j)*s 2*p1(1)*x2(1,j) 2*p1(1)*x2(2,j)+2*p1(2)*x2(1,j) 2*p1(1)*x2(3,j)+2*p1(3)*x2(1,j) 2*p1(2)*x2(2,j) 2*p1(2)*x2(3,j)+2*p1(3)*x2(2,j) 2*p1(3)*x2(3,j); -x1(1,k)*q2(1)-x1(2,k)*q2(2)-x1(3,k)*q2(3)+2*x1(1,k)*q2(1)*ss+2*x1(2,k)*q2(2)*ss+2*x1(3,k)*q2(3)*ss 2*x1(1,k)*q2(3)*s-2*x1(3,k)*q2(1)*s -2*x1(2,k)*q2(3)*s+2*x1(3,k)*q2(2)*s -2*x1(1,k)*q2(2)*s+2*x1(2,k)*q2(1)*s 2*x1(1,k)*q2(1) 2*x1(1,k)*q2(2)+2*x1(2,k)*q2(1) 2*x1(1,k)*q2(3)+2*x1(3,k)*q2(1) 2*x1(2,k)*q2(2) 2*x1(2,k)*q2(3)+2*x1(3,k)*q2(2) 2*x1(3,k)*q2(3); -q1(1)*x2(1,k)-q1(2)*x2(2,k)-q1(3)*x2(3,k)+2*q1(1)*x2(1,k)*ss+2*q1(2)*x2(2,k)*ss+2*q1(3)*x2(3,k)*ss 2*q1(1)*x2(3,k)*s-2*q1(3)*x2(1,k)*s -2*q1(2)*x2(3,k)*s+2*q1(3)*x2(2,k)*s -2*q1(1)*x2(2,k)*s+2*q1(2)*x2(1,k)*s 2*q1(1)*x2(1,k) 2*q1(1)*x2(2,k)+2*q1(2)*x2(1,k) 2*q1(1)*x2(3,k)+2*q1(3)*x2(1,k) 2*q1(2)*x2(2,k) 2*q1(2)*x2(3,k)+2*q1(3)*x2(2,k) 2*q1(3)*x2(3,k)];
        N = [-p1(1)*x2(1,j)-p1(2)*x2(2,j)-p1(3)*x2(3,j)+2*p1(1)*x2(1,j)*ss+2*p1(2)*x2(2,j)*ss+2*p1(3)*x2(3,j)*ss 2*p1(1)*x2(3,j)*s-2*p1(3)*x2(1,j)*s -2*p1(2)*x2(3,j)*s+2*p1(3)*x2(2,j)*s 2*p1(2)*x2(1,j)*s-2*p1(1)*x2(2,j)*s 2*p1(1)*x2(1,j) 2*p1(1)*x2(2,j)+2*p1(2)*x2(1,j) 2*p1(1)*x2(3,j)+2*p1(3)*x2(1,j) 2*p1(2)*x2(2,j) 2*p1(2)*x2(3,j)+2*p1(3)*x2(2,j) 2*p1(3)*x2(3,j); -x1(1,j)*p2(1)-x1(2,j)*p2(2)-x1(3,j)*p2(3)+2*x1(1,j)*p2(1)*ss+2*x1(2,j)*p2(2)*ss+2*x1(3,j)*p2(3)*ss 2*x1(1,j)*p2(3)*s-2*x1(3,j)*p2(1)*s -2*x1(2,j)*p2(3)*s+2*x1(3,j)*p2(2)*s -2*x1(1,j)*p2(2)*s+2*x1(2,j)*p2(1)*s 2*x1(1,j)*p2(1) 2*x1(1,j)*p2(2)+2*x1(2,j)*p2(1) 2*x1(1,j)*p2(3)+2*x1(3,j)*p2(1) 2*x1(2,j)*p2(2) 2*x1(2,j)*p2(3)+2*x1(3,j)*p2(2) 2*x1(3,j)*p2(3); 0 x1(2,i) x1(1,i) x1(3,i) 0 0 0 0 0 0; 0 -x2(2,i) -x2(1,i) -x2(3,i) 0 0 0 0 0 0];
        C(i,:) = [-M(18)*M(19)+M(17)*M(20) -M(18)*M(23)-M(22)*M(19)+M(17)*M(24)+M(21)*M(20) M(29)*M(20)+M(21)*M(24)-M(22)*M(23)-M(30)*M(19)-M(31)*M(18)+M(17)*M(32) M(29)*M(24)+M(21)*M(32)-M(30)*M(23)-M(31)*M(22) -M(31)*M(30)+M(29)*M(32) M(25)*M(20)-M(26)*M(19)-M(27)*M(18)+M(17)*M(28) -M(27)*M(22)+M(25)*M(24)+M(33)*M(20)+M(17)*M(36)+M(21)*M(28)-M(35)*M(18)-M(26)*M(23)-M(34)*M(19) -M(27)*M(30)+M(25)*M(32)+M(29)*M(28)+M(33)*M(24)+M(21)*M(36)-M(31)*M(26)-M(35)*M(22)-M(34)*M(23) M(29)*M(36)+M(33)*M(32)-M(31)*M(34)-M(35)*M(30) M(25)*M(28)+M(37)*M(20)-M(38)*M(19)-M(27)*M(26)-M(39)*M(18)+M(17)*M(40) M(21)*M(40)+M(25)*M(36)+M(33)*M(28)+M(37)*M(24)-M(27)*M(34)-M(35)*M(26)-M(39)*M(22)-M(38)*M(23) M(29)*M(40)+M(33)*M(36)+M(37)*M(32)-M(31)*M(38)-M(35)*M(34)-M(39)*M(30) M(25)*M(40)+M(37)*M(28)-M(27)*M(38)-M(39)*M(26) M(33)*M(40)+M(37)*M(36)-M(35)*M(38)-M(39)*M(34) -M(39)*M(38)+M(37)*M(40) -M(10)*M(19)-M(18)*M(11)+M(9)*M(20)+M(17)*M(12) M(9)*M(24)+M(17)*M(8)+M(21)*M(12)-M(6)*M(19)-M(10)*M(23)-M(18)*M(7)-M(22)*M(11)+M(5)*M(20) M(5)*M(24)+M(9)*M(32)+M(21)*M(8)-M(6)*M(23)-M(22)*M(7)-M(30)*M(11)+M(29)*M(12)-M(31)*M(10) -M(31)*M(6)-M(30)*M(7)+M(5)*M(32)+M(29)*M(8) M(9)*M(28)+M(13)*M(20)+M(17)*M(16)+M(25)*M(12)-M(14)*M(19)-M(18)*M(15)-M(26)*M(11)-M(27)*M(10) M(21)*M(16)+M(33)*M(12)+M(5)*M(28)+M(9)*M(36)+M(13)*M(24)-M(27)*M(6)-M(35)*M(10)-M(14)*M(23)-M(22)*M(15)-M(26)*M(7)-M(34)*M(11)+M(25)*M(8) M(5)*M(36)+M(13)*M(32)-M(30)*M(15)-M(34)*M(7)+M(29)*M(16)-M(31)*M(14)-M(35)*M(6)+M(33)*M(8) M(9)*M(40)+M(13)*M(28)-M(39)*M(10)-M(26)*M(15)-M(38)*M(11)+M(25)*M(16)-M(27)*M(14)+M(37)*M(12) M(5)*M(40)+M(13)*M(36)-M(39)*M(6)-M(34)*M(15)-M(38)*M(7)-M(35)*M(14)+M(33)*M(16)+M(37)*M(8) M(37)*M(16)-M(39)*M(14)-M(38)*M(15)+M(13)*M(40) -M(10)*M(11)-M(18)*M(3)+M(1)*M(20)+M(9)*M(12)+M(17)*M(4)-M(2)*M(19) -M(2)*M(23)-M(6)*M(11)-M(10)*M(7)-M(22)*M(3)+M(21)*M(4)+M(1)*M(24)+M(5)*M(12)+M(9)*M(8) -M(6)*M(7)-M(30)*M(3)+M(1)*M(32)+M(5)*M(8)+M(29)*M(4)-M(31)*M(2) -M(27)*M(2)-M(10)*M(15)-M(14)*M(11)-M(26)*M(3)+M(13)*M(12)+M(25)*M(4)+M(1)*M(28)+M(9)*M(16) -M(35)*M(2)-M(6)*M(15)-M(14)*M(7)-M(34)*M(3)+M(33)*M(4)+M(1)*M(36)+M(5)*M(16)+M(13)*M(8) -M(14)*M(15)-M(38)*M(3)+M(1)*M(40)+M(13)*M(16)+M(37)*M(4)-M(39)*M(2) -M(2)*M(11)-M(10)*M(3)+M(1)*M(12)+M(9)*M(4) -M(2)*M(7)-M(6)*M(3)+M(1)*M(8)+M(5)*M(4) -M(2)*M(15)-M(14)*M(3)+M(1)*M(16)+M(13)*M(4) M(1)*M(4)-M(2)*M(3)];
        C(i+3,:) = [-N(18)*N(19)+N(17)*N(20) N(17)*N(24)+N(21)*N(20)-N(18)*N(23)-N(22)*N(19) N(17)*N(32)+N(21)*N(24)+N(29)*N(20)-N(18)*N(31)-N(22)*N(23)-N(30)*N(19) N(21)*N(32)+N(29)*N(24)-N(30)*N(23)-N(22)*N(31) -N(30)*N(31)+N(29)*N(32) N(17)*N(28)+N(25)*N(20)-N(18)*N(27)-N(26)*N(19) -N(34)*N(19)-N(18)*N(35)-N(22)*N(27)-N(26)*N(23)+N(17)*N(36)+N(21)*N(28)+N(25)*N(24)+N(33)*N(20) -N(30)*N(27)-N(34)*N(23)-N(22)*N(35)-N(26)*N(31)+N(21)*N(36)+N(25)*N(32)+N(29)*N(28)+N(33)*N(24) N(29)*N(36)+N(33)*N(32)-N(30)*N(35)-N(34)*N(31) N(17)*N(40)+N(25)*N(28)+N(37)*N(20)-N(38)*N(19)-N(18)*N(39)-N(26)*N(27) -N(34)*N(27)-N(22)*N(39)+N(21)*N(40)+N(25)*N(36)+N(33)*N(28)+N(37)*N(24)-N(38)*N(23)-N(26)*N(35) N(29)*N(40)+N(33)*N(36)+N(37)*N(32)-N(30)*N(39)-N(34)*N(35)-N(38)*N(31) N(25)*N(40)+N(37)*N(28)-N(38)*N(27)-N(26)*N(39) N(33)*N(40)+N(37)*N(36)-N(34)*N(39)-N(38)*N(35) -N(38)*N(39)+N(37)*N(40) N(17)*N(12)-N(10)*N(19)-N(18)*N(11)+N(9)*N(20) N(5)*N(20)+N(9)*N(24)+N(17)*N(8)+N(21)*N(12)-N(6)*N(19)-N(10)*N(23)-N(18)*N(7)-N(22)*N(11) N(5)*N(24)+N(9)*N(32)+N(21)*N(8)-N(6)*N(23)-N(10)*N(31)-N(22)*N(7)-N(30)*N(11)+N(29)*N(12) N(29)*N(8)-N(6)*N(31)-N(30)*N(7)+N(5)*N(32) N(9)*N(28)+N(13)*N(20)+N(17)*N(16)+N(25)*N(12)-N(10)*N(27)-N(14)*N(19)-N(18)*N(15)-N(26)*N(11) N(13)*N(24)+N(21)*N(16)+N(25)*N(8)+N(33)*N(12)+N(5)*N(28)+N(9)*N(36)-N(10)*N(35)-N(14)*N(23)-N(22)*N(15)-N(26)*N(7)-N(34)*N(11)-N(6)*N(27) N(5)*N(36)+N(13)*N(32)-N(6)*N(35)-N(14)*N(31)-N(30)*N(15)-N(34)*N(7)+N(29)*N(16)+N(33)*N(8) N(9)*N(40)+N(13)*N(28)+N(25)*N(16)-N(10)*N(39)-N(14)*N(27)-N(26)*N(15)-N(38)*N(11)+N(37)*N(12) N(5)*N(40)+N(13)*N(36)-N(6)*N(39)-N(14)*N(35)-N(34)*N(15)-N(38)*N(7)+N(33)*N(16)+N(37)*N(8) N(37)*N(16)-N(14)*N(39)-N(38)*N(15)+N(13)*N(40) N(1)*N(20)+N(9)*N(12)+N(17)*N(4)-N(2)*N(19)-N(10)*N(11)-N(18)*N(3) -N(2)*N(23)-N(6)*N(11)-N(10)*N(7)-N(22)*N(3)+N(1)*N(24)+N(5)*N(12)+N(9)*N(8)+N(21)*N(4) N(1)*N(32)+N(5)*N(8)+N(29)*N(4)-N(2)*N(31)-N(6)*N(7)-N(30)*N(3) -N(2)*N(27)-N(10)*N(15)-N(14)*N(11)-N(26)*N(3)+N(1)*N(28)+N(9)*N(16)+N(13)*N(12)+N(25)*N(4) -N(2)*N(35)-N(6)*N(15)-N(14)*N(7)-N(34)*N(3)+N(1)*N(36)+N(5)*N(16)+N(13)*N(8)+N(33)*N(4) N(1)*N(40)+N(13)*N(16)+N(37)*N(4)-N(2)*N(39)-N(14)*N(15)-N(38)*N(3) N(1)*N(12)+N(9)*N(4)-N(2)*N(11)-N(10)*N(3) N(1)*N(8)+N(5)*N(4)-N(2)*N(7)-N(6)*N(3) N(1)*N(16)+N(13)*N(4)-N(2)*N(15)-N(14)*N(3) N(1)*N(4)-N(2)*N(3)];
    end
 
    C = [C; zeros(1,25) 1 0 1 0 0 1 0 0 0 ss-1];
    
    C = C./repmat(sqrt(sum(C.^2,2)),1,size(C,2));

end