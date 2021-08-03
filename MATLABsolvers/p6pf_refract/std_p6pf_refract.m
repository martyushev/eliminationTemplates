% Input: coefficient matrix C of size 4x27

% Monomial vector: [z*y*x^2*w, z*y^2*x*w, z^3*x*w, z^3*y*w, y*x^2*w, y*x^3, y^2*x*w, y^3*x, z^2*x*w, z^2*x^2, z^2*y*w, z^2*y*x, z^2*y^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, w*x, x^2, w*y, y*x, y^2, z^2, z, 1]

function [w, x, y, z] = std_p6pf_refract(C)

    M = zeros(126,162);

    M([1, 506, 635, 890, 1893, 2022, 2403, 3035, 4792, 4921, 5302, 6060, 9211]) = C(1);
    M([127, 758, 887, 1016, 2271, 2400, 2655, 3161, 5170, 5299, 5554, 6312, 9463]) = C(5);
    M([253, 1136, 1265, 1520, 3279, 3408, 3789, 4295, 6682, 6811, 7192, 7698, 10597]) = C(9);
    M([379, 1388, 1517, 1646, 3657, 3786, 4041, 4421, 7060, 7189, 7444, 7824, 10723]) = C(13);
    M([505, 1892, 2021, 2402, 4791, 4920, 5301, 6059, 8194, 8323, 8704, 9210, 10975]) = C(17);
    M([631, 2018, 2147, 2528, 4917, 5046, 5427, 6185, 8320, 8449, 8830, 9336, 11101]) = C(21);
    M([757, 2270, 2399, 2654, 5169, 5298, 5553, 6311, 8572, 8701, 8956, 9462, 12739]) = C(25);
    M([1009, 2648, 2777, 2906, 5547, 5676, 5805, 8950, 9079, 12989, 13744, 14124, 15007]) = C(29);
    M([1135, 3278, 3407, 3788, 6681, 6810, 7191, 7697, 9832, 9961, 10342, 10596, 13117]) = C(33);
    M([1261, 3404, 3533, 3914, 6807, 6936, 7317, 9958, 10087, 13367, 14248, 14628, 15385]) = C(37);
    M([1387, 3656, 3785, 4040, 7059, 7188, 7443, 7823, 10210, 10339, 10468, 10722, 12109]) = C(41);
    M([1513, 3782, 3911, 7185, 7314, 10336, 12608, 13239, 13493, 14245, 14500, 14754, 17527]) = C(45);
    M([1639, 4034, 4166, 7437, 7569, 10462, 12605, 13236, 14497, 15887, 16264, 16518, 17779]) = C(49);
    M([1765, 4538, 4670, 7941, 8073, 10840, 12857, 13866, 16139, 16639, 16768, 17148, 19165]) = C(53);
    M([3277, 6680, 6809, 7190, 9831, 9960, 10341, 10595, 11344, 11473, 11854, 13116, 14377]) = C(57);
    M([3403, 6806, 6935, 7316, 9957, 10086, 11470, 11599, 14247, 14627, 15130, 15384, 15637]) = C(61);
    M([3655, 7058, 7187, 7442, 10209, 10338, 10467, 10721, 11722, 11851, 11980, 12108, 12487]) = C(65);
    M([4033, 7436, 7568, 10461, 11974, 13235, 14496, 15253, 16263, 16517, 17398, 17778, 18535]) = C(69);
    M([4537, 7940, 8072, 10839, 12226, 13865, 16638, 16767, 17147, 17899, 18028, 19164, 19543]) = C(73);
    M([6679, 9830, 9959, 10340, 11343, 11472, 11853, 13115, 13615, 13996, 14376, 16897]) = C(77);
    M([6805, 9956, 10085, 11469, 11598, 12355, 13612, 14246, 15129, 15383, 15508, 15636, 15763]) = C(81);
    M([7057, 10208, 10337, 10466, 11721, 11850, 11979, 12107, 12486, 13993, 16012, 17275]) = C(85);
    M([7183, 10334, 11847, 13990, 14243, 14498, 15126, 15255, 15505, 17525, 18154, 18408, 18787]) = C(89);
    M([7435, 10460, 11973, 14495, 15252, 16006, 16262, 17397, 17777, 18151, 18280, 18534, 19669]) = C(93);
    M([10837, 12224, 16383, 17644, 17897, 18026, 18654, 18907, 19413, 19541, 19792, 19920, 20173]) = C(101);
    M([12223, 16382, 17643, 18653, 18906, 19033, 19282, 19412, 19791, 19919, 20044, 20172, 20299]) = C(105);
    M([45, 298, 547, 678, 932, 1158, 1309, 1559, 1934, 2058, 2445, 3052, 3182, 3301, 3428, 3807, 4317, 4817, 4955, 5313, 5962, 6063, 6339, 6714, 6824, 7204, 7720, 9221, 9481, 9865, 9989, 10370, 10614, 11359, 11482, 11862, 13121, 14378]) = C(58);
    M([801, 1432, 2311, 2442, 2696, 3678, 3829, 4079, 5210, 5334, 5595, 6328, 6584, 7081, 7208, 7461, 7845, 8597, 8735, 8967, 9238, 9465, 9741, 10242, 10352, 10480, 10744, 11245, 11755, 11879, 12008, 12126, 12491, 12749, 14002, 16020, 17276]) = C(86);
    M([927, 1558, 2437, 2568, 2822, 3804, 3955, 5336, 5460, 5721, 6454, 7207, 7334, 8723, 8861, 9093, 9364, 9591, 10368, 11881, 12647, 13010, 13257, 13515, 14005, 14151, 14258, 14512, 14776, 14891, 15025, 15155, 15284, 15514, 17544, 18162, 18413, 18788]) = C(90);
    M([1557, 1810, 3823, 3954, 4560, 4709, 7226, 7350, 7963, 8091, 10361, 10872, 12259, 12650, 12901, 13281, 13510, 13886, 14279, 14511, 14656, 14757, 15908, 16161, 16399, 16545, 16652, 16780, 17170, 17537, 17797, 17927, 18056, 18664, 19182, 19422, 19547, 19922]) = C(98);
    M([3825, 4582, 7225, 7356, 7962, 8111, 10376, 10861, 11873, 12258, 13280, 13909, 14280, 14541, 14770, 15161, 15267, 15412, 16417, 16538, 16658, 16785, 17169, 17529, 17659, 17805, 17912, 18040, 18419, 18553, 18683, 18916, 19186, 19442, 19560, 19800, 19925, 20174]) = C(102);
    M([7227, 7984, 10375, 10860, 11888, 12247, 14015, 14286, 14540, 15162, 15297, 15539, 15664, 16416, 16681, 16805, 17542, 17677, 17798, 17918, 18045, 18165, 18411, 18561, 18668, 18797, 18935, 19042, 19185, 19297, 19426, 19564, 19687, 19820, 19938, 20052, 20177, 20300]) = C(106);
    M([208, 461, 836, 967, 1095, 1448, 1598, 1722, 2349, 2473, 2734, 3101, 3216, 3717, 3844, 4097, 4480, 5233, 5370, 5603, 6353, 6628, 7129, 7240, 7494, 7883, 9511, 9771, 10280, 10404, 10533, 10778, 11775, 11898, 12026, 12151, 12526]) = C(67);
    M([586, 1217, 1970, 2101, 2481, 3338, 3488, 3864, 4869, 4993, 5380, 5999, 6114, 6741, 6868, 7247, 7756, 8257, 8394, 8753, 9251, 9526, 9901, 10012, 10392, 10655, 11023, 11414, 11538, 11919, 12795, 13172, 13662, 14042, 14419, 16936]) = C(79);
    M([964, 1595, 2474, 2605, 2859, 3842, 3992, 5373, 5497, 5758, 6251, 6492, 7245, 7372, 8761, 8898, 9131, 9629, 10405, 11918, 12684, 13295, 13552, 14043, 14188, 14296, 14550, 14813, 14929, 15063, 15192, 15321, 15552, 17582, 18200, 18451, 18826]) = C(91);
    M([1594, 1847, 3860, 3991, 4598, 4746, 7263, 7387, 8001, 8129, 10399, 10909, 12296, 12687, 12938, 13318, 13433, 13548, 13924, 14316, 14549, 14795, 16198, 16437, 16582, 16690, 16818, 17207, 17575, 17835, 17964, 18093, 18702, 19220, 19460, 19585, 19960]) = C(99);
    M([3862, 4619, 7262, 7393, 8000, 8148, 10413, 10899, 11911, 12295, 13317, 13946, 14317, 14578, 14693, 14808, 15198, 15305, 16454, 16696, 16823, 17206, 17567, 17697, 17842, 17950, 18078, 18457, 18591, 18720, 18954, 19223, 19479, 19598, 19838, 19963, 20212]) = C(103);
    M([7264, 8021, 10412, 10898, 11925, 12285, 14053, 14323, 14577, 15199, 15334, 15449, 15576, 16453, 16718, 16842, 17580, 17714, 17956, 18083, 18203, 18449, 18598, 18706, 18835, 18972, 19080, 19222, 19335, 19464, 19601, 19725, 19857, 19976, 20090, 20215, 20338]) = C(107);
    M([750, 1381, 2134, 2265, 2645, 3502, 3652, 4028, 5033, 5157, 5544, 6152, 6279, 6905, 7032, 7411, 8422, 8558, 8916, 9307, 9414, 10067, 10175, 11060, 11187, 11580, 11704, 12439, 13466, 13702, 14335, 14727, 14976, 15235, 15479, 15591, 15716, 15839]) = C(84);
    M([1002, 1633, 2512, 2643, 2897, 3880, 4030, 5411, 5535, 5796, 6404, 6531, 7283, 7410, 8800, 8936, 9168, 9559, 9666, 10445, 11958, 12722, 12824, 13333, 13592, 14080, 14333, 14587, 14853, 14967, 15102, 15232, 15361, 15589, 17621, 18237, 18488, 18863]) = C(92);
    M([1128, 1759, 2764, 2895, 3023, 4132, 4280, 5663, 5787, 5922, 6656, 7535, 7663, 9052, 9188, 9811, 10571, 11312, 12084, 12724, 13083, 13332, 13830, 14202, 14585, 15093, 15358, 15986, 16096, 16351, 16617, 17118, 17503, 17873, 18235, 18363, 18614, 19745]) = C(96);
    M([1632, 1885, 3898, 4029, 4636, 4784, 7301, 7425, 7916, 8039, 8167, 10438, 10819, 10949, 12194, 12336, 12725, 12976, 13356, 13587, 13962, 14354, 14586, 14832, 16238, 16474, 16727, 16855, 17247, 17613, 17874, 18004, 18133, 18739, 19259, 19497, 19622, 19997]) = C(100);
    M([3900, 4657, 7300, 7431, 8038, 8186, 10451, 10814, 10937, 11950, 12205, 12335, 12572, 13355, 13984, 14355, 14616, 14847, 15236, 15342, 16494, 16734, 16861, 17246, 17604, 17734, 17987, 18115, 18495, 18630, 18760, 18991, 19263, 19519, 19637, 19875, 20000, 20249]) = C(104);
    M([7302, 8059, 10450, 10936, 11963, 12200, 12323, 12583, 14092, 14361, 14615, 15237, 15372, 15614, 16493, 16756, 16880, 17360, 17619, 17754, 17994, 18121, 18240, 18486, 18743, 18873, 19012, 19117, 19262, 19372, 19501, 19641, 19764, 19897, 20015, 20127, 20252, 20375]) = C(108);

    [L,~,P] = lu(M(:,1:100));
    L = [L [zeros(100,26); eye(26)]];
    M1 = (P'*L)\M;
    M2 = M1(end-25:end,101:126);
    M3 = M1(end-25:end,127:end);

    A = zeros(36);
    A(1:26,:) = -M2\M3;
    A([243, 316, 497, 606, 679, 752, 825, 862, 899, 936]) = 1;

    [V,~] = eig(A);
    sol = V([28, 26, 34, 35],:)./(ones(4,1)*V(36,:));

    if(find(isnan( sol(:) )) > 0)
        w = zeros(1,0);
        x = zeros(1,0);
        y = zeros(1,0);
        z = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )));
        w = sol(1,:);
        x = sol(2,:);
        y = sol(3,:);
        z = sol(4,:);
    end

end