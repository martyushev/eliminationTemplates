% Input: coefficient matrix C of size 10x26

% Monomial vector: [g^2*u^2, u^3*g, g^2*u*v, u^2*v*g, g^2*v^2, v^2*u*g, v^3*g, u*g^2, u^2*g, u^3, v*g^2, g*u*v, v*u^2, v^2*g, v^2*u, v^3, g^2, g*u, u^2, g*v, v*u, v^2, g, u, v, 1]

function [g, u, v] = nstd_focal6p(C)

    M = zeros(11,26);

    M(45) = C(11);
    M(56) = C(21);
    M(67) = C(31);
    M(1) = C(41);
    M(78) = C(51);
    M(12) = C(61);
    M(122) = C(71);
    M(133) = C(81);
    M(89) = C(91);
    M(144) = C(101);
    M(155) = C(111);
    M(100) = C(121);
    M(166) = C(131);
    M(111) = C(141);
    M(23) = C(151);
    M(210) = C(161);
    M(221) = C(171);
    M(177) = C(181);
    M(232) = C(191);
    M(188) = C(201);
    M(199) = C(211);
    M(243) = C(221);
    M(254) = C(231);
    M(265) = C(241);
    M(276) = C(251);
    M(35) = C(2);
    M(46) = C(12);
    M(57) = C(22);
    M(68) = C(32);
    M(79) = C(52);
    M(13) = C(62);
    M(123) = C(72);
    M(134) = C(82);
    M(90) = C(92);
    M(145) = C(102);
    M(156) = C(112);
    M(101) = C(122);
    M(167) = C(132);
    M(112) = C(142);
    M(24) = C(152);
    M(211) = C(162);
    M(222) = C(172);
    M(178) = C(182);
    M(233) = C(192);
    M(189) = C(202);
    M(200) = C(212);
    M(244) = C(222);
    M(255) = C(232);
    M(266) = C(242);
    M(277) = C(252);
    M(47) = C(13);
    M(69) = C(33);
    M(80) = C(53);
    M(14) = C(63);
    M(124) = C(73);
    M(135) = C(83);
    M(91) = C(93);
    M(146) = C(103);
    M(157) = C(113);
    M(102) = C(123);
    M(168) = C(133);
    M(113) = C(143);
    M(25) = C(153);
    M(212) = C(163);
    M(223) = C(173);
    M(179) = C(183);
    M(234) = C(193);
    M(190) = C(203);
    M(201) = C(213);
    M(245) = C(223);
    M(256) = C(233);
    M(267) = C(243);
    M(278) = C(253);
    M(48) = C(14);
    M(59) = C(24);
    M(70) = C(34);
    M(4) = C(44);
    M(81) = C(54);
    M(15) = C(64);
    M(125) = C(74);
    M(136) = C(84);
    M(92) = C(94);
    M(147) = C(104);
    M(158) = C(114);
    M(103) = C(124);
    M(169) = C(134);
    M(114) = C(144);
    M(26) = C(154);
    M(213) = C(164);
    M(224) = C(174);
    M(180) = C(184);
    M(235) = C(194);
    M(191) = C(204);
    M(202) = C(214);
    M(246) = C(224);
    M(257) = C(234);
    M(268) = C(244);
    M(279) = C(254);
    M(38) = C(5);
    M(49) = C(15);
    M(60) = C(25);
    M(71) = C(35);
    M(82) = C(55);
    M(16) = C(65);
    M(126) = C(75);
    M(137) = C(85);
    M(93) = C(95);
    M(148) = C(105);
    M(159) = C(115);
    M(104) = C(125);
    M(170) = C(135);
    M(115) = C(145);
    M(27) = C(155);
    M(214) = C(165);
    M(225) = C(175);
    M(181) = C(185);
    M(236) = C(195);
    M(192) = C(205);
    M(203) = C(215);
    M(247) = C(225);
    M(258) = C(235);
    M(269) = C(245);
    M(280) = C(255);
    M(50) = C(16);
    M(72) = C(36);
    M(83) = C(56);
    M(17) = C(66);
    M(127) = C(76);
    M(138) = C(86);
    M(94) = C(96);
    M(149) = C(106);
    M(160) = C(116);
    M(105) = C(126);
    M(171) = C(136);
    M(116) = C(146);
    M(28) = C(156);
    M(215) = C(166);
    M(226) = C(176);
    M(182) = C(186);
    M(237) = C(196);
    M(193) = C(206);
    M(204) = C(216);
    M(248) = C(226);
    M(259) = C(236);
    M(270) = C(246);
    M(281) = C(256);
    M(73) = C(37);
    M(84) = C(57);
    M(18) = C(67);
    M(139) = C(87);
    M(95) = C(97);
    M(150) = C(107);
    M(161) = C(117);
    M(106) = C(127);
    M(172) = C(137);
    M(117) = C(147);
    M(29) = C(157);
    M(227) = C(177);
    M(183) = C(187);
    M(238) = C(197);
    M(194) = C(207);
    M(205) = C(217);
    M(249) = C(227);
    M(260) = C(237);
    M(271) = C(247);
    M(52) = C(18);
    M(74) = C(38);
    M(85) = C(58);
    M(129) = C(78);
    M(140) = C(88);
    M(96) = C(98);
    M(162) = C(118);
    M(107) = C(128);
    M(173) = C(138);
    M(118) = C(148);
    M(30) = C(158);
    M(228) = C(178);
    M(184) = C(188);
    M(239) = C(198);
    M(195) = C(208);
    M(206) = C(218);
    M(250) = C(228);
    M(261) = C(238);
    M(272) = C(248);
    M(141) = C(89);
    M(97) = C(99);
    M(163) = C(119);
    M(108) = C(129);
    M(174) = C(139);
    M(119) = C(149);
    M(31) = C(159);
    M(218) = C(169);
    M(229) = C(179);
    M(185) = C(189);
    M(240) = C(199);
    M(196) = C(209);
    M(207) = C(219);
    M(251) = C(229);
    M(262) = C(239);
    M(273) = C(249);
    M(284) = C(259);
    M([54, 99]) = C(100);
    M([76, 110]) = C(130);
    M([87, 121]) = C(150);
    M([21, 33]) = C(160);
    M([142, 187]) = C(190);
    M([164, 198]) = C(210);
    M([175, 209]) = C(220);
    M([230, 264]) = C(240);
    M([241, 275]) = C(250);
    M([252, 286]) = C(260);

    [L,~,P] = lu(M(:,1:3));
    L = [L [zeros(3,8); eye(8)]];
    M1 = (P'*L)\M;
    M2 = M1(end-7:end,4:11);
    M3 = M1(end-7:end,12:end);

    A = zeros(15);
    A(1:8,:) = -M2\M3;
    A([9, 25, 56, 147, 88, 104, 195]) = 1;

    [V,~] = eig(A);
    sol = V([12, 13, 14],:)./(ones(3,1)*V(15,:));

    if(find(isnan( sol(:) )) > 0)
        g = zeros(1,0);
        u = zeros(1,0);
        v = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )) & sol(1,:) > 0);
        g = sol(1,:);
        u = sol(2,:);
        v = sol(3,:);
    end

end