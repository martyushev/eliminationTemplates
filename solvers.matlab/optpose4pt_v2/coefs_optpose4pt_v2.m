function [C,U,dU] = coefs_optpose4pt_v2(data)

    U = data{1};
    u = data{2};

    C = zeros(5,19);
    C(95) = -1;
    C([45,70]) = 1;
    C(91) = u(1)*U(1)^2;
    C(92) = u(5)*U(4)^2;
    C(93) = u(9)*U(7)^2;
    C(94) = u(13)*U(10)^2;
    C(71) = 2*u(1)*U(1);
    C(76) = 2*u(2)*U(1);
    C(46) = 2*u(2)*U(2);
    C(26) = 2*u(2)*U(3);
    C(72) = 2*u(5)*U(4);
    C(77) = 2*u(6)*U(4);
    C(47) = 2*u(6)*U(5);
    C(27) = 2*u(6)*U(6);
    C(73) = 2*u(9)*U(7);
    C(78) = 2*u(10)*U(7);
    C(48) = 2*u(10)*U(8);
    C(28) = 2*u(10)*U(9);
    C(74) = 2*u(13)*U(10);
    C(79) = 2*u(14)*U(10);
    C(49) = 2*u(14)*U(11);
    C(29) = 2*u(14)*U(12);
    C(86) = 2*u(2)*U(2)*U(1);
    C(81) = 2*u(2)*U(3)*U(1);
    C(87) = 2*u(6)*U(5)*U(4);
    C(82) = 2*u(6)*U(6)*U(4);
    C(88) = 2*u(10)*U(8)*U(7);
    C(83) = 2*u(10)*U(9)*U(7);
    C(89) = 2*u(14)*U(11)*U(10);
    C(84) = 2*u(14)*U(12)*U(10);
    C(11) = 2*u(2);
    C(16) = 2*u(3);
    C(12) = 2*u(6);
    C(17) = 2*u(7);
    C(13) = 2*u(10);
    C(18) = 2*u(11);
    C(14) = 2*u(14);
    C(19) = 2*u(15);
    C(31) = 2*u(1)*U(2)+2*u(3)*U(3);
    C(51) = -2*u(1)*U(3)+2*u(3)*U(2);
    C(36) = 2*u(3)*U(2)+2*u(4)*U(3);
    C(56) = -2*u(3)*U(3)+2*u(4)*U(2);
    C(32) = 2*u(5)*U(5)+2*u(7)*U(6);
    C(52) = -2*u(5)*U(6)+2*u(7)*U(5);
    C(37) = 2*u(7)*U(5)+2*u(8)*U(6);
    C(57) = -2*u(7)*U(6)+2*u(8)*U(5);
    C(33) = 2*u(9)*U(8)+2*u(11)*U(9);
    C(53) = -2*u(9)*U(9)+2*u(11)*U(8);
    C(38) = 2*u(11)*U(8)+2*u(12)*U(9);
    C(58) = -2*u(11)*U(9)+2*u(12)*U(8);
    C(34) = 2*u(13)*U(11)+2*u(15)*U(12);
    C(54) = -2*u(13)*U(12)+2*u(15)*U(11);
    C(39) = 2*u(15)*U(11)+2*u(16)*U(12);
    C(59) = -2*u(15)*U(12)+2*u(16)*U(11);
    C(66) = -2*u(3)*U(2)*U(3)+u(1)*U(3)^2+u(4)*U(2)^2;
    C(41) = 2*u(3)*U(2)*U(3)+u(1)*U(2)^2+u(4)*U(3)^2;
    C(67) = -2*u(7)*U(5)*U(6)+u(5)*U(6)^2+u(8)*U(5)^2;
    C(42) = 2*u(7)*U(5)*U(6)+u(5)*U(5)^2+u(8)*U(6)^2;
    C(68) = -2*u(11)*U(8)*U(9)+u(12)*U(8)^2+u(9)*U(9)^2;
    C(43) = 2*u(11)*U(8)*U(9)+u(12)*U(9)^2+u(9)*U(8)^2;
    C(69) = -2*u(15)*U(11)*U(12)+u(13)*U(12)^2+u(16)*U(11)^2;
    C(44) = 2*u(15)*U(11)*U(12)+u(13)*U(11)^2+u(16)*U(12)^2;
    C(61) = 2*u(3)*U(2)^2-2*u(3)*U(3)^2-2*u(1)*U(2)*U(3)+2*u(4)*U(2)*U(3);
    C(62) = 2*u(7)*U(5)^2-2*u(7)*U(6)^2-2*u(5)*U(5)*U(6)+2*u(8)*U(5)*U(6);
    C(63) = 2*u(11)*U(8)^2-2*u(11)*U(9)^2-2*u(9)*U(8)*U(9)+2*u(12)*U(8)*U(9);
    C(64) = 2*u(15)*U(11)^2-2*u(15)*U(12)^2-2*u(13)*U(11)*U(12)+2*u(16)*U(11)*U(12);
    C([1,6]) = u(1);
    C(21) = u(4);
    C([2,7]) = u(5);
    C(22) = u(8);
    C([3,8]) = u(9);
    C(23) = u(12);
    C([4,9]) = u(13);
    C(24) = u(16);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(v,w,x,y,z)[v^2,w^2,x*v,x*w,x^2,y*v,y*w,x*y,y^2,z*v,z*w,x*z,y*z,z^2,v,x,y,z,1];
    dU = @(v,w,x,y,z)[[2*v,0,x,0,0,y,0,0,0,z,0,0,0,0,1,0,0,0,0];[0,2*w,0,x,0,0,y,0,0,0,z,0,0,0,0,0,0,0,0];[0,0,v,w,2*x,0,0,y,0,0,0,z,0,0,0,1,0,0,0];[0,0,0,0,0,v,w,x,2*y,0,0,0,z,0,0,0,1,0,0];[0,0,0,0,0,0,0,0,0,v,w,x,y,2*z,0,0,0,1,0]];

end