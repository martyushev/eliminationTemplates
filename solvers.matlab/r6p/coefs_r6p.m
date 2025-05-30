function [C,U,dU] = coefs_r6p(data)

    q = data{1};
    X = data{2};
    A = data{3};

    C = zeros(6,16);
    C(8) = q(1)*A(10)-q(1)^2*A(12)-q(1)*A(9)+A(7);
    C(19) = -q(1)*A(23)+q(2)*A(21)+q(2)*q(1)*A(24)-A(20);
    C(37) = -q(1)*A(41)+q(2)*A(39)+q(2)*q(1)*A(42)-A(38);
    C(44) = q(1)*A(46)-q(1)^2*A(48)-q(1)*A(45)+A(43);
    C(10) = q(3)*A(10)-q(3)^2*A(12)-q(3)*A(9)+A(7);
    C(21) = -q(3)*A(23)+q(4)*A(21)+q(4)*q(3)*A(24)-A(20);
    C(39) = -q(3)*A(41)+q(4)*A(39)+q(4)*q(3)*A(42)-A(38);
    C(46) = q(3)*A(46)-q(3)^2*A(48)-q(3)*A(45)+A(43);
    C(12) = q(5)*A(10)-q(5)^2*A(12)-q(5)*A(9)+A(7);
    C(23) = -q(5)*A(23)+q(6)*A(21)+q(6)*q(5)*A(24)-A(20);
    C(41) = -q(5)*A(41)+q(6)*A(39)+q(6)*q(5)*A(42)-A(38);
    C(48) = q(5)*A(46)-q(5)^2*A(48)-q(5)*A(45)+A(43);
    C(7) = -X(1)*q(1)-q(1)*A(11)+q(2)*A(9)+q(2)*q(1)*A(12)-A(8);
    C(50) = -X(1)*q(1)+q(1)*A(52)-q(1)^2*A(54)-q(1)*A(51)+A(49);
    C(20) = X(2)*q(1)+q(1)*A(22)-q(1)^2*A(24)-q(1)*A(21)+A(19);
    C(49) = X(2)*q(1)-q(1)*A(53)+q(2)*A(51)+q(2)*q(1)*A(54)-A(50);
    C(9) = -X(4)*q(3)-q(3)*A(11)+q(4)*A(9)+q(4)*q(3)*A(12)-A(8);
    C(52) = -X(4)*q(3)+q(3)*A(52)-q(3)^2*A(54)-q(3)*A(51)+A(49);
    C(22) = X(5)*q(3)+q(3)*A(22)-q(3)^2*A(24)-q(3)*A(21)+A(19);
    C(51) = X(5)*q(3)-q(3)*A(53)+q(4)*A(51)+q(4)*q(3)*A(54)-A(50);
    C(11) = -X(7)*q(5)-q(5)*A(11)+q(6)*A(9)+q(6)*q(5)*A(12)-A(8);
    C(54) = -X(7)*q(5)+q(5)*A(52)-q(5)^2*A(54)-q(5)*A(51)+A(49);
    C(24) = X(8)*q(5)+q(5)*A(22)-q(5)^2*A(24)-q(5)*A(21)+A(19);
    C(53) = X(8)*q(5)-q(5)*A(53)+q(6)*A(51)+q(6)*q(5)*A(54)-A(50);
    C(2) = q(1)*A(4)+X(3)*q(1)^2-q(1)^2*A(6)-q(1)*A(3)+A(1);
    C(14) = q(1)*A(16)-X(1)*q(1)^2-q(1)^2*A(18)-q(1)*A(15)+A(13);
    C(13) = -q(1)*A(17)+q(2)*A(15)+q(2)*X(1)*q(1)+q(2)*q(1)*A(18)-A(14);
    C(25) = -q(1)*A(29)+q(2)*A(27)-q(2)*X(3)*q(1)+q(2)*q(1)*A(30)-A(26);
    C(32) = q(1)*A(34)-X(2)*q(1)^2-q(1)^2*A(36)-q(1)*A(33)+A(31);
    C(31) = -q(1)*A(35)+q(2)*A(33)+q(2)*X(2)*q(1)+q(2)*q(1)*A(36)-A(32);
    C(43) = -q(1)*X(3)-q(1)*A(47)+q(2)*A(45)+q(2)*q(1)*A(48)-A(44);
    C(38) = q(1)*X(3)+q(1)*A(40)-q(1)^2*A(42)-q(1)*A(39)+A(37);
    C(4) = q(3)*A(4)+X(6)*q(3)^2-q(3)^2*A(6)-q(3)*A(3)+A(1);
    C(16) = q(3)*A(16)-X(4)*q(3)^2-q(3)^2*A(18)-q(3)*A(15)+A(13);
    C(15) = -q(3)*A(17)+q(4)*A(15)+q(4)*X(4)*q(3)+q(4)*q(3)*A(18)-A(14);
    C(27) = -q(3)*A(29)+q(4)*A(27)-q(4)*X(6)*q(3)+q(4)*q(3)*A(30)-A(26);
    C(34) = q(3)*A(34)-X(5)*q(3)^2-q(3)^2*A(36)-q(3)*A(33)+A(31);
    C(33) = -q(3)*A(35)+q(4)*A(33)+q(4)*X(5)*q(3)+q(4)*q(3)*A(36)-A(32);
    C(45) = -q(3)*X(6)-q(3)*A(47)+q(4)*A(45)+q(4)*q(3)*A(48)-A(44);
    C(40) = q(3)*X(6)+q(3)*A(40)-q(3)^2*A(42)-q(3)*A(39)+A(37);
    C(6) = q(5)*A(4)+X(9)*q(5)^2-q(5)^2*A(6)-q(5)*A(3)+A(1);
    C(18) = q(5)*A(16)-X(7)*q(5)^2-q(5)^2*A(18)-q(5)*A(15)+A(13);
    C(17) = -q(5)*A(17)+q(6)*A(15)+q(6)*X(7)*q(5)+q(6)*q(5)*A(18)-A(14);
    C(29) = -q(5)*A(29)+q(6)*A(27)-q(6)*X(9)*q(5)+q(6)*q(5)*A(30)-A(26);
    C(36) = q(5)*A(34)-X(8)*q(5)^2-q(5)^2*A(36)-q(5)*A(33)+A(31);
    C(35) = -q(5)*A(35)+q(6)*A(33)+q(6)*X(8)*q(5)+q(6)*q(5)*A(36)-A(32);
    C(47) = -q(5)*X(9)-q(5)*A(47)+q(6)*A(45)+q(6)*q(5)*A(48)-A(44);
    C(42) = q(5)*X(9)+q(5)*A(40)-q(5)^2*A(42)-q(5)*A(39)+A(37);
    C(61) = q(2)*q(1)*A(66)-A(62)+q(2)*A(63)-q(2)*X(1)-q(1)*A(65);
    C(67) = q(2)*q(1)*A(72)-A(68)-X(1)+q(2)*A(69)-q(1)*A(71);
    C(79) = q(2)*q(1)*A(84)-q(2)*X(1)*q(1)-A(80)+q(2)*A(81)-q(1)*A(83);
    C(85) = q(2)*q(1)*A(90)-A(86)+q(2)*A(87)-q(1)*A(89)-X(1)*q(1);
    C(81) = -q(4)*X(4)*q(3)+q(4)*q(3)*A(84)-A(80)-q(3)*A(83)+q(4)*A(81);
    C(63) = q(4)*q(3)*A(66)-A(62)-q(3)*A(65)+q(4)*A(63)-q(4)*X(4);
    C(69) = q(4)*q(3)*A(72)-A(68)-X(4)-q(3)*A(71)+q(4)*A(69);
    C(87) = q(4)*q(3)*A(90)-A(86)-X(4)*q(3)-q(3)*A(89)+q(4)*A(87);
    C(83) = -q(6)*X(7)*q(5)+q(6)*q(5)*A(84)-A(80)-q(5)*A(83)+q(6)*A(81);
    C(65) = q(6)*q(5)*A(66)-A(62)-q(5)*A(65)+q(6)*A(63)-q(6)*X(7);
    C(71) = q(6)*q(5)*A(72)-A(68)-X(7)-q(5)*A(71)+q(6)*A(69);
    C(89) = q(6)*q(5)*A(90)-A(86)-q(5)*A(89)+q(6)*A(87)-X(7)*q(5);
    C(56) = A(55)-X(2)*q(1)-q(1)^2*A(60)+q(1)*A(58)-q(1)*A(57);
    C(58) = A(55)+q(3)*A(58)-q(3)*A(57)-X(5)*q(3)-q(3)^2*A(60);
    C(60) = A(55)+q(5)*A(58)-q(5)*A(57)-X(8)*q(5)-q(5)^2*A(60);
    C(68) = A(67)-X(2)-q(1)^2*A(72)+q(1)*A(70)-q(1)*A(69);
    C(70) = A(67)-X(5)+q(3)*A(70)-q(3)*A(69)-q(3)^2*A(72);
    C(72) = A(67)-X(8)+q(5)*A(70)-q(5)*A(69)-q(5)^2*A(72);
    C(74) = A(73)-q(1)^2*A(78)-X(2)*q(1)^2+q(1)*A(76)-q(1)*A(75);
    C(76) = A(73)+q(3)*A(76)-q(3)*A(75)-X(5)*q(3)^2-q(3)^2*A(78);
    C(78) = A(73)+q(5)*A(76)-q(5)*A(75)-X(8)*q(5)^2-q(5)^2*A(78);
    C(88) = A(85)-X(5)*q(3)+q(3)*A(88)-q(3)*A(87)-q(3)^2*A(90);
    C(90) = A(85)-X(8)*q(5)+q(5)*A(88)-q(5)*A(87)-q(5)^2*A(90);
    C(86) = A(85)-q(1)^2*A(90)-X(2)*q(1)+q(1)*A(88)-q(1)*A(87);
    C(26) = -X(1)*q(1)+q(1)*A(28)+X(3)*q(1)^2-q(1)^2*A(30)-q(1)*A(27)+A(25);
    C(1) = X(2)*q(1)-q(1)*A(5)+q(2)*A(3)-q(2)*X(3)*q(1)+q(2)*q(1)*A(6)-A(2);
    C(28) = -X(4)*q(3)+q(3)*A(28)+X(6)*q(3)^2-q(3)^2*A(30)-q(3)*A(27)+A(25);
    C(3) = X(5)*q(3)-q(3)*A(5)+q(4)*A(3)-q(4)*X(6)*q(3)+q(4)*q(3)*A(6)-A(2);
    C(30) = -X(7)*q(5)+q(5)*A(28)+X(9)*q(5)^2-q(5)^2*A(30)-q(5)*A(27)+A(25);
    C(5) = X(8)*q(5)-q(5)*A(5)+q(6)*A(3)-q(6)*X(9)*q(5)+q(6)*q(5)*A(6)-A(2);
    C(92) = q(1)*A(94)-q(1)^2*A(96)-q(1)*A(93)-q(1)*X(3)+A(91)+X(1);
    C(91) = -q(1)*A(95)+q(2)*A(93)+q(2)*X(3)+q(2)*q(1)*A(96)-A(92)-X(2);
    C(94) = q(3)*A(94)-q(3)^2*A(96)-q(3)*A(93)-q(3)*X(6)+A(91)+X(4);
    C(93) = q(4)*A(93)+q(4)*X(6)-q(3)*A(95)+q(4)*q(3)*A(96)-A(92)-X(5);
    C(96) = q(5)*A(94)-q(5)^2*A(96)-q(5)*A(93)-q(5)*X(9)+A(91)+X(7);
    C(95) = -q(5)*A(95)+q(6)*A(93)+q(6)*X(9)+q(6)*q(5)*A(96)-A(92)-X(8);
    C(55) = q(2)*q(1)*A(60)-A(56)+X(3)+q(2)*A(57)+q(2)*X(2)-q(1)*A(59);
    C(73) = q(2)*q(1)*A(78)+q(2)*X(2)*q(1)-A(74)+q(2)*A(75)+q(1)*X(3)-q(1)*A(77);
    C(75) = q(4)*X(5)*q(3)+q(4)*q(3)*A(78)-A(74)+q(3)*X(6)-q(3)*A(77)+q(4)*A(75);
    C(57) = q(4)*q(3)*A(60)-A(56)+X(6)-q(3)*A(59)+q(4)*A(57)+q(4)*X(5);
    C(77) = q(6)*X(8)*q(5)+q(6)*q(5)*A(78)-A(74)+q(5)*X(9)-q(5)*A(77)+q(6)*A(75);
    C(59) = q(6)*q(5)*A(60)-A(56)+X(9)-q(5)*A(59)+q(6)*A(57)+q(6)*X(8);
    C(62) = A(61)+X(3)+X(1)*q(1)-q(1)^2*A(66)+q(1)*A(64)-q(1)*A(63);
    C(64) = A(61)+X(6)+q(3)*A(64)-q(3)*A(63)+X(4)*q(3)-q(3)^2*A(66);
    C(66) = A(61)+X(9)+q(5)*A(64)-q(5)*A(63)+X(7)*q(5)-q(5)^2*A(66);
    C(80) = A(79)-q(1)^2*A(84)+X(1)*q(1)^2+q(1)*X(3)+q(1)*A(82)-q(1)*A(81);
    C(82) = A(79)+q(3)*X(6)+q(3)*A(82)-q(3)*A(81)+X(4)*q(3)^2-q(3)^2*A(84);
    C(84) = A(79)+q(5)*X(9)+q(5)*A(82)-q(5)*A(81)+X(7)*q(5)^2-q(5)^2*A(84);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(u,v,w,x,y,z)[x*u,x*v,x*w,y*u,y*v,y*w,u*z,z*v,z*w,u,v,w,x,y,z,1];
    dU = @(u,v,w,x,y,z)[[x,0,0,y,0,0,z,0,0,1,0,0,0,0,0,0];[0,x,0,0,y,0,0,z,0,0,1,0,0,0,0,0];[0,0,x,0,0,y,0,0,z,0,0,1,0,0,0,0];[u,v,w,0,0,0,0,0,0,0,0,0,1,0,0,0];[0,0,0,u,v,w,0,0,0,0,0,0,0,1,0,0];[0,0,0,0,0,0,u,v,w,0,0,0,0,0,1,0]];

end