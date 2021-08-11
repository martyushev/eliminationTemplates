% Input: coefficient matrix C of size 6x16

% Monomial vector: [x*u, x*v, x*w, y*u, y*v, y*w, z*u, v*z, w*z, u, v, w, x, y, z, 1]

function [u, v, w, x, y, z] = std_r6p_colpiv(C)

    M = zeros(120,140);

    M([2401, 2762, 3125, 3491, 3843, 4206, 4572, 4928, 5294, 5657, 7204, 7567, 7933, 8649, 9015, 9738, 10810, 11296, 12379, 13700]) = C(1);
    M([2521, 2882, 3245, 3611, 3963, 4326, 4692, 5048, 5414, 5777, 7324, 7687, 8053, 8769, 9135, 9858, 10930, 11416, 12499, 13820]) = C(7);
    M([2641, 3002, 3365, 3731, 4083, 4446, 4812, 5168, 5534, 5897, 7444, 7807, 8173, 8889, 9255, 9978, 11050, 11536, 12619, 14900]) = C(13);
    M([11, 372, 734, 1097, 2761, 3122, 3485, 4203, 4566, 5288, 7564, 7927, 8293, 9009, 9375, 10098, 11290, 11776, 12739, 13940]) = C(19);
    M([131, 492, 854, 1217, 2881, 3242, 3605, 4323, 4686, 5408, 7684, 8047, 8413, 9129, 9495, 10218, 11410, 11896, 12859, 14060]) = C(25);
    M([251, 612, 974, 1337, 3001, 3362, 3725, 4443, 4806, 5528, 7804, 8167, 8533, 9249, 9615, 10338, 11530, 12016, 12979, 14180]) = C(31);
    M([371, 732, 1094, 1457, 3841, 4202, 4565, 4923, 5286, 5648, 8644, 9007, 9373, 9729, 10095, 10458, 12370, 12736, 13339, 14300]) = C(37);
    M([491, 852, 1214, 1577, 3961, 4322, 4685, 5043, 5406, 5768, 8764, 9127, 9493, 9849, 10215, 10578, 12490, 12856, 13459, 15380]) = C(43);
    M([611, 972, 1334, 1697, 4081, 4442, 4805, 5163, 5526, 5888, 8884, 9247, 9613, 9969, 10335, 10698, 12610, 12976, 13579, 15500]) = C(49);
    M([7201, 7562, 7925, 8291, 8643, 9006, 9372, 9728, 10094, 10457, 10804, 11287, 11773, 12369, 12735, 13338, 13690, 13936, 14299, 15980]) = C(55);
    M([7321, 7682, 8045, 8411, 8763, 9126, 9492, 9848, 10214, 10577, 10924, 11407, 11893, 12489, 12855, 13458, 13810, 14056, 15379, 16100]) = C(61);
    M([7441, 7802, 8165, 8531, 8883, 9246, 9612, 9968, 10334, 10697, 11044, 11527, 12013, 12609, 12975, 13578, 14176, 14890, 15499, 16220]) = C(67);
    M([6001, 6122, 6245, 6371, 6483, 6606, 6732, 6848, 6974, 7097, 11164, 11647, 12133, 13095, 14409, 14538, 15010, 15136, 15619, 16340]) = C(73);
    M([1811, 1932, 2054, 2177, 6121, 6242, 6365, 6603, 6726, 6968, 11644, 12127, 12253, 13089, 13215, 14658, 15130, 15256, 15739, 16460]) = C(79);
    M([1931, 2052, 2174, 2297, 6481, 6602, 6725, 6843, 6966, 7088, 13087, 13213, 14404, 14529, 14655, 14778, 15610, 15736, 15859, 16580]) = C(85);
    M([11161, 11642, 12125, 12251, 13086, 13212, 14403, 14528, 14654, 14777, 15004, 15127, 15253, 15609, 15735, 15858, 16330, 16456, 16579, 16700]) = C(91);
    M([2421, 2782, 3145, 3511, 3863, 4226, 4592, 4948, 5314, 5677, 7224, 7587, 7953, 8669, 9035, 9758, 10830, 11316, 12399, 13720]) = C(2);
    M([2541, 2902, 3265, 3631, 3983, 4346, 4712, 5068, 5434, 5797, 7344, 7707, 8073, 8789, 9155, 9878, 10950, 11436, 12519, 13840]) = C(8);
    M([2661, 3022, 3385, 3751, 4103, 4466, 4832, 5188, 5554, 5917, 7464, 7827, 8193, 8909, 9275, 9998, 11070, 11556, 12639, 14920]) = C(14);
    M([31, 392, 754, 1117, 2781, 3142, 3505, 4223, 4586, 5308, 7584, 7947, 8313, 9029, 9395, 10118, 11310, 11796, 12759, 13960]) = C(20);
    M([151, 512, 874, 1237, 2901, 3262, 3625, 4343, 4706, 5428, 7704, 8067, 8433, 9149, 9515, 10238, 11430, 11916, 12879, 14080]) = C(26);
    M([271, 632, 994, 1357, 3021, 3382, 3745, 4463, 4826, 5548, 7824, 8187, 8553, 9269, 9635, 10358, 11550, 12036, 12999, 14200]) = C(32);
    M([391, 752, 1114, 1477, 3861, 4222, 4585, 4943, 5306, 5668, 8664, 9027, 9393, 9749, 10115, 10478, 12390, 12756, 13359, 14320]) = C(38);
    M([511, 872, 1234, 1597, 3981, 4342, 4705, 5063, 5426, 5788, 8784, 9147, 9513, 9869, 10235, 10598, 12510, 12876, 13479, 15400]) = C(44);
    M([631, 992, 1354, 1717, 4101, 4462, 4825, 5183, 5546, 5908, 8904, 9267, 9633, 9989, 10355, 10718, 12630, 12996, 13599, 15520]) = C(50);
    M([7221, 7582, 7945, 8311, 8663, 9026, 9392, 9748, 10114, 10477, 10824, 11307, 11793, 12389, 12755, 13358, 13710, 13956, 14319, 16000]) = C(56);
    M([7341, 7702, 8065, 8431, 8783, 9146, 9512, 9868, 10234, 10597, 10944, 11427, 11913, 12509, 12875, 13478, 13830, 14076, 15399, 16120]) = C(62);
    M([7461, 7822, 8185, 8551, 8903, 9266, 9632, 9988, 10354, 10717, 11064, 11547, 12033, 12629, 12995, 13598, 14196, 14910, 15519, 16240]) = C(68);
    M([6021, 6142, 6265, 6391, 6503, 6626, 6752, 6868, 6994, 7117, 11184, 11667, 12153, 13115, 14429, 14558, 15030, 15156, 15639, 16360]) = C(74);
    M([1831, 1952, 2074, 2197, 6141, 6262, 6385, 6623, 6746, 6988, 11664, 12147, 12273, 13109, 13235, 14678, 15150, 15276, 15759, 16480]) = C(80);
    M([1951, 2072, 2194, 2317, 6501, 6622, 6745, 6863, 6986, 7108, 13107, 13233, 14424, 14549, 14675, 14798, 15630, 15756, 15879, 16600]) = C(86);
    M([11181, 11662, 12145, 12271, 13106, 13232, 14423, 14548, 14674, 14797, 15024, 15147, 15273, 15629, 15755, 15878, 16350, 16476, 16599, 16720]) = C(92);
    M([2441, 2802, 3165, 3531, 3883, 4246, 4612, 4968, 5334, 5697, 7244, 7607, 7973, 8689, 9055, 9778, 10850, 11336, 12419, 13740]) = C(3);
    M([2561, 2922, 3285, 3651, 4003, 4366, 4732, 5088, 5454, 5817, 7364, 7727, 8093, 8809, 9175, 9898, 10970, 11456, 12539, 13860]) = C(9);
    M([2681, 3042, 3405, 3771, 4123, 4486, 4852, 5208, 5574, 5937, 7484, 7847, 8213, 8929, 9295, 10018, 11090, 11576, 12659, 14940]) = C(15);
    M([51, 412, 774, 1137, 2801, 3162, 3525, 4243, 4606, 5328, 7604, 7967, 8333, 9049, 9415, 10138, 11330, 11816, 12779, 13980]) = C(21);
    M([171, 532, 894, 1257, 2921, 3282, 3645, 4363, 4726, 5448, 7724, 8087, 8453, 9169, 9535, 10258, 11450, 11936, 12899, 14100]) = C(27);
    M([291, 652, 1014, 1377, 3041, 3402, 3765, 4483, 4846, 5568, 7844, 8207, 8573, 9289, 9655, 10378, 11570, 12056, 13019, 14220]) = C(33);
    M([411, 772, 1134, 1497, 3881, 4242, 4605, 4963, 5326, 5688, 8684, 9047, 9413, 9769, 10135, 10498, 12410, 12776, 13379, 14340]) = C(39);
    M([531, 892, 1254, 1617, 4001, 4362, 4725, 5083, 5446, 5808, 8804, 9167, 9533, 9889, 10255, 10618, 12530, 12896, 13499, 15420]) = C(45);
    M([651, 1012, 1374, 1737, 4121, 4482, 4845, 5203, 5566, 5928, 8924, 9287, 9653, 10009, 10375, 10738, 12650, 13016, 13619, 15540]) = C(51);
    M([7241, 7602, 7965, 8331, 8683, 9046, 9412, 9768, 10134, 10497, 10844, 11327, 11813, 12409, 12775, 13378, 13730, 13976, 14339, 16020]) = C(57);
    M([7361, 7722, 8085, 8451, 8803, 9166, 9532, 9888, 10254, 10617, 10964, 11447, 11933, 12529, 12895, 13498, 13850, 14096, 15419, 16140]) = C(63);
    M([7481, 7842, 8205, 8571, 8923, 9286, 9652, 10008, 10374, 10737, 11084, 11567, 12053, 12649, 13015, 13618, 14216, 14930, 15539, 16260]) = C(69);
    M([6041, 6162, 6285, 6411, 6523, 6646, 6772, 6888, 7014, 7137, 11204, 11687, 12173, 13135, 14449, 14578, 15050, 15176, 15659, 16380]) = C(75);
    M([1851, 1972, 2094, 2217, 6161, 6282, 6405, 6643, 6766, 7008, 11684, 12167, 12293, 13129, 13255, 14698, 15170, 15296, 15779, 16500]) = C(81);
    M([1971, 2092, 2214, 2337, 6521, 6642, 6765, 6883, 7006, 7128, 13127, 13253, 14444, 14569, 14695, 14818, 15650, 15776, 15899, 16620]) = C(87);
    M([11201, 11682, 12165, 12291, 13126, 13252, 14443, 14568, 14694, 14817, 15044, 15167, 15293, 15649, 15775, 15898, 16370, 16496, 16619, 16740]) = C(93);
    M([2461, 2822, 3185, 3551, 3903, 4266, 4632, 4988, 5354, 5717, 7264, 7627, 7993, 8709, 9075, 9798, 10870, 11356, 12439, 13760]) = C(4);
    M([2581, 2942, 3305, 3671, 4023, 4386, 4752, 5108, 5474, 5837, 7384, 7747, 8113, 8829, 9195, 9918, 10990, 11476, 12559, 13880]) = C(10);
    M([2701, 3062, 3425, 3791, 4143, 4506, 4872, 5228, 5594, 5957, 7504, 7867, 8233, 8949, 9315, 10038, 11110, 11596, 12679, 14960]) = C(16);
    M([71, 432, 794, 1157, 2821, 3182, 3545, 4263, 4626, 5348, 7624, 7987, 8353, 9069, 9435, 10158, 11350, 11836, 12799, 14000]) = C(22);
    M([191, 552, 914, 1277, 2941, 3302, 3665, 4383, 4746, 5468, 7744, 8107, 8473, 9189, 9555, 10278, 11470, 11956, 12919, 14120]) = C(28);
    M([311, 672, 1034, 1397, 3061, 3422, 3785, 4503, 4866, 5588, 7864, 8227, 8593, 9309, 9675, 10398, 11590, 12076, 13039, 14240]) = C(34);
    M([431, 792, 1154, 1517, 3901, 4262, 4625, 4983, 5346, 5708, 8704, 9067, 9433, 9789, 10155, 10518, 12430, 12796, 13399, 14360]) = C(40);
    M([551, 912, 1274, 1637, 4021, 4382, 4745, 5103, 5466, 5828, 8824, 9187, 9553, 9909, 10275, 10638, 12550, 12916, 13519, 15440]) = C(46);
    M([671, 1032, 1394, 1757, 4141, 4502, 4865, 5223, 5586, 5948, 8944, 9307, 9673, 10029, 10395, 10758, 12670, 13036, 13639, 15560]) = C(52);
    M([7261, 7622, 7985, 8351, 8703, 9066, 9432, 9788, 10154, 10517, 10864, 11347, 11833, 12429, 12795, 13398, 13750, 13996, 14359, 16040]) = C(58);
    M([7381, 7742, 8105, 8471, 8823, 9186, 9552, 9908, 10274, 10637, 10984, 11467, 11953, 12549, 12915, 13518, 13870, 14116, 15439, 16160]) = C(64);
    M([7501, 7862, 8225, 8591, 8943, 9306, 9672, 10028, 10394, 10757, 11104, 11587, 12073, 12669, 13035, 13638, 14236, 14950, 15559, 16280]) = C(70);
    M([6061, 6182, 6305, 6431, 6543, 6666, 6792, 6908, 7034, 7157, 11224, 11707, 12193, 13155, 14469, 14598, 15070, 15196, 15679, 16400]) = C(76);
    M([1871, 1992, 2114, 2237, 6181, 6302, 6425, 6663, 6786, 7028, 11704, 12187, 12313, 13149, 13275, 14718, 15190, 15316, 15799, 16520]) = C(82);
    M([1991, 2112, 2234, 2357, 6541, 6662, 6785, 6903, 7026, 7148, 13147, 13273, 14464, 14589, 14715, 14838, 15670, 15796, 15919, 16640]) = C(88);
    M([11221, 11702, 12185, 12311, 13146, 13272, 14463, 14588, 14714, 14837, 15064, 15187, 15313, 15669, 15795, 15918, 16390, 16516, 16639, 16760]) = C(94);
    M([2481, 2842, 3205, 3571, 3923, 4286, 4652, 5008, 5374, 5737, 7284, 7647, 8013, 8729, 9095, 9818, 10890, 11376, 12459, 13780]) = C(5);
    M([2601, 2962, 3325, 3691, 4043, 4406, 4772, 5128, 5494, 5857, 7404, 7767, 8133, 8849, 9215, 9938, 11010, 11496, 12579, 13900]) = C(11);
    M([2721, 3082, 3445, 3811, 4163, 4526, 4892, 5248, 5614, 5977, 7524, 7887, 8253, 8969, 9335, 10058, 11130, 11616, 12699, 14980]) = C(17);
    M([91, 452, 814, 1177, 2841, 3202, 3565, 4283, 4646, 5368, 7644, 8007, 8373, 9089, 9455, 10178, 11370, 11856, 12819, 14020]) = C(23);
    M([211, 572, 934, 1297, 2961, 3322, 3685, 4403, 4766, 5488, 7764, 8127, 8493, 9209, 9575, 10298, 11490, 11976, 12939, 14140]) = C(29);
    M([331, 692, 1054, 1417, 3081, 3442, 3805, 4523, 4886, 5608, 7884, 8247, 8613, 9329, 9695, 10418, 11610, 12096, 13059, 14260]) = C(35);
    M([451, 812, 1174, 1537, 3921, 4282, 4645, 5003, 5366, 5728, 8724, 9087, 9453, 9809, 10175, 10538, 12450, 12816, 13419, 14380]) = C(41);
    M([571, 932, 1294, 1657, 4041, 4402, 4765, 5123, 5486, 5848, 8844, 9207, 9573, 9929, 10295, 10658, 12570, 12936, 13539, 15460]) = C(47);
    M([691, 1052, 1414, 1777, 4161, 4522, 4885, 5243, 5606, 5968, 8964, 9327, 9693, 10049, 10415, 10778, 12690, 13056, 13659, 15580]) = C(53);
    M([7281, 7642, 8005, 8371, 8723, 9086, 9452, 9808, 10174, 10537, 10884, 11367, 11853, 12449, 12815, 13418, 13770, 14016, 14379, 16060]) = C(59);
    M([7401, 7762, 8125, 8491, 8843, 9206, 9572, 9928, 10294, 10657, 11004, 11487, 11973, 12569, 12935, 13538, 13890, 14136, 15459, 16180]) = C(65);
    M([7521, 7882, 8245, 8611, 8963, 9326, 9692, 10048, 10414, 10777, 11124, 11607, 12093, 12689, 13055, 13658, 14256, 14970, 15579, 16300]) = C(71);
    M([6081, 6202, 6325, 6451, 6563, 6686, 6812, 6928, 7054, 7177, 11244, 11727, 12213, 13175, 14489, 14618, 15090, 15216, 15699, 16420]) = C(77);
    M([1891, 2012, 2134, 2257, 6201, 6322, 6445, 6683, 6806, 7048, 11724, 12207, 12333, 13169, 13295, 14738, 15210, 15336, 15819, 16540]) = C(83);
    M([2011, 2132, 2254, 2377, 6561, 6682, 6805, 6923, 7046, 7168, 13167, 13293, 14484, 14609, 14735, 14858, 15690, 15816, 15939, 16660]) = C(89);
    M([11241, 11722, 12205, 12331, 13166, 13292, 14483, 14608, 14734, 14857, 15084, 15207, 15333, 15689, 15815, 15938, 16410, 16536, 16659, 16780]) = C(95);
    M([2501, 2862, 3225, 3591, 3943, 4306, 4672, 5028, 5394, 5757, 7304, 7667, 8033, 8749, 9115, 9838, 10910, 11396, 12479, 13800]) = C(6);
    M([2621, 2982, 3345, 3711, 4063, 4426, 4792, 5148, 5514, 5877, 7424, 7787, 8153, 8869, 9235, 9958, 11030, 11516, 12599, 13920]) = C(12);
    M([2741, 3102, 3465, 3831, 4183, 4546, 4912, 5268, 5634, 5997, 7544, 7907, 8273, 8989, 9355, 10078, 11150, 11636, 12719, 15000]) = C(18);
    M([111, 472, 834, 1197, 2861, 3222, 3585, 4303, 4666, 5388, 7664, 8027, 8393, 9109, 9475, 10198, 11390, 11876, 12839, 14040]) = C(24);
    M([231, 592, 954, 1317, 2981, 3342, 3705, 4423, 4786, 5508, 7784, 8147, 8513, 9229, 9595, 10318, 11510, 11996, 12959, 14160]) = C(30);
    M([351, 712, 1074, 1437, 3101, 3462, 3825, 4543, 4906, 5628, 7904, 8267, 8633, 9349, 9715, 10438, 11630, 12116, 13079, 14280]) = C(36);
    M([471, 832, 1194, 1557, 3941, 4302, 4665, 5023, 5386, 5748, 8744, 9107, 9473, 9829, 10195, 10558, 12470, 12836, 13439, 14400]) = C(42);
    M([591, 952, 1314, 1677, 4061, 4422, 4785, 5143, 5506, 5868, 8864, 9227, 9593, 9949, 10315, 10678, 12590, 12956, 13559, 15480]) = C(48);
    M([711, 1072, 1434, 1797, 4181, 4542, 4905, 5263, 5626, 5988, 8984, 9347, 9713, 10069, 10435, 10798, 12710, 13076, 13679, 15600]) = C(54);
    M([7301, 7662, 8025, 8391, 8743, 9106, 9472, 9828, 10194, 10557, 10904, 11387, 11873, 12469, 12835, 13438, 13790, 14036, 14399, 16080]) = C(60);
    M([7421, 7782, 8145, 8511, 8863, 9226, 9592, 9948, 10314, 10677, 11024, 11507, 11993, 12589, 12955, 13558, 13910, 14156, 15479, 16200]) = C(66);
    M([7541, 7902, 8265, 8631, 8983, 9346, 9712, 10068, 10434, 10797, 11144, 11627, 12113, 12709, 13075, 13678, 14276, 14990, 15599, 16320]) = C(72);
    M([6101, 6222, 6345, 6471, 6583, 6706, 6832, 6948, 7074, 7197, 11264, 11747, 12233, 13195, 14509, 14638, 15110, 15236, 15719, 16440]) = C(78);
    M([1911, 2032, 2154, 2277, 6221, 6342, 6465, 6703, 6826, 7068, 11744, 12227, 12353, 13189, 13315, 14758, 15230, 15356, 15839, 16560]) = C(84);
    M([2031, 2152, 2274, 2397, 6581, 6702, 6825, 6943, 7066, 7188, 13187, 13313, 14504, 14629, 14755, 14878, 15710, 15836, 15959, 16680]) = C(90);
    M([11261, 11742, 12225, 12351, 13186, 13312, 14503, 14628, 14754, 14877, 15104, 15227, 15353, 15709, 15835, 15958, 16430, 16556, 16679, 16800]) = C(96);

    [L,~,Pi] = lu(M(:,1:20));
    Pi = Pi';
    M = [Pi*L Pi(:,21:end)]\M(:,21:end);
    M = M(21:end,:);

    [L,UR,Pi] = lu(M(:,1:40));
    Pi = Pi';
    M = [Pi*L Pi(:,41:end)]\M(:,41:end);
    MP = M(1:40,:);
    NP = M(41:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-7));
    A = UR\[MP(:,1:end-7)*Pi MP(:,end-6:end)];
    B = U(:,1:60)\[U(:,61:end) Q'*NP(:,end-6:end)];
    M = [-A(:,end-19:end)+A(:,1:end-20)*B; -B];

    xP = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 41, 42, 43, 31, 44, 45, 46, 32, 47, 48, 49, 33, 34, 53, 54, 55, 56, 57, 58, 36, 37, 62, 63, 64, 71, 72, 75, 76, 77, 84, 35, 38, 39, 40, 73, 74, 78, 82, 85, 86, 101, 90, 102, 95, 96, 105, 106, 107, 111, 117];
    R = 1:40;
    P = 41:120;
    P1 = [P(1:end-7)*Pi P(end-6:end)];
    RP = [R P1(1:end-20)];
    B = P1(end-19:end);
    A = getA(M,RP,B,B-40,xP);

    [V,~] = eig(A);
    sol = V([14, 15, 16, 17, 18, 19],:)./(ones(6,1)*V(20,:));

    if(find(isnan( sol(:) )) > 0)
        u = zeros(1,0);
        v = zeros(1,0);
        w = zeros(1,0);
        x = zeros(1,0);
        y = zeros(1,0);
        z = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )));
        u = sol(1,:);
        v = sol(2,:);
        w = sol(3,:);
        x = sol(4,:);
        y = sol(5,:);
        z = sol(6,:);
    end

end