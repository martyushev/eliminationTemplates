function C = coefs_optpose2pt_v2(u,U)

C = zeros(6,21);

C(1) = u(7);
C(13) = u(7);
C(19) = 2 * u(8);
C(25) = 2 * u(9);
C(31) = u(10);
C(37) = 2 * U(3,1) * u(8);
C(43) = 2 * U(2,1) * u(7) + 2 * U(3,1) * u(9);
C(49) = 2 * U(2,1) * u(9) + 2 * U(3,1) * u(10);
C(55) = U(2,1) ^ 2 * u(7) + 2 * U(2,1) * U(3,1) * u(9) + U(3,1) ^ 2 * u(10);
C(61) = 2 * U(2,1) * u(8);
C(67) = 2 * U(2,1) * u(9) - 2 * U(3,1) * u(7);
C(73) = 2 * U(2,1) * u(10) - 2 * U(3,1) * u(9);
C(79) = 2 * U(2,1) ^ 2 * u(9) - 2 * U(2,1) * U(3,1) * u(7) + 2 * U(2,1) * U(3,1) * u(10) - 2 * U(3,1) ^ 2 * u(9);
C(85) = U(2,1) ^ 2 * u(10) - 2 * U(2,1) * U(3,1) * u(9) + U(3,1) ^ 2 * u(7);
C(91) = 2 * u(7) * U(1,1);
C(103) = 2 * u(8) * U(1,1);
C(109) = 2 * U(1,1) * U(3,1) * u(8);
C(115) = 2 * U(1,1) * U(2,1) * u(8);
C(121) = U(1,1) ^ 2 * u(7);
C(2) = u(11);
C(14) = u(11);
C(20) = 2 * u(12);
C(26) = 2 * u(13);
C(32) = u(14);
C(38) = 2 * U(3,2) * u(12);
C(44) = 2 * U(2,2) * u(11) + 2 * U(3,2) * u(13);
C(50) = 2 * U(2,2) * u(13) + 2 * U(3,2) * u(14);
C(56) = U(2,2) ^ 2 * u(11) + 2 * U(2,2) * U(3,2) * u(13) + U(3,2) ^ 2 * u(14);
C(62) = 2 * U(2,2) * u(12);
C(68) = 2 * U(2,2) * u(13) - 2 * U(3,2) * u(11);
C(74) = 2 * U(2,2) * u(14) - 2 * U(3,2) * u(13);
C(80) = 2 * U(2,2) ^ 2 * u(13) - 2 * U(2,2) * U(3,2) * u(11) + 2 * U(2,2) * U(3,2) * u(14) - 2 * U(3,2) ^ 2 * u(13);
C(86) = U(2,2) ^ 2 * u(14) - 2 * U(2,2) * U(3,2) * u(13) + U(3,2) ^ 2 * u(11);
C(92) = 2 * u(11) * U(1,2);
C(104) = 2 * u(12) * U(1,2);
C(110) = 2 * U(1,2) * U(3,2) * u(12);
C(116) = 2 * U(1,2) * U(2,2) * u(12);
C(122) = U(1,2) ^ 2 * u(11);
C(57) = 1;
C(87) = 1;
C(123) = -1;
C(4) = -4 * u(8) * u(12) * (U(3,1) - U(3,2));
C(10) = -4 * U(2,1) * u(7) * u(12) + 4 * U(2,2) * u(8) * u(11) - 4 * U(3,1) * u(8) * u(13) - 4 * U(3,1) * u(9) * u(12) + 4 * U(3,2) * u(8) * u(13) + 4 * U(3,2) * u(9) * u(12);
C(16) = -4 * U(2,1) * u(7) * u(13) + 4 * U(2,2) * u(9) * u(11) - 4 * U(3,1) * u(9) * u(13) + 4 * U(3,2) * u(9) * u(13);
C(22) = -4 * U(2,1) * u(9) * u(12) + 4 * U(2,2) * u(8) * u(13) - 4 * U(3,1) * u(8) * u(14) - 4 * U(3,1) * u(10) * u(12) + 4 * U(3,2) * u(8) * u(14) + 4 * U(3,2) * u(10) * u(12);
C(28) = -4 * U(2,1) * u(7) * u(14) - 4 * U(2,1) * u(9) * u(13) + 4 * U(2,2) * u(9) * u(13) + 4 * U(2,2) * u(10) * u(11) - 4 * U(3,1) * u(9) * u(14) - 4 * U(3,1) * u(10) * u(13) + 4 * U(3,2) * u(9) * u(14) + 4 * U(3,2) * u(10) * u(13);
C(34) = -4 * U(2,1) * u(9) * u(14) + 4 * U(2,2) * u(10) * u(13) - 4 * U(3,1) * u(10) * u(14) + 4 * U(3,2) * u(10) * u(14);
C(40) = -4 * U(2,1) ^ 2 * u(7) * u(12) - 8 * U(2,1) * U(3,1) * u(9) * u(12) + 4 * U(2,1) * U(3,2) * u(9) * u(12) + 4 * U(2,2) ^ 2 * u(8) * u(11) - 4 * U(2,2) * U(3,1) * u(8) * u(13) + 8 * U(2,2) * U(3,2) * u(8) * u(13) - 4 * U(3,1) ^ 2 * u(10) * u(12) - 4 * U(3,1) * U(3,2) * u(8) * u(14) + 4 * U(3,1) * U(3,2) * u(10) * u(12) + 4 * U(3,2) ^ 2 * u(8) * u(14);
C(46) = -4 * U(2,1) ^ 2 * u(7) * u(13) - 4 * U(2,1) * U(2,2) * u(7) * u(13) + 4 * U(2,1) * U(2,2) * u(9) * u(11) - 8 * U(2,1) * U(3,1) * u(9) * u(13) - 4 * U(2,1) * U(3,2) * u(7) * u(14) + 4 * U(2,1) * U(3,2) * u(9) * u(13) + 4 * U(2,2) ^ 2 * u(9) * u(11) - 4 * U(2,2) * U(3,1) * u(9) * u(13) + 4 * U(2,2) * U(3,1) * u(10) * u(11) + 8 * U(2,2) * U(3,2) * u(9) * u(13) - 4 * U(3,1) ^ 2 * u(10) * u(13) - 4 * U(3,1) * U(3,2) * u(9) * u(14) + 4 * U(3,1) * U(3,2) * u(10) * u(13) + 4 * U(3,2) ^ 2 * u(9) * u(14);
C(52) = -4 * U(2,1) ^ 2 * u(7) * u(14) - 8 * U(2,1) * U(3,1) * u(9) * u(14) + 4 * U(2,2) ^ 2 * u(10) * u(11) + 8 * U(2,2) * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * u(10) * u(14) + 4 * U(3,2) ^ 2 * u(10) * u(14);
C(58) = -4 * U(2,1) ^ 2 * U(2,2) * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(7) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(11) - 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(13) + 8 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(13) - 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(14) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(11) - 4 * U(2,2) * U(3,1) ^ 2 * u(10) * u(13) + 8 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(10) * u(14) + 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(14);
C(64) = -4 * U(2,1) ^ 2 * u(9) * u(12) + 4 * U(2,1) * U(3,1) * u(7) * u(12) - 4 * U(2,1) * U(3,1) * u(10) * u(12) + 4 * U(2,1) * U(3,2) * u(10) * u(12) + 4 * U(2,2) ^ 2 * u(8) * u(13) - 4 * U(2,2) * U(3,1) * u(8) * u(14) - 4 * U(2,2) * U(3,2) * u(8) * u(11) + 4 * U(2,2) * U(3,2) * u(8) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(12) + 4 * U(3,1) * U(3,2) * u(8) * u(13) - 4 * U(3,1) * U(3,2) * u(9) * u(12) - 4 * U(3,2) ^ 2 * u(8) * u(13);
C(70) = -4 * U(2,1) ^ 2 * u(9) * u(13) - 4 * U(2,1) * U(2,2) * u(7) * u(14) + 4 * U(2,1) * U(2,2) * u(10) * u(11) + 4 * U(2,1) * U(3,1) * u(7) * u(13) - 4 * U(2,1) * U(3,1) * u(10) * u(13) + 4 * U(2,1) * U(3,2) * u(7) * u(13) + 4 * U(2,1) * U(3,2) * u(10) * u(13) + 4 * U(2,2) ^ 2 * u(9) * u(13) - 4 * U(2,2) * U(3,1) * u(9) * u(11) - 4 * U(2,2) * U(3,1) * u(9) * u(14) - 4 * U(2,2) * U(3,2) * u(9) * u(11) + 4 * U(2,2) * U(3,2) * u(9) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(13) - 4 * U(3,2) ^ 2 * u(9) * u(13);
C(76) = -4 * U(2,1) ^ 2 * u(9) * u(14) - 4 * U(2,1) * U(2,2) * u(9) * u(14) + 4 * U(2,1) * U(2,2) * u(10) * u(13) + 4 * U(2,1) * U(3,1) * u(7) * u(14) - 4 * U(2,1) * U(3,1) * u(10) * u(14) + 4 * U(2,1) * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(3,2) * u(10) * u(14) + 4 * U(2,2) ^ 2 * u(10) * u(13) - 4 * U(2,2) * U(3,1) * u(9) * u(13) - 4 * U(2,2) * U(3,1) * u(10) * u(14) - 4 * U(2,2) * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(14) - 4 * U(3,1) * U(3,2) * u(9) * u(14) + 4 * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(3,2) ^ 2 * u(10) * u(13);
C(82) = -4 * U(2,1) ^ 2 * U(2,2) * u(7) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(13) + 4 * U(2,1) ^ 2 * U(3,2) * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(11) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(13) - 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(14) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(13) - 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(14) + 8 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(14) + 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(14) - 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(14) - 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(11) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(13) - 4 * U(2,2) * U(3,1) ^ 2 * u(10) * u(14) - 8 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(10) * u(13) - 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(14) - 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(13);
C(88) = -4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(14) + 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(13) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(14) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(14) - 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(14) - 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(13) - 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(14) + 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) - 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) - 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(13);
C(94) = -4 * u(8) * u(12) * (U(3,1) - U(3,2)) * (U(1,1) + U(1,2));
C(100) = 4 * U(1,1) * U(2,2) * u(8) * u(11) - 4 * U(1,1) * U(3,1) * u(8) * u(13) + 4 * U(1,1) * U(3,2) * u(8) * u(13) - 4 * U(1,2) * U(2,1) * u(7) * u(12) - 4 * U(1,2) * U(3,1) * u(9) * u(12) + 4 * U(1,2) * U(3,2) * u(9) * u(12);
C(106) = 4 * U(1,1) * U(2,2) * u(8) * u(13) - 4 * U(1,1) * U(3,1) * u(8) * u(14) + 4 * U(1,1) * U(3,2) * u(8) * u(14) - 4 * U(1,2) * U(2,1) * u(9) * u(12) - 4 * U(1,2) * U(3,1) * u(10) * u(12) + 4 * U(1,2) * U(3,2) * u(10) * u(12);
C(112) = 4 * U(1,1) * U(2,2) ^ 2 * u(8) * u(11) - 4 * U(1,1) * U(2,2) * U(3,1) * u(8) * u(13) + 8 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(13) - 4 * U(1,1) * U(3,1) * U(3,2) * u(8) * u(14) + 4 * U(1,1) * U(3,2) ^ 2 * u(8) * u(14) - 4 * U(1,2) * U(2,1) ^ 2 * u(7) * u(12) - 8 * U(1,2) * U(2,1) * U(3,1) * u(9) * u(12) + 4 * U(1,2) * U(2,1) * U(3,2) * u(9) * u(12) - 4 * U(1,2) * U(3,1) ^ 2 * u(10) * u(12) + 4 * U(1,2) * U(3,1) * U(3,2) * u(10) * u(12);
C(118) = 4 * U(1,1) * U(2,2) ^ 2 * u(8) * u(13) - 4 * U(1,1) * U(2,2) * U(3,1) * u(8) * u(14) - 4 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(11) + 4 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(14) + 4 * U(1,1) * U(3,1) * U(3,2) * u(8) * u(13) - 4 * U(1,1) * U(3,2) ^ 2 * u(8) * u(13) - 4 * U(1,2) * U(2,1) ^ 2 * u(9) * u(12) + 4 * U(1,2) * U(2,1) * U(3,1) * u(7) * u(12) - 4 * U(1,2) * U(2,1) * U(3,1) * u(10) * u(12) + 4 * U(1,2) * U(2,1) * U(3,2) * u(10) * u(12) + 4 * U(1,2) * U(3,1) ^ 2 * u(9) * u(12) - 4 * U(1,2) * U(3,1) * U(3,2) * u(9) * u(12);
C(124) = -4 * U(1,1) * U(1,2) * u(8) * u(12) * (U(3,1) - U(3,2));
C(5) = -4 * u(8) * u(12) * (U(2,1) - U(2,2));
C(11) = -4 * U(2,1) * u(8) * u(13) - 4 * U(2,1) * u(9) * u(12) + 4 * U(2,2) * u(8) * u(13) + 4 * U(2,2) * u(9) * u(12) + 4 * U(3,1) * u(7) * u(12) - 4 * U(3,2) * u(8) * u(11);
C(17) = -4 * U(2,1) * u(9) * u(13) + 4 * U(2,2) * u(9) * u(13) + 4 * U(3,1) * u(7) * u(13) - 4 * U(3,2) * u(9) * u(11);
C(23) = -4 * U(2,1) * u(8) * u(14) - 4 * U(2,1) * u(10) * u(12) + 4 * U(2,2) * u(8) * u(14) + 4 * U(2,2) * u(10) * u(12) + 4 * U(3,1) * u(9) * u(12) - 4 * U(3,2) * u(8) * u(13);
C(29) = -4 * U(2,1) * u(9) * u(14) - 4 * U(2,1) * u(10) * u(13) + 4 * U(2,2) * u(9) * u(14) + 4 * U(2,2) * u(10) * u(13) + 4 * U(3,1) * u(7) * u(14) + 4 * U(3,1) * u(9) * u(13) - 4 * U(3,2) * u(9) * u(13) - 4 * U(3,2) * u(10) * u(11);
C(35) = -4 * U(2,1) * u(10) * u(14) + 4 * U(2,2) * u(10) * u(14) + 4 * U(3,1) * u(9) * u(14) - 4 * U(3,2) * u(10) * u(13);
C(41) = -4 * U(2,1) ^ 2 * u(9) * u(12) - 4 * U(2,1) * U(2,2) * u(8) * u(13) + 4 * U(2,1) * U(2,2) * u(9) * u(12) + 4 * U(2,1) * U(3,1) * u(7) * u(12) - 4 * U(2,1) * U(3,1) * u(10) * u(12) - 4 * U(2,1) * U(3,2) * u(8) * u(14) + 4 * U(2,2) ^ 2 * u(8) * u(13) + 4 * U(2,2) * U(3,1) * u(10) * u(12) - 4 * U(2,2) * U(3,2) * u(8) * u(11) + 4 * U(2,2) * U(3,2) * u(8) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(12) - 4 * U(3,2) ^ 2 * u(8) * u(13);
C(47) = -4 * U(2,1) ^ 2 * u(9) * u(13) + 4 * U(2,1) * U(3,1) * u(7) * u(13) - 4 * U(2,1) * U(3,1) * u(10) * u(13) - 4 * U(2,1) * U(3,2) * u(9) * u(11) - 4 * U(2,1) * U(3,2) * u(9) * u(14) + 4 * U(2,2) ^ 2 * u(9) * u(13) + 4 * U(2,2) * U(3,1) * u(7) * u(13) + 4 * U(2,2) * U(3,1) * u(10) * u(13) - 4 * U(2,2) * U(3,2) * u(9) * u(11) + 4 * U(2,2) * U(3,2) * u(9) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(13) + 4 * U(3,1) * U(3,2) * u(7) * u(14) - 4 * U(3,1) * U(3,2) * u(10) * u(11) - 4 * U(3,2) ^ 2 * u(9) * u(13);
C(53) = -4 * U(2,1) ^ 2 * u(9) * u(14) + 4 * U(2,1) * U(2,2) * u(9) * u(14) - 4 * U(2,1) * U(2,2) * u(10) * u(13) + 4 * U(2,1) * U(3,1) * u(7) * u(14) - 4 * U(2,1) * U(3,1) * u(10) * u(14) - 4 * U(2,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,2) * u(10) * u(14) + 4 * U(2,2) ^ 2 * u(10) * u(13) + 4 * U(2,2) * U(3,1) * u(9) * u(13) + 4 * U(2,2) * U(3,1) * u(10) * u(14) - 4 * U(2,2) * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * u(9) * u(14) + 4 * U(3,1) * U(3,2) * u(9) * u(14) - 4 * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(3,2) ^ 2 * u(10) * u(13);
C(59) = -4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(13) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(13) - 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(14) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(14) - 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(13) - 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(14) - 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(13);
C(65) = -4 * U(2,1) ^ 2 * u(10) * u(12) - 4 * U(2,1) * U(2,2) * u(8) * u(14) + 4 * U(2,1) * U(2,2) * u(10) * u(12) + 8 * U(2,1) * U(3,1) * u(9) * u(12) + 4 * U(2,1) * U(3,2) * u(8) * u(13) + 4 * U(2,2) ^ 2 * u(8) * u(14) - 4 * U(2,2) * U(3,1) * u(9) * u(12) - 8 * U(2,2) * U(3,2) * u(8) * u(13) - 4 * U(3,1) ^ 2 * u(7) * u(12) + 4 * U(3,2) ^ 2 * u(8) * u(11);
C(71) = -4 * U(2,1) ^ 2 * u(10) * u(13) - 4 * U(2,1) * U(2,2) * u(9) * u(14) + 4 * U(2,1) * U(2,2) * u(10) * u(13) + 8 * U(2,1) * U(3,1) * u(9) * u(13) + 4 * U(2,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,2) * u(10) * u(11) + 4 * U(2,2) ^ 2 * u(9) * u(14) + 4 * U(2,2) * U(3,1) * u(7) * u(14) - 4 * U(2,2) * U(3,1) * u(9) * u(13) - 8 * U(2,2) * U(3,2) * u(9) * u(13) - 4 * U(3,1) ^ 2 * u(7) * u(13) - 4 * U(3,1) * U(3,2) * u(7) * u(13) + 4 * U(3,1) * U(3,2) * u(9) * u(11) + 4 * U(3,2) ^ 2 * u(9) * u(11);
C(77) = -4 * U(2,1) ^ 2 * u(10) * u(14) + 8 * U(2,1) * U(3,1) * u(9) * u(14) + 4 * U(2,2) ^ 2 * u(10) * u(14) - 8 * U(2,2) * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * u(7) * u(14) + 4 * U(3,2) ^ 2 * u(10) * u(11);
C(83) = -4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) * u(10) * u(13) + 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(10) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(13) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(14) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(14) - 8 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(14) - 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(13) + 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(11) - 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(13) - 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(14) - 4 * U(2,2) * U(3,1) ^ 2 * u(7) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(14) + 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) - 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) - 8 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(7) * u(14) - 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(11);
C(89) = -4 * U(2,1) ^ 2 * U(2,2) * u(10) * u(14) + 4 * U(2,1) ^ 2 * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(14) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(14) - 8 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(13) - 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(11) - 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(14) - 4 * U(2,2) * U(3,1) ^ 2 * u(7) * u(14) + 8 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(13) + 4 * U(3,1) ^ 2 * U(3,2) * u(7) * u(13) - 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(11);
C(95) = -4 * u(8) * u(12) * (U(2,1) - U(2,2)) * (U(1,1) + U(1,2));
C(101) = -4 * U(1,1) * U(2,1) * u(8) * u(13) + 4 * U(1,1) * U(2,2) * u(8) * u(13) - 4 * U(1,1) * U(3,2) * u(8) * u(11) - 4 * U(1,2) * U(2,1) * u(9) * u(12) + 4 * U(1,2) * U(2,2) * u(9) * u(12) + 4 * U(1,2) * U(3,1) * u(7) * u(12);
C(107) = -4 * U(1,1) * U(2,1) * u(8) * u(14) + 4 * U(1,1) * U(2,2) * u(8) * u(14) - 4 * U(1,1) * U(3,2) * u(8) * u(13) - 4 * U(1,2) * U(2,1) * u(10) * u(12) + 4 * U(1,2) * U(2,2) * u(10) * u(12) + 4 * U(1,2) * U(3,1) * u(9) * u(12);
C(113) = -4 * U(1,1) * U(2,1) * U(2,2) * u(8) * u(13) - 4 * U(1,1) * U(2,1) * U(3,2) * u(8) * u(14) + 4 * U(1,1) * U(2,2) ^ 2 * u(8) * u(13) - 4 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(11) + 4 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(14) - 4 * U(1,1) * U(3,2) ^ 2 * u(8) * u(13) - 4 * U(1,2) * U(2,1) ^ 2 * u(9) * u(12) + 4 * U(1,2) * U(2,1) * U(2,2) * u(9) * u(12) + 4 * U(1,2) * U(2,1) * U(3,1) * u(7) * u(12) - 4 * U(1,2) * U(2,1) * U(3,1) * u(10) * u(12) + 4 * U(1,2) * U(2,2) * U(3,1) * u(10) * u(12) + 4 * U(1,2) * U(3,1) ^ 2 * u(9) * u(12);
C(119) = -4 * U(1,1) * U(2,1) * U(2,2) * u(8) * u(14) + 4 * U(1,1) * U(2,1) * U(3,2) * u(8) * u(13) + 4 * U(1,1) * U(2,2) ^ 2 * u(8) * u(14) - 8 * U(1,1) * U(2,2) * U(3,2) * u(8) * u(13) + 4 * U(1,1) * U(3,2) ^ 2 * u(8) * u(11) - 4 * U(1,2) * U(2,1) ^ 2 * u(10) * u(12) + 4 * U(1,2) * U(2,1) * U(2,2) * u(10) * u(12) + 8 * U(1,2) * U(2,1) * U(3,1) * u(9) * u(12) - 4 * U(1,2) * U(2,2) * U(3,1) * u(9) * u(12) - 4 * U(1,2) * U(3,1) ^ 2 * u(7) * u(12);
C(125) = -4 * U(1,1) * U(1,2) * u(8) * u(12) * (U(2,1) - U(2,2));
C(6) = -4 * u(8) * u(12) * (U(2,1) * U(3,2) - U(2,2) * U(3,1));
C(12) = 4 * U(2,1) * U(2,2) * u(7) * u(12) - 4 * U(2,1) * U(2,2) * u(8) * u(11) - 4 * U(2,1) * U(3,2) * u(8) * u(13) - 4 * U(2,1) * U(3,2) * u(9) * u(12) + 4 * U(2,2) * U(3,1) * u(8) * u(13) + 4 * U(2,2) * U(3,1) * u(9) * u(12) + 4 * U(3,1) * U(3,2) * u(7) * u(12) - 4 * U(3,1) * U(3,2) * u(8) * u(11);
C(18) = 4 * U(2,1) * U(2,2) * u(7) * u(13) - 4 * U(2,1) * U(2,2) * u(9) * u(11) - 4 * U(2,1) * U(3,2) * u(7) * u(11) - 4 * U(2,1) * U(3,2) * u(9) * u(13) + 4 * U(2,2) * U(3,1) * u(7) * u(11) + 4 * U(2,2) * U(3,1) * u(9) * u(13) + 4 * U(3,1) * U(3,2) * u(7) * u(13) - 4 * U(3,1) * U(3,2) * u(9) * u(11);
C(24) = -4 * U(2,1) * U(2,2) * u(8) * u(13) + 4 * U(2,1) * U(2,2) * u(9) * u(12) - 4 * U(2,1) * U(3,2) * u(8) * u(14) - 4 * U(2,1) * U(3,2) * u(10) * u(12) + 4 * U(2,2) * U(3,1) * u(8) * u(14) + 4 * U(2,2) * U(3,1) * u(10) * u(12) - 4 * U(3,1) * U(3,2) * u(8) * u(13) + 4 * U(3,1) * U(3,2) * u(9) * u(12);
C(30) = 4 * U(2,1) * U(2,2) * u(7) * u(14) - 4 * U(2,1) * U(2,2) * u(10) * u(11) - 4 * U(2,1) * U(3,2) * u(7) * u(13) - 4 * U(2,1) * U(3,2) * u(9) * u(11) - 4 * U(2,1) * U(3,2) * u(9) * u(14) - 4 * U(2,1) * U(3,2) * u(10) * u(13) + 4 * U(2,2) * U(3,1) * u(7) * u(13) + 4 * U(2,2) * U(3,1) * u(9) * u(11) + 4 * U(2,2) * U(3,1) * u(9) * u(14) + 4 * U(2,2) * U(3,1) * u(10) * u(13) + 4 * U(3,1) * U(3,2) * u(7) * u(14) - 4 * U(3,1) * U(3,2) * u(10) * u(11);
C(36) = 4 * U(2,1) * U(2,2) * u(9) * u(14) - 4 * U(2,1) * U(2,2) * u(10) * u(13) - 4 * U(2,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,2) * u(10) * u(14) + 4 * U(2,2) * U(3,1) * u(9) * u(13) + 4 * U(2,2) * U(3,1) * u(10) * u(14) + 4 * U(3,1) * U(3,2) * u(9) * u(14) - 4 * U(3,1) * U(3,2) * u(10) * u(13);
C(42) = 4 * U(2,1) ^ 2 * U(2,2) * u(7) * u(12) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(12) - 4 * U(2,1) * U(2,2) ^ 2 * u(8) * u(11) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(12) - 8 * U(2,1) * U(2,2) * U(3,2) * u(8) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(12) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(12) - 4 * U(2,1) * U(3,2) ^ 2 * u(8) * u(14) + 4 * U(2,2) ^ 2 * U(3,1) * u(8) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(10) * u(12) - 4 * U(2,2) * U(3,1) * U(3,2) * u(8) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(8) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(12) - 4 * U(3,1) * U(3,2) ^ 2 * u(8) * u(13);
C(48) = 4 * U(2,1) ^ 2 * U(2,2) * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(11) - 4 * U(2,1) ^ 2 * U(3,2) * u(7) * u(11) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * u(7) * u(13) - 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(11) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(11) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(11) - 4 * U(2,1) * U(2,2) * U(3,2) * u(7) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(7) * u(14) - 8 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(13) - 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(11) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(2,1) * U(3,2) ^ 2 * u(7) * u(13) - 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(14) + 4 * U(2,2) ^ 2 * U(3,1) * u(7) * u(11) + 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(11) + 4 * U(2,2) * U(3,1) ^ 2 * u(10) * u(13) + 8 * U(2,2) * U(3,1) * U(3,2) * u(7) * u(13) - 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(10) * u(11) + 4 * U(3,1) * U(3,2) ^ 2 * u(7) * u(14) - 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(13);
C(54) = 4 * U(2,1) ^ 2 * U(2,2) * u(7) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(13) - 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(11) + 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(13) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(14) - 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(13) - 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(11) + 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(14) - 8 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(14) - 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(14) - 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(13) - 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(14) + 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(11) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(13) + 4 * U(2,2) * U(3,1) ^ 2 * u(10) * u(14) + 8 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(14) - 4 * U(3,1) ^ 2 * U(3,2) * u(10) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(14) - 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(13);
C(60) = 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(9) * u(11) - 4 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(7) * u(11) + 4 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(7) * u(14) - 8 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(7) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(9) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(7) * u(11) + 8 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) - 4 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(10) * u(11) + 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(7) * u(13) - 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) + 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) - 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(7) * u(14) - 8 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(9) * u(13) - 4 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(10) * u(14) + 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(9) * u(11) + 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(10) * u(13) + 8 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) - 4 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(10) * u(11) + 4 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(10) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(9) * u(14) - 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(10) * u(13);
C(66) = 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(12) - 4 * U(2,1) ^ 2 * U(3,2) * u(10) * u(12) - 4 * U(2,1) * U(2,2) ^ 2 * u(8) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(12) + 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(12) + 4 * U(2,1) * U(2,2) * U(3,2) * u(8) * u(11) - 4 * U(2,1) * U(2,2) * U(3,2) * u(8) * u(14) + 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(12) + 4 * U(2,1) * U(3,2) ^ 2 * u(8) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(8) * u(14) - 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(12) - 8 * U(2,2) * U(3,1) * U(3,2) * u(8) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(7) * u(12) + 4 * U(3,1) * U(3,2) ^ 2 * u(8) * u(11);
C(72) = 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(2,2) * u(10) * u(11) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(11) - 4 * U(2,1) ^ 2 * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * u(7) * u(14) - 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(13) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(11) + 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(13) - 8 * U(2,1) * U(2,2) * U(3,2) * u(7) * u(13) + 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(11) - 4 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(14) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(11) + 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(11) + 4 * U(2,1) * U(3,2) ^ 2 * u(7) * u(11) + 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(7) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(14) - 4 * U(2,2) * U(3,1) ^ 2 * u(7) * u(11) - 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(13) - 4 * U(2,2) * U(3,1) * U(3,2) * u(7) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(7) * u(14) - 8 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(7) * u(13) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(11) - 4 * U(3,1) * U(3,2) ^ 2 * u(7) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(11);
C(78) = 4 * U(2,1) ^ 2 * U(2,2) * u(9) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) * u(10) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(9) * u(13) - 4 * U(2,1) ^ 2 * U(3,2) * u(10) * u(14) + 4 * U(2,1) * U(2,2) ^ 2 * u(9) * u(14) - 4 * U(2,1) * U(2,2) ^ 2 * u(10) * u(13) - 4 * U(2,1) * U(2,2) * U(3,1) * u(7) * u(14) + 8 * U(2,1) * U(2,2) * U(3,1) * u(9) * u(13) + 4 * U(2,1) * U(2,2) * U(3,1) * u(10) * u(14) - 8 * U(2,1) * U(2,2) * U(3,2) * u(9) * u(13) + 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(11) - 4 * U(2,1) * U(2,2) * U(3,2) * u(10) * u(14) + 4 * U(2,1) * U(3,1) * U(3,2) * u(7) * u(13) + 8 * U(2,1) * U(3,1) * U(3,2) * u(9) * u(14) - 4 * U(2,1) * U(3,1) * U(3,2) * u(10) * u(13) + 4 * U(2,1) * U(3,2) ^ 2 * u(9) * u(11) + 4 * U(2,1) * U(3,2) ^ 2 * u(10) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) + 4 * U(2,2) ^ 2 * U(3,1) * u(10) * u(14) - 4 * U(2,2) * U(3,1) ^ 2 * u(7) * u(13) - 4 * U(2,2) * U(3,1) ^ 2 * u(9) * u(14) - 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) + 4 * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) - 8 * U(2,2) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) * u(7) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) - 4 * U(3,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(3,1) * U(3,2) ^ 2 * u(10) * u(11);
C(84) = 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(7) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(10) * u(11) - 8 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(7) * u(13) - 8 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(10) * u(13) + 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(7) * u(11) - 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(10) * u(14) + 8 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(9) * u(11) + 8 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(9) * u(14) + 8 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(9) * u(11) + 8 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(9) * u(14) - 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(7) * u(11) + 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(10) * u(14) - 8 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(7) * u(13) - 8 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(10) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(7) * u(14) + 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(10) * u(11);
C(90) = 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(9) * u(14) - 4 * U(2,1) ^ 2 * U(2,2) ^ 2 * u(10) * u(13) - 8 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(9) * u(13) + 4 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(10) * u(11) - 4 * U(2,1) ^ 2 * U(2,2) * U(3,2) * u(10) * u(14) + 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(9) * u(11) + 4 * U(2,1) ^ 2 * U(3,2) ^ 2 * u(10) * u(13) - 4 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(7) * u(14) + 8 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(9) * u(13) + 4 * U(2,1) * U(2,2) ^ 2 * U(3,1) * u(10) * u(14) + 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(7) * u(13) - 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(9) * u(11) + 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(9) * u(14) - 8 * U(2,1) * U(2,2) * U(3,1) * U(3,2) * u(10) * u(13) - 4 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(7) * u(11) - 8 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(9) * u(13) + 4 * U(2,1) * U(3,1) * U(3,2) ^ 2 * u(10) * u(11) - 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(7) * u(13) - 4 * U(2,2) ^ 2 * U(3,1) ^ 2 * u(9) * u(14) + 4 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(7) * u(11) - 4 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(7) * u(14) + 8 * U(2,2) * U(3,1) ^ 2 * U(3,2) * u(9) * u(13) + 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(7) * u(13) - 4 * U(3,1) ^ 2 * U(3,2) ^ 2 * u(9) * u(11);
C(96) = -4 * u(8) * u(12) * (U(2,1) * U(3,2) - U(2,2) * U(3,1)) * (U(1,1) + U(1,2));
C(102) = -4 * U(1,1) * U(2,1) * U(2,2) * u(8) * u(11) - 4 * U(1,1) * U(2,1) * U(3,2) * u(8) * u(13) + 4 * U(1,1) * U(2,2) * U(3,1) * u(8) * u(13) - 4 * U(1,1) * U(3,1) * U(3,2) * u(8) * u(11) + 4 * U(1,2) * U(2,1) * U(2,2) * u(7) * u(12) - 4 * U(1,2) * U(2,1) * U(3,2) * u(9) * u(12) + 4 * U(1,2) * U(2,2) * U(3,1) * u(9) * u(12) + 4 * U(1,2) * U(3,1) * U(3,2) * u(7) * u(12);
C(108) = -4 * U(1,1) * U(2,1) * U(2,2) * u(8) * u(13) - 4 * U(1,1) * U(2,1) * U(3,2) * u(8) * u(14) + 4 * U(1,1) * U(2,2) * U(3,1) * u(8) * u(14) - 4 * U(1,1) * U(3,1) * U(3,2) * u(8) * u(13) + 4 * U(1,2) * U(2,1) * U(2,2) * u(9) * u(12) - 4 * U(1,2) * U(2,1) * U(3,2) * u(10) * u(12) + 4 * U(1,2) * U(2,2) * U(3,1) * u(10) * u(12) + 4 * U(1,2) * U(3,1) * U(3,2) * u(9) * u(12);
C(114) = -4 * U(1,1) * U(2,1) * U(2,2) ^ 2 * u(8) * u(11) - 8 * U(1,1) * U(2,1) * U(2,2) * U(3,2) * u(8) * u(13) - 4 * U(1,1) * U(2,1) * U(3,2) ^ 2 * u(8) * u(14) + 4 * U(1,1) * U(2,2) ^ 2 * U(3,1) * u(8) * u(13) - 4 * U(1,1) * U(2,2) * U(3,1) * U(3,2) * u(8) * u(11) + 4 * U(1,1) * U(2,2) * U(3,1) * U(3,2) * u(8) * u(14) - 4 * U(1,1) * U(3,1) * U(3,2) ^ 2 * u(8) * u(13) + 4 * U(1,2) * U(2,1) ^ 2 * U(2,2) * u(7) * u(12) - 4 * U(1,2) * U(2,1) ^ 2 * U(3,2) * u(9) * u(12) + 8 * U(1,2) * U(2,1) * U(2,2) * U(3,1) * u(9) * u(12) + 4 * U(1,2) * U(2,1) * U(3,1) * U(3,2) * u(7) * u(12) - 4 * U(1,2) * U(2,1) * U(3,1) * U(3,2) * u(10) * u(12) + 4 * U(1,2) * U(2,2) * U(3,1) ^ 2 * u(10) * u(12) + 4 * U(1,2) * U(3,1) ^ 2 * U(3,2) * u(9) * u(12);
C(120) = -4 * U(1,1) * U(2,1) * U(2,2) ^ 2 * u(8) * u(13) + 4 * U(1,1) * U(2,1) * U(2,2) * U(3,2) * u(8) * u(11) - 4 * U(1,1) * U(2,1) * U(2,2) * U(3,2) * u(8) * u(14) + 4 * U(1,1) * U(2,1) * U(3,2) ^ 2 * u(8) * u(13) + 4 * U(1,1) * U(2,2) ^ 2 * U(3,1) * u(8) * u(14) - 8 * U(1,1) * U(2,2) * U(3,1) * U(3,2) * u(8) * u(13) + 4 * U(1,1) * U(3,1) * U(3,2) ^ 2 * u(8) * u(11) + 4 * U(1,2) * U(2,1) ^ 2 * U(2,2) * u(9) * u(12) - 4 * U(1,2) * U(2,1) ^ 2 * U(3,2) * u(10) * u(12) - 4 * U(1,2) * U(2,1) * U(2,2) * U(3,1) * u(7) * u(12) + 4 * U(1,2) * U(2,1) * U(2,2) * U(3,1) * u(10) * u(12) + 8 * U(1,2) * U(2,1) * U(3,1) * U(3,2) * u(9) * u(12) - 4 * U(1,2) * U(2,2) * U(3,1) ^ 2 * u(9) * u(12) - 4 * U(1,2) * U(3,1) ^ 2 * U(3,2) * u(7) * u(12);
C(126) = -4 * U(1,1) * U(1,2) * u(8) * u(12) * (U(2,1) * U(3,2) - U(2,2) * U(3,1));

end