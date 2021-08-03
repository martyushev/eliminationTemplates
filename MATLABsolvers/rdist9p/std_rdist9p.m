% Input: coefficient matrix C of size 4x52

% Monomial vector: [x*w^2*z^2, y*w^2*z^2, w*x*y*z^2, w*y^2*z^2, y^2*z^2*x, z^2*y^3, z*w^2*x, x^2*z*w, z*w^2*y, w*x*y*z, y*x^2*z, w*y^2*z, z*y^2*x, z*y^3, z^2*w^2, z^2*x*w, z^2*y*w, z^2*y*x, z^2*y^2, w^2*x, w*x^2, x^3, w^2*y, w*y*x, x^2*y, y^2*w, y^2*x, y^3, w^2*z, z*x*w, z*x^2, w*y*z, z*y*x, y^2*z, z^2*w, z^2*x, z^2*y, w^2, w*x, x^2, w*y, y*x, y^2, z*w, x*z, y*z, z^2, w, x, y, z, 1]

function [w, x, y, z] = std_rdist9p(C)

    M = zeros(76,100);

    M([25, 99, 174, 254, 476, 556, 620, 1070, 1154, 1218, 1305, 1384, 1985, 2067, 2138, 2363, 2443, 2526, 3500, 4349, 4416, 4581, 4639, 5097, 5187, 5625]) = C(113);
    M([177, 251, 326, 406, 704, 784, 848, 1222, 1306, 1370, 1457, 1536, 2137, 2219, 2290, 2515, 2595, 2678, 3423, 3652, 4273, 4340, 4429, 4945, 5111, 5549]) = C(125);
    M([481, 631, 706, 862, 1616, 1696, 1760, 1990, 2141, 2897, 2979, 3126, 4348, 4410, 4566, 4647, 5110, 5175, 5628, 5945, 6012, 6177, 6235, 6693, 6783, 7221]) = C(149);
    M([557, 707, 782, 938, 1692, 1836, 1982, 2066, 2130, 2217, 2296, 2909, 2973, 3055, 3124, 3202, 3285, 3355, 3438, 3879, 4033, 4643, 5324, 6251, 6917]) = C(153);
    M([709, 859, 934, 1014, 1844, 1924, 2142, 2293, 3125, 3207, 3278, 3431, 4031, 4272, 4334, 4414, 4958, 5099, 5552, 5869, 5936, 6025, 6541, 6707, 7145]) = C(161);
    M([1165, 1239, 1314, 1394, 1996, 2076, 2362, 2446, 2510, 2597, 2676, 3359, 3430, 3503, 3583, 3666, 4420, 4645, 4957, 5020, 5100, 5189, 5323, 5553, 5643, 6613]) = C(173);
    M([1317, 1391, 1466, 1546, 2148, 2228, 2514, 2598, 2662, 2749, 2828, 3429, 3655, 3735, 3818, 4195, 4344, 4494, 4729, 4792, 4948, 5113, 5247, 5401, 5567, 6385]) = C(181);
    M([2001, 2150, 2908, 2988, 3433, 3891, 4038, 4358, 4431, 4650, 4956, 5094, 5174, 5331, 5566, 5631, 6016, 6241, 6553, 6616, 6696, 6785, 6919, 7149, 7239, 7449]) = C(189);
    M([2077, 2151, 2226, 2306, 2984, 3064, 3128, 3358, 3422, 3885, 3967, 4036, 4193, 4500, 4642, 4875, 5262, 5327, 5704, 5786, 6097, 6253, 6463, 6845, 6935, 7297]) = C(193);
    M([2153, 2302, 3136, 3216, 3434, 4037, 4282, 4355, 4497, 4728, 4942, 5098, 5255, 5414, 5555, 5791, 5940, 6090, 6325, 6388, 6544, 6709, 6843, 6997, 7163, 7373]) = C(197);
    M([2457, 2531, 2606, 2686, 3368, 3502, 3586, 3650, 3737, 3816, 4115, 4656, 4806, 4879, 5023, 5104, 5254, 5329, 5413, 5476, 5556, 5645, 5703, 6389, 6631, 7069]) = C(201);
    M([3442, 3900, 4661, 4966, 5115, 5257, 5334, 5412, 5550, 5630, 5711, 6252, 6402, 6475, 6619, 6700, 6850, 6925, 7009, 7072, 7152, 7241, 7299, 7377, 7467, 7525]) = C(205);
    M([50, 124, 199, 279, 502, 581, 646, 1096, 1180, 1244, 1331, 1410, 2011, 2093, 2164, 2389, 2469, 2552, 3526, 4375, 4442, 4665, 5123, 5213, 5651]) = C(114);
    M([202, 276, 351, 431, 730, 809, 874, 1248, 1332, 1396, 1483, 1562, 2163, 2245, 2316, 2541, 2621, 2704, 3449, 3678, 4299, 4366, 4971, 5137, 5575]) = C(126);
    M([506, 656, 731, 887, 1642, 1721, 1786, 2016, 2167, 2923, 3005, 3152, 4374, 4436, 4592, 4673, 5136, 5201, 5654, 5971, 6038, 6261, 6719, 6809, 7247]) = C(150);
    M([582, 732, 807, 963, 1718, 1862, 2008, 2092, 2156, 2243, 2322, 2999, 3081, 3150, 3228, 3311, 3381, 3464, 3905, 4059, 4669, 5350, 6277, 6943]) = C(154);
    M([734, 884, 959, 1039, 1870, 1949, 2168, 2319, 3151, 3233, 3304, 3457, 4057, 4298, 4360, 4440, 4984, 5125, 5578, 5895, 5962, 6567, 6733, 7171]) = C(162);
    M([1190, 1264, 1339, 1419, 2022, 2101, 2388, 2472, 2536, 2623, 2702, 3385, 3456, 3529, 3609, 3692, 4446, 4671, 4983, 5046, 5126, 5349, 5579, 5669, 6639]) = C(174);
    M([1342, 1416, 1491, 1571, 2174, 2253, 2540, 2624, 2688, 2775, 2854, 3455, 3681, 3761, 3844, 4221, 4370, 4520, 4755, 4818, 4974, 5273, 5427, 5593, 6411]) = C(182);
    M([2026, 2175, 2934, 3013, 3459, 3917, 4064, 4383, 4456, 4676, 4982, 5120, 5200, 5357, 5592, 5657, 6042, 6267, 6579, 6642, 6722, 6945, 7175, 7265, 7475]) = C(190);
    M([2102, 2176, 2251, 2331, 3010, 3089, 3154, 3384, 3448, 3911, 3993, 4062, 4219, 4526, 4668, 4901, 5288, 5353, 5730, 5812, 6123, 6489, 6871, 6961, 7323]) = C(194);
    M([2178, 2327, 3162, 3241, 3460, 4063, 4307, 4380, 4523, 4754, 4968, 5124, 5281, 5440, 5581, 5817, 5966, 6116, 6351, 6414, 6570, 6869, 7023, 7189, 7399]) = C(198);
    M([2482, 2556, 2631, 2711, 3393, 3528, 3612, 3676, 3763, 3842, 4141, 4682, 4832, 4905, 5049, 5130, 5280, 5355, 5439, 5502, 5582, 5729, 6415, 6657, 7095]) = C(202);
    M([3467, 3925, 4686, 4991, 5140, 5283, 5360, 5438, 5576, 5656, 5737, 6278, 6428, 6501, 6645, 6726, 6876, 6951, 7035, 7098, 7178, 7325, 7403, 7493, 7551]) = C(206);
    M([139, 292, 679, 757, 906, 1124, 2413, 2561, 2725, 3481, 3554, 3715, 4404, 4470, 4629, 5006, 5071, 5151, 5374, 5604, 5692, 6664]) = C(175);
    M([215, 368, 755, 833, 982, 1200, 2045, 2190, 2352, 2489, 2637, 2801, 3479, 3630, 3791, 4159, 4241, 4550, 4918, 5300, 5388, 5752]) = C(179);
    M([291, 444, 907, 985, 1058, 1276, 2565, 2713, 2877, 3706, 3867, 4328, 4394, 4477, 4545, 4778, 4843, 4999, 5298, 5452, 5616, 6436]) = C(183);
    M([671, 900, 1819, 1897, 4089, 4620, 5005, 5145, 5225, 5615, 5682, 6000, 6066, 6225, 6602, 6667, 6747, 6970, 7200, 7288, 7500]) = C(191);
    M([747, 976, 1895, 1973, 2036, 2957, 3178, 3340, 3473, 4087, 4549, 4693, 5311, 5378, 5755, 5837, 6146, 6514, 6896, 6984, 7348]) = C(195);
    M([899, 1052, 4468, 4777, 4993, 5149, 5463, 5606, 5924, 5990, 6073, 6141, 6374, 6439, 6595, 6894, 7048, 7212, 7424]) = C(199);
    M([1279, 1432, 2201, 2416, 3553, 3701, 3865, 4402, 4479, 4855, 5012, 5074, 5154, 5237, 5305, 5462, 5527, 5607, 5754, 6440, 6680, 7120]) = C(203);
    M([3189, 4396, 4471, 5228, 5461, 5601, 5681, 5998, 6075, 6451, 6608, 6670, 6750, 6833, 6901, 7058, 7123, 7203, 7350, 7428, 7516, 7576]) = C(207);
    M([74, 1215, 2508]) = C(4);
    M([150, 1291, 2584]) = C(8);
    M([226, 1367, 2660]) = C(12);
    M([302, 1443, 2736]) = C(16);
    M([378, 1519, 2812]) = C(20);
    M([454, 1595, 2888]) = C(24);
    M([530, 2051, 4712]) = C(28);
    M([606, 2127, 3420]) = C(32);
    M([682, 4483, 5168]) = C(36);
    M([758, 2203, 3496]) = C(40);
    M([834, 2279, 4256]) = C(44);
    M([910, 4407, 5016]) = C(48);
    M([986, 2355, 4560]) = C(52);
    M([1062, 4331, 4788]) = C(56);
    M([1138, 2431, 3572]) = C(60);
    M([1214, 2507, 3648]) = C(64);
    M([1290, 2583, 3724]) = C(68);
    M([1366, 2659, 3800]) = C(72);
    M([1442, 2735, 3876]) = C(76);
    M([1670, 2963, 6308]) = C(80);
    M([1746, 3039, 3952]) = C(84);
    M([3115, 4028]) = C(88);
    M([1822, 6079, 6764]) = C(92);
    M([1898, 3191, 4104]) = C(96);
    M([1974, 3267, 5852]) = C(100);
    M([6003, 6612]) = C(104);
    M([3343, 6156]) = C(108);
    M([5927, 6384]) = C(112);
    M([4634, 5243, 5700]) = C(116);
    M([2050, 4711, 5396]) = C(120);
    M([2126, 3419, 4940]) = C(124);
    M([4482, 5167, 5624]) = C(128);
    M([2202, 3495, 5320]) = C(132);
    M([4406, 5015, 5472]) = C(136);
    M([2430, 3571, 5092]) = C(140);
    M([2506, 3647, 4180]) = C(144);
    M([2582, 3723, 4864]) = C(148);
    M([6230, 6839, 7296]) = C(152);
    M([2962, 6307, 6992]) = C(156);
    M([3038, 3951, 6536]) = C(160);
    M([6078, 6763, 7220]) = C(164);
    M([3190, 4103, 6916]) = C(168);
    M([6002, 6611, 7068]) = C(172);
    M([5242, 5699, 6688]) = C(176);
    M([4710, 5395, 5776]) = C(180);
    M([5166, 5623, 6460]) = C(184);
    M([3570, 5091, 5548]) = C(188);
    M([6838, 7295, 7524]) = C(192);
    M([6306, 6991, 7372]) = C(196);
    M([6762, 7219, 7448]) = C(200);
    M([5698, 6687, 7144]) = C(204);
    M([7294, 7523, 7600]) = C(208);

    [L,~,P] = lu(M(:,1:55));
    L = [L [zeros(55,21); eye(21)]];
    M1 = (P'*L)\M;
    M2 = M1(end-20:end,56:76);
    M3 = M1(end-20:end,77:end);

    A = zeros(24);
    A(1:21,:) = -M2\M3;
    A([214, 287, 432]) = 1;

    [V,~] = eig(A);
    sol = V([23, 21, 22, 18],:)./(ones(4,1)*V(24,:));

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