function [C,U,dU] = coefs_gp4p_scale(data)

    b = data{1};

    C = zeros(10,21);
    C(9) = b(1)*b(3)+b(4)*b(6)+b(7)*b(9);
    C(6) = b(1)*b(7)+b(2)*b(8)+b(3)*b(9);
    C(5) = b(3)*b(6)+b(1)*b(4)+b(2)*b(5);
    C(7) = b(4)*b(7)+b(5)*b(8)+b(6)*b(9);
    C(10) = b(5)*b(6)+b(8)*b(9)+b(2)*b(3);
    C(8) = b(7)*b(8)+b(1)*b(2)+b(4)*b(5);
    C(29) = b(14)*b(16)+b(17)*b(19)+b(20)*b(22);
    C(26) = b(14)*b(20)+b(15)*b(21)+b(16)*b(22);
    C(25) = b(16)*b(19)+b(14)*b(17)+b(15)*b(18);
    C(27) = b(17)*b(20)+b(18)*b(21)+b(19)*b(22);
    C(30) = b(18)*b(19)+b(21)*b(22)+b(15)*b(16);
    C(28) = b(20)*b(21)+b(14)*b(15)+b(17)*b(18);
    C(59) = b(27)*b(29)+b(30)*b(32)+b(33)*b(35);
    C(56) = b(27)*b(33)+b(28)*b(34)+b(29)*b(35);
    C(55) = b(29)*b(32)+b(27)*b(30)+b(28)*b(31);
    C(57) = b(30)*b(33)+b(31)*b(34)+b(32)*b(35);
    C(60) = b(31)*b(32)+b(34)*b(35)+b(28)*b(29);
    C(58) = b(33)*b(34)+b(27)*b(28)+b(30)*b(31);
    C(99) = b(40)*b(42)+b(43)*b(45)+b(46)*b(48);
    C(96) = b(40)*b(46)+b(41)*b(47)+b(42)*b(48);
    C(100) = b(41)*b(42)+b(44)*b(45)+b(47)*b(48);
    C(95) = b(41)*b(44)+b(42)*b(45)+b(40)*b(43);
    C(97) = b(43)*b(46)+b(44)*b(47)+b(45)*b(48);
    C(98) = b(46)*b(47)+b(40)*b(41)+b(43)*b(44);
    C(149) = b(53)*b(55)+b(56)*b(58)+b(59)*b(61);
    C(146) = b(53)*b(59)+b(54)*b(60)+b(55)*b(61);
    C(150) = b(54)*b(55)+b(57)*b(58)+b(60)*b(61);
    C(145) = b(54)*b(57)+b(55)*b(58)+b(53)*b(56);
    C(147) = b(56)*b(59)+b(57)*b(60)+b(58)*b(61);
    C(148) = b(59)*b(60)+b(53)*b(54)+b(56)*b(57);
    C(208) = b(66)*b(67)+b(69)*b(70)+b(72)*b(73);
    C(209) = b(66)*b(68)+b(69)*b(71)+b(72)*b(74);
    C(205) = b(66)*b(69)+b(67)*b(70)+b(68)*b(71);
    C(206) = b(66)*b(72)+b(67)*b(73)+b(68)*b(74);
    C(207) = b(69)*b(72)+b(70)*b(73)+b(71)*b(74);
    C(210) = b(73)*b(74)+b(67)*b(68)+b(70)*b(71);
    C(3) = b(1)^2-b(5)^2-b(6)^2+b(7)^2;
    C(23) = b(14)^2-b(18)^2-b(19)^2+b(20)^2;
    C(53) = b(27)^2-b(31)^2-b(32)^2+b(33)^2;
    C(93) = b(40)^2-b(44)^2-b(45)^2+b(46)^2;
    C(143) = b(53)^2-b(57)^2-b(58)^2+b(59)^2;
    C(203) = b(66)^2-b(70)^2-b(71)^2+b(72)^2;
    C(13) = 2*b(1)*b(14)-2*b(5)*b(18)-2*b(6)*b(19)+2*b(7)*b(20);
    C(33) = 2*b(1)*b(27)-2*b(5)*b(31)-2*b(6)*b(32)+2*b(7)*b(33);
    C(63) = 2*b(1)*b(40)-2*b(5)*b(44)-2*b(6)*b(45)+2*b(7)*b(46);
    C(103) = 2*b(1)*b(53)-2*b(5)*b(57)-2*b(6)*b(58)+2*b(7)*b(59);
    C(153) = 2*b(7)*b(72)-2*b(5)*b(70)-2*b(6)*b(71)+2*b(1)*b(66);
    C(43) = 2*b(14)*b(27)-2*b(18)*b(31)-2*b(19)*b(32)+2*b(20)*b(33);
    C(73) = 2*b(14)*b(40)-2*b(18)*b(44)-2*b(19)*b(45)+2*b(20)*b(46);
    C(113) = 2*b(14)*b(53)-2*b(18)*b(57)-2*b(19)*b(58)+2*b(20)*b(59);
    C(163) = 2*b(20)*b(72)-2*b(18)*b(70)-2*b(19)*b(71)+2*b(14)*b(66);
    C(83) = 2*b(27)*b(40)-2*b(31)*b(44)-2*b(32)*b(45)+2*b(33)*b(46);
    C(123) = 2*b(27)*b(53)-2*b(31)*b(57)-2*b(32)*b(58)+2*b(33)*b(59);
    C(173) = -2*b(32)*b(71)+2*b(33)*b(72)-2*b(31)*b(70)+2*b(27)*b(66);
    C(133) = 2*b(40)*b(53)-2*b(44)*b(57)-2*b(45)*b(58)+2*b(46)*b(59);
    C(183) = -2*b(45)*b(71)+2*b(46)*b(72)-2*b(44)*b(70)+2*b(40)*b(66);
    C(193) = -2*b(58)*b(71)+2*b(59)*b(72)-2*b(57)*b(70)+2*b(53)*b(66);
    C(1) = b(1)^2+b(2)^2+b(3)^2-b(4)^2-b(5)^2-b(6)^2;
    C(2) = b(1)^2+b(2)^2+b(3)^2-b(7)^2-b(8)^2-b(9)^2;
    C(4) = b(1)^2-b(3)^2+b(4)^2-b(6)^2+b(7)^2-b(9)^2;
    C(21) = b(14)^2+b(15)^2+b(16)^2-b(17)^2-b(18)^2-b(19)^2;
    C(22) = b(14)^2+b(15)^2+b(16)^2-b(20)^2-b(21)^2-b(22)^2;
    C(24) = b(14)^2-b(16)^2+b(17)^2-b(19)^2+b(20)^2-b(22)^2;
    C(51) = b(27)^2+b(28)^2+b(29)^2-b(30)^2-b(31)^2-b(32)^2;
    C(52) = b(27)^2+b(28)^2+b(29)^2-b(33)^2-b(34)^2-b(35)^2;
    C(54) = b(27)^2-b(29)^2+b(30)^2-b(32)^2+b(33)^2-b(35)^2;
    C(91) = b(40)^2+b(41)^2+b(42)^2-b(43)^2-b(44)^2-b(45)^2;
    C(92) = b(40)^2+b(41)^2+b(42)^2-b(46)^2-b(47)^2-b(48)^2;
    C(94) = b(40)^2-b(42)^2+b(43)^2-b(45)^2+b(46)^2-b(48)^2;
    C(141) = b(53)^2+b(54)^2+b(55)^2-b(56)^2-b(57)^2-b(58)^2;
    C(142) = b(53)^2+b(54)^2+b(55)^2-b(59)^2-b(60)^2-b(61)^2;
    C(144) = b(53)^2-b(55)^2+b(56)^2-b(58)^2+b(59)^2-b(61)^2;
    C(201) = b(66)^2+b(67)^2+b(68)^2-b(69)^2-b(70)^2-b(71)^2;
    C(202) = b(66)^2+b(67)^2+b(68)^2-b(72)^2-b(73)^2-b(74)^2;
    C(204) = b(66)^2-b(68)^2+b(69)^2-b(71)^2+b(72)^2-b(74)^2;
    C(11) = 2*b(1)*b(14)+2*b(2)*b(15)+2*b(3)*b(16)-2*b(4)*b(17)-2*b(5)*b(18)-2*b(6)*b(19);
    C(12) = 2*b(1)*b(14)+2*b(2)*b(15)+2*b(3)*b(16)-2*b(7)*b(20)-2*b(8)*b(21)-2*b(9)*b(22);
    C(14) = 2*b(1)*b(14)-2*b(3)*b(16)+2*b(4)*b(17)-2*b(6)*b(19)+2*b(7)*b(20)-2*b(9)*b(22);
    C(18) = b(1)*b(15)+b(14)*b(2)+b(4)*b(18)+b(17)*b(5)+b(7)*b(21)+b(20)*b(8);
    C(19) = b(1)*b(16)+b(14)*b(3)+b(4)*b(19)+b(17)*b(6)+b(7)*b(22)+b(20)*b(9);
    C(15) = b(1)*b(17)+b(14)*b(4)+b(2)*b(18)+b(15)*b(5)+b(3)*b(19)+b(16)*b(6);
    C(16) = b(1)*b(20)+b(14)*b(7)+b(2)*b(21)+b(15)*b(8)+b(3)*b(22)+b(16)*b(9);
    C(31) = 2*b(1)*b(27)+2*b(2)*b(28)+2*b(3)*b(29)-2*b(4)*b(30)-2*b(5)*b(31)-2*b(6)*b(32);
    C(32) = 2*b(1)*b(27)+2*b(2)*b(28)+2*b(3)*b(29)-2*b(7)*b(33)-2*b(8)*b(34)-2*b(9)*b(35);
    C(34) = 2*b(1)*b(27)-2*b(3)*b(29)+2*b(4)*b(30)-2*b(6)*b(32)+2*b(7)*b(33)-2*b(9)*b(35);
    C(38) = b(1)*b(28)+b(27)*b(2)+b(4)*b(31)+b(30)*b(5)+b(7)*b(34)+b(33)*b(8);
    C(39) = b(1)*b(29)+b(27)*b(3)+b(4)*b(32)+b(30)*b(6)+b(7)*b(35)+b(33)*b(9);
    C(35) = b(1)*b(30)+b(27)*b(4)+b(2)*b(31)+b(28)*b(5)+b(3)*b(32)+b(29)*b(6);
    C(36) = b(1)*b(33)+b(27)*b(7)+b(2)*b(34)+b(28)*b(8)+b(3)*b(35)+b(29)*b(9);
    C(61) = 2*b(1)*b(40)+2*b(2)*b(41)+2*b(3)*b(42)-2*b(4)*b(43)-2*b(5)*b(44)-2*b(6)*b(45);
    C(62) = 2*b(1)*b(40)+2*b(2)*b(41)+2*b(3)*b(42)-2*b(7)*b(46)-2*b(8)*b(47)-2*b(9)*b(48);
    C(64) = 2*b(1)*b(40)-2*b(3)*b(42)+2*b(4)*b(43)-2*b(6)*b(45)+2*b(7)*b(46)-2*b(9)*b(48);
    C(68) = b(1)*b(41)+b(40)*b(2)+b(4)*b(44)+b(43)*b(5)+b(7)*b(47)+b(46)*b(8);
    C(69) = b(1)*b(42)+b(40)*b(3)+b(4)*b(45)+b(43)*b(6)+b(7)*b(48)+b(46)*b(9);
    C(65) = b(1)*b(43)+b(40)*b(4)+b(2)*b(44)+b(41)*b(5)+b(3)*b(45)+b(42)*b(6);
    C(66) = b(1)*b(46)+b(40)*b(7)+b(2)*b(47)+b(41)*b(8)+b(3)*b(48)+b(42)*b(9);
    C(101) = 2*b(1)*b(53)+2*b(2)*b(54)+2*b(3)*b(55)-2*b(4)*b(56)-2*b(5)*b(57)-2*b(6)*b(58);
    C(102) = 2*b(1)*b(53)+2*b(2)*b(54)+2*b(3)*b(55)-2*b(7)*b(59)-2*b(8)*b(60)-2*b(9)*b(61);
    C(104) = 2*b(1)*b(53)-2*b(3)*b(55)+2*b(4)*b(56)-2*b(6)*b(58)+2*b(7)*b(59)-2*b(9)*b(61);
    C(108) = b(1)*b(54)+b(53)*b(2)+b(4)*b(57)+b(56)*b(5)+b(7)*b(60)+b(59)*b(8);
    C(109) = b(1)*b(55)+b(53)*b(3)+b(4)*b(58)+b(56)*b(6)+b(7)*b(61)+b(59)*b(9);
    C(105) = b(1)*b(56)+b(53)*b(4)+b(2)*b(57)+b(54)*b(5)+b(3)*b(58)+b(55)*b(6);
    C(106) = b(1)*b(59)+b(53)*b(7)+b(2)*b(60)+b(54)*b(8)+b(3)*b(61)+b(55)*b(9);
    C(159) = b(1)*b(68)+b(66)*b(3)+b(4)*b(71)+b(69)*b(6)+b(7)*b(74)+b(72)*b(9);
    C(156) = b(1)*b(72)+b(66)*b(7)+b(2)*b(73)+b(67)*b(8)+b(3)*b(74)+b(68)*b(9);
    C(20) = b(2)*b(16)+b(15)*b(3)+b(5)*b(19)+b(18)*b(6)+b(8)*b(22)+b(21)*b(9);
    C(40) = b(2)*b(29)+b(28)*b(3)+b(5)*b(32)+b(31)*b(6)+b(8)*b(35)+b(34)*b(9);
    C(70) = b(2)*b(42)+b(41)*b(3)+b(5)*b(45)+b(44)*b(6)+b(8)*b(48)+b(47)*b(9);
    C(110) = b(2)*b(55)+b(54)*b(3)+b(5)*b(58)+b(57)*b(6)+b(8)*b(61)+b(60)*b(9);
    C(151) = 2*b(3)*b(68)-2*b(4)*b(69)-2*b(5)*b(70)-2*b(6)*b(71)+2*b(1)*b(66)+2*b(2)*b(67);
    C(17) = b(4)*b(20)+b(17)*b(7)+b(5)*b(21)+b(18)*b(8)+b(6)*b(22)+b(19)*b(9);
    C(37) = b(4)*b(33)+b(30)*b(7)+b(5)*b(34)+b(31)*b(8)+b(6)*b(35)+b(32)*b(9);
    C(67) = b(4)*b(46)+b(43)*b(7)+b(5)*b(47)+b(44)*b(8)+b(6)*b(48)+b(45)*b(9);
    C(107) = b(4)*b(59)+b(56)*b(7)+b(5)*b(60)+b(57)*b(8)+b(6)*b(61)+b(58)*b(9);
    C(157) = b(4)*b(72)+b(69)*b(7)+b(5)*b(73)+b(70)*b(8)+b(6)*b(74)+b(71)*b(9);
    C(152) = -2*b(7)*b(72)-2*b(8)*b(73)-2*b(9)*b(74)+2*b(3)*b(68)+2*b(1)*b(66)+2*b(2)*b(67);
    C(154) = 2*b(7)*b(72)-2*b(9)*b(74)-2*b(3)*b(68)+2*b(4)*b(69)-2*b(6)*b(71)+2*b(1)*b(66);
    C(41) = 2*b(14)*b(27)+2*b(15)*b(28)+2*b(16)*b(29)-2*b(17)*b(30)-2*b(18)*b(31)-2*b(19)*b(32);
    C(42) = 2*b(14)*b(27)+2*b(15)*b(28)+2*b(16)*b(29)-2*b(20)*b(33)-2*b(21)*b(34)-2*b(22)*b(35);
    C(44) = 2*b(14)*b(27)-2*b(16)*b(29)+2*b(17)*b(30)-2*b(19)*b(32)+2*b(20)*b(33)-2*b(22)*b(35);
    C(48) = b(14)*b(28)+b(27)*b(15)+b(17)*b(31)+b(30)*b(18)+b(20)*b(34)+b(33)*b(21);
    C(49) = b(14)*b(29)+b(27)*b(16)+b(17)*b(32)+b(30)*b(19)+b(20)*b(35)+b(33)*b(22);
    C(45) = b(14)*b(30)+b(27)*b(17)+b(15)*b(31)+b(28)*b(18)+b(16)*b(32)+b(29)*b(19);
    C(46) = b(14)*b(33)+b(27)*b(20)+b(15)*b(34)+b(28)*b(21)+b(16)*b(35)+b(29)*b(22);
    C(71) = 2*b(14)*b(40)+2*b(15)*b(41)+2*b(16)*b(42)-2*b(17)*b(43)-2*b(18)*b(44)-2*b(19)*b(45);
    C(72) = 2*b(14)*b(40)+2*b(15)*b(41)+2*b(16)*b(42)-2*b(20)*b(46)-2*b(21)*b(47)-2*b(22)*b(48);
    C(74) = 2*b(14)*b(40)-2*b(16)*b(42)+2*b(17)*b(43)-2*b(19)*b(45)+2*b(20)*b(46)-2*b(22)*b(48);
    C(78) = b(14)*b(41)+b(40)*b(15)+b(17)*b(44)+b(43)*b(18)+b(20)*b(47)+b(46)*b(21);
    C(79) = b(14)*b(42)+b(40)*b(16)+b(17)*b(45)+b(43)*b(19)+b(20)*b(48)+b(46)*b(22);
    C(75) = b(14)*b(43)+b(40)*b(17)+b(15)*b(44)+b(41)*b(18)+b(16)*b(45)+b(42)*b(19);
    C(76) = b(14)*b(46)+b(40)*b(20)+b(15)*b(47)+b(41)*b(21)+b(16)*b(48)+b(42)*b(22);
    C(111) = 2*b(14)*b(53)+2*b(15)*b(54)+2*b(16)*b(55)-2*b(17)*b(56)-2*b(18)*b(57)-2*b(19)*b(58);
    C(112) = 2*b(14)*b(53)+2*b(15)*b(54)+2*b(16)*b(55)-2*b(20)*b(59)-2*b(21)*b(60)-2*b(22)*b(61);
    C(114) = 2*b(14)*b(53)-2*b(16)*b(55)+2*b(17)*b(56)-2*b(19)*b(58)+2*b(20)*b(59)-2*b(22)*b(61);
    C(118) = b(14)*b(54)+b(53)*b(15)+b(17)*b(57)+b(56)*b(18)+b(20)*b(60)+b(59)*b(21);
    C(119) = b(14)*b(55)+b(53)*b(16)+b(17)*b(58)+b(56)*b(19)+b(20)*b(61)+b(59)*b(22);
    C(115) = b(14)*b(56)+b(53)*b(17)+b(15)*b(57)+b(54)*b(18)+b(16)*b(58)+b(55)*b(19);
    C(116) = b(14)*b(59)+b(53)*b(20)+b(15)*b(60)+b(54)*b(21)+b(16)*b(61)+b(55)*b(22);
    C(169) = b(14)*b(68)+b(66)*b(16)+b(17)*b(71)+b(69)*b(19)+b(20)*b(74)+b(72)*b(22);
    C(166) = b(14)*b(72)+b(66)*b(20)+b(15)*b(73)+b(67)*b(21)+b(16)*b(74)+b(68)*b(22);
    C(50) = b(15)*b(29)+b(28)*b(16)+b(18)*b(32)+b(31)*b(19)+b(21)*b(35)+b(34)*b(22);
    C(80) = b(15)*b(42)+b(41)*b(16)+b(18)*b(45)+b(44)*b(19)+b(21)*b(48)+b(47)*b(22);
    C(120) = b(15)*b(55)+b(54)*b(16)+b(18)*b(58)+b(57)*b(19)+b(21)*b(61)+b(60)*b(22);
    C(161) = 2*b(16)*b(68)-2*b(17)*b(69)-2*b(18)*b(70)-2*b(19)*b(71)+2*b(14)*b(66)+2*b(15)*b(67);
    C(47) = b(17)*b(33)+b(30)*b(20)+b(18)*b(34)+b(31)*b(21)+b(19)*b(35)+b(32)*b(22);
    C(77) = b(17)*b(46)+b(43)*b(20)+b(18)*b(47)+b(44)*b(21)+b(19)*b(48)+b(45)*b(22);
    C(117) = b(17)*b(59)+b(56)*b(20)+b(18)*b(60)+b(57)*b(21)+b(19)*b(61)+b(58)*b(22);
    C(167) = b(17)*b(72)+b(69)*b(20)+b(18)*b(73)+b(70)*b(21)+b(19)*b(74)+b(71)*b(22);
    C(162) = -2*b(20)*b(72)-2*b(21)*b(73)-2*b(22)*b(74)+2*b(16)*b(68)+2*b(14)*b(66)+2*b(15)*b(67);
    C(164) = 2*b(20)*b(72)-2*b(22)*b(74)-2*b(16)*b(68)+2*b(17)*b(69)-2*b(19)*b(71)+2*b(14)*b(66);
    C(81) = 2*b(27)*b(40)+2*b(28)*b(41)+2*b(29)*b(42)-2*b(30)*b(43)-2*b(31)*b(44)-2*b(32)*b(45);
    C(82) = 2*b(27)*b(40)+2*b(28)*b(41)+2*b(29)*b(42)-2*b(33)*b(46)-2*b(34)*b(47)-2*b(35)*b(48);
    C(84) = 2*b(27)*b(40)-2*b(29)*b(42)+2*b(30)*b(43)-2*b(32)*b(45)+2*b(33)*b(46)-2*b(35)*b(48);
    C(88) = b(27)*b(41)+b(40)*b(28)+b(30)*b(44)+b(43)*b(31)+b(33)*b(47)+b(46)*b(34);
    C(89) = b(27)*b(42)+b(40)*b(29)+b(30)*b(45)+b(43)*b(32)+b(33)*b(48)+b(46)*b(35);
    C(85) = b(27)*b(43)+b(40)*b(30)+b(28)*b(44)+b(41)*b(31)+b(29)*b(45)+b(42)*b(32);
    C(86) = b(27)*b(46)+b(40)*b(33)+b(28)*b(47)+b(41)*b(34)+b(29)*b(48)+b(42)*b(35);
    C(121) = 2*b(27)*b(53)+2*b(28)*b(54)+2*b(29)*b(55)-2*b(30)*b(56)-2*b(31)*b(57)-2*b(32)*b(58);
    C(122) = 2*b(27)*b(53)+2*b(28)*b(54)+2*b(29)*b(55)-2*b(33)*b(59)-2*b(34)*b(60)-2*b(35)*b(61);
    C(124) = 2*b(27)*b(53)-2*b(29)*b(55)+2*b(30)*b(56)-2*b(32)*b(58)+2*b(33)*b(59)-2*b(35)*b(61);
    C(128) = b(27)*b(54)+b(53)*b(28)+b(30)*b(57)+b(56)*b(31)+b(33)*b(60)+b(59)*b(34);
    C(129) = b(27)*b(55)+b(53)*b(29)+b(30)*b(58)+b(56)*b(32)+b(33)*b(61)+b(59)*b(35);
    C(125) = b(27)*b(56)+b(53)*b(30)+b(28)*b(57)+b(54)*b(31)+b(29)*b(58)+b(55)*b(32);
    C(126) = b(27)*b(59)+b(53)*b(33)+b(28)*b(60)+b(54)*b(34)+b(29)*b(61)+b(55)*b(35);
    C(179) = b(27)*b(68)+b(66)*b(29)+b(30)*b(71)+b(69)*b(32)+b(33)*b(74)+b(72)*b(35);
    C(176) = b(27)*b(72)+b(66)*b(33)+b(28)*b(73)+b(67)*b(34)+b(29)*b(74)+b(68)*b(35);
    C(90) = b(28)*b(42)+b(41)*b(29)+b(31)*b(45)+b(44)*b(32)+b(34)*b(48)+b(47)*b(35);
    C(130) = b(28)*b(55)+b(54)*b(29)+b(31)*b(58)+b(57)*b(32)+b(34)*b(61)+b(60)*b(35);
    C(87) = b(30)*b(46)+b(43)*b(33)+b(31)*b(47)+b(44)*b(34)+b(32)*b(48)+b(45)*b(35);
    C(127) = b(30)*b(59)+b(56)*b(33)+b(31)*b(60)+b(57)*b(34)+b(32)*b(61)+b(58)*b(35);
    C(177) = b(30)*b(72)+b(69)*b(33)+b(31)*b(73)+b(70)*b(34)+b(32)*b(74)+b(71)*b(35);
    C(171) = -2*b(32)*b(71)+2*b(29)*b(68)-2*b(30)*b(69)-2*b(31)*b(70)+2*b(27)*b(66)+2*b(28)*b(67);
    C(174) = -2*b(32)*b(71)+2*b(33)*b(72)-2*b(35)*b(74)-2*b(29)*b(68)+2*b(30)*b(69)+2*b(27)*b(66);
    C(172) = -2*b(33)*b(72)-2*b(34)*b(73)-2*b(35)*b(74)+2*b(29)*b(68)+2*b(27)*b(66)+2*b(28)*b(67);
    C(131) = 2*b(40)*b(53)+2*b(41)*b(54)+2*b(42)*b(55)-2*b(43)*b(56)-2*b(44)*b(57)-2*b(45)*b(58);
    C(132) = 2*b(40)*b(53)+2*b(41)*b(54)+2*b(42)*b(55)-2*b(46)*b(59)-2*b(47)*b(60)-2*b(48)*b(61);
    C(134) = 2*b(40)*b(53)-2*b(42)*b(55)+2*b(43)*b(56)-2*b(45)*b(58)+2*b(46)*b(59)-2*b(48)*b(61);
    C(138) = b(40)*b(54)+b(53)*b(41)+b(43)*b(57)+b(56)*b(44)+b(46)*b(60)+b(59)*b(47);
    C(139) = b(40)*b(55)+b(53)*b(42)+b(43)*b(58)+b(56)*b(45)+b(46)*b(61)+b(59)*b(48);
    C(135) = b(40)*b(56)+b(53)*b(43)+b(41)*b(57)+b(54)*b(44)+b(42)*b(58)+b(55)*b(45);
    C(136) = b(40)*b(59)+b(53)*b(46)+b(41)*b(60)+b(54)*b(47)+b(42)*b(61)+b(55)*b(48);
    C(189) = b(40)*b(68)+b(66)*b(42)+b(43)*b(71)+b(69)*b(45)+b(46)*b(74)+b(72)*b(48);
    C(186) = b(40)*b(72)+b(66)*b(46)+b(41)*b(73)+b(67)*b(47)+b(42)*b(74)+b(68)*b(48);
    C(140) = b(41)*b(55)+b(54)*b(42)+b(44)*b(58)+b(57)*b(45)+b(47)*b(61)+b(60)*b(48);
    C(190) = b(41)*b(68)+b(67)*b(42)+b(44)*b(71)+b(70)*b(45)+b(47)*b(74)+b(73)*b(48);
    C(185) = b(41)*b(70)+b(67)*b(44)+b(42)*b(71)+b(68)*b(45)+b(40)*b(69)+b(66)*b(43);
    C(137) = b(43)*b(59)+b(56)*b(46)+b(44)*b(60)+b(57)*b(47)+b(45)*b(61)+b(58)*b(48);
    C(187) = b(43)*b(72)+b(69)*b(46)+b(44)*b(73)+b(70)*b(47)+b(45)*b(74)+b(71)*b(48);
    C(181) = -2*b(45)*b(71)+2*b(42)*b(68)-2*b(43)*b(69)-2*b(44)*b(70)+2*b(40)*b(66)+2*b(41)*b(67);
    C(184) = -2*b(45)*b(71)+2*b(46)*b(72)-2*b(48)*b(74)-2*b(42)*b(68)+2*b(43)*b(69)+2*b(40)*b(66);
    C(182) = -2*b(46)*b(72)-2*b(47)*b(73)-2*b(48)*b(74)+2*b(42)*b(68)+2*b(40)*b(66)+2*b(41)*b(67);
    C(199) = b(53)*b(68)+b(66)*b(55)+b(56)*b(71)+b(69)*b(58)+b(59)*b(74)+b(72)*b(61);
    C(200) = b(54)*b(68)+b(67)*b(55)+b(57)*b(71)+b(70)*b(58)+b(60)*b(74)+b(73)*b(61);
    C(195) = b(54)*b(70)+b(67)*b(57)+b(55)*b(71)+b(68)*b(58)+b(53)*b(69)+b(66)*b(56);
    C(197) = b(56)*b(72)+b(69)*b(59)+b(57)*b(73)+b(70)*b(60)+b(58)*b(74)+b(71)*b(61);
    C(191) = -2*b(58)*b(71)+2*b(55)*b(68)-2*b(56)*b(69)-2*b(57)*b(70)+2*b(53)*b(66)+2*b(54)*b(67);
    C(194) = -2*b(58)*b(71)+2*b(59)*b(72)-2*b(61)*b(74)-2*b(55)*b(68)+2*b(56)*b(69)+2*b(53)*b(66);
    C(192) = -2*b(59)*b(72)-2*b(60)*b(73)-2*b(61)*b(74)+2*b(55)*b(68)+2*b(53)*b(66)+2*b(54)*b(67);
    C(160) = b(67)*b(3)+b(5)*b(71)+b(70)*b(6)+b(8)*b(74)+b(73)*b(9)+b(2)*b(68);
    C(155) = b(67)*b(5)+b(3)*b(71)+b(68)*b(6)+b(1)*b(69)+b(66)*b(4)+b(2)*b(70);
    C(170) = b(67)*b(16)+b(18)*b(71)+b(70)*b(19)+b(21)*b(74)+b(73)*b(22)+b(15)*b(68);
    C(165) = b(67)*b(18)+b(16)*b(71)+b(68)*b(19)+b(14)*b(69)+b(66)*b(17)+b(15)*b(70);
    C(180) = b(67)*b(29)+b(31)*b(71)+b(70)*b(32)+b(34)*b(74)+b(73)*b(35)+b(28)*b(68);
    C(175) = b(67)*b(31)+b(29)*b(71)+b(68)*b(32)+b(27)*b(69)+b(66)*b(30)+b(28)*b(70);
    C(196) = b(68)*b(61)+b(53)*b(72)+b(66)*b(59)+b(54)*b(73)+b(67)*b(60)+b(55)*b(74);
    C(158) = b(69)*b(5)+b(7)*b(73)+b(72)*b(8)+b(1)*b(67)+b(66)*b(2)+b(4)*b(70);
    C(168) = b(69)*b(18)+b(20)*b(73)+b(72)*b(21)+b(14)*b(67)+b(66)*b(15)+b(17)*b(70);
    C(178) = b(69)*b(31)+b(33)*b(73)+b(72)*b(34)+b(27)*b(67)+b(66)*b(28)+b(30)*b(70);
    C(188) = b(69)*b(44)+b(46)*b(73)+b(72)*b(47)+b(40)*b(67)+b(66)*b(41)+b(43)*b(70);
    C(198) = b(69)*b(57)+b(59)*b(73)+b(72)*b(60)+b(53)*b(67)+b(66)*b(54)+b(56)*b(70);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(v,w,x,y,z)[v^2,w*v,w^2,x*v,x*w,x^2,y*v,y*w,y*x,y^2,z*v,z*w,z*x,y*z,z^2,v,w,x,y,z,1];
    dU = @(v,w,x,y,z)[[2*v,w,0,x,0,0,y,0,0,0,z,0,0,0,0,1,0,0,0,0,0];[0,v,2*w,0,x,0,0,y,0,0,0,z,0,0,0,0,1,0,0,0,0];[0,0,0,v,w,2*x,0,0,y,0,0,0,z,0,0,0,0,1,0,0,0];[0,0,0,0,0,0,v,w,x,2*y,0,0,0,z,0,0,0,0,1,0,0];[0,0,0,0,0,0,0,0,0,0,v,w,x,y,2*z,0,0,0,0,1,0]];

end