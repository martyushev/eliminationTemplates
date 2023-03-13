% Input: coefficient matrix C of size 21x23
% Output: solution matrix S of size 6x22

function S = red_168x190_colpiv_hyb13f_depth_formulation(C)

    M = sparse([1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,13,13,13,13,13,13,13,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,43,43,43,43,44,44,44,44,45,45,45,45,45,45,46,46,46,46,46,46,47,47,47,47,47,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,73,73,73,73,73,74,74,74,74,74,74,74,74,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,100,100,100,101,101,101,101,101,101,101,102,102,102,102,102,102,102,103,103,103,103,103,104,104,104,105,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,109,109,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,112,112,112,112,112,112,112,113,113,113,113,113,113,113,113,113,113,114,114,114,114,114,114,114,114,114,114,114,115,115,115,115,115,115,115,115,115,115,115,116,116,116,116,116,116,116,116,116,116,117,117,117,117,117,117,117,117,117,118,118,118,118,118,118,118,118,118,118,118,119,119,119,119,119,119,119,119,119,119,119,120,120,120,120,120,120,120,120,120,121,121,121,121,121,121,121,121,121,121,122,122,122,122,122,122,122,122,122,123,123,123,123,123,123,123,123,123,123,124,124,124,124,124,124,124,124,125,125,125,125,125,125,125,125,125,125,126,126,126,126,126,126,126,126,126,127,127,127,127,127,127,127,127,127,127,128,128,128,128,128,128,128,128,128,129,129,129,129,129,129,129,130,130,130,130,130,130,130,131,131,131,131,131,131,131,131,132,132,132,132,132,132,133,133,133,133,133,133,133,133,133,134,134,134,134,134,134,134,134,134,134,135,135,135,135,135,135,135,135,135,135,136,136,136,136,136,136,136,136,136,137,137,137,137,137,137,137,137,137,137,138,138,138,138,138,138,138,138,138,138,139,139,139,139,139,139,139,139,139,139,140,140,140,140,140,140,140,140,140,140,141,141,141,141,141,141,141,141,141,141,142,142,142,142,142,142,142,142,142,142,143,143,143,143,143,143,143,143,143,143,144,144,144,144,144,144,144,144,144,144,145,145,145,145,145,145,145,145,145,145,146,146,146,146,146,146,146,146,146,147,147,147,147,147,147,147,147,147,148,148,148,148,148,148,148,148,148,148,149,149,149,149,149,149,149,149,150,150,150,150,150,150,150,150,150,151,151,151,151,151,151,151,151,151,152,152,152,152,152,152,152,152,152,153,153,153,153,153,153,153,153,154,154,154,154,154,154,154,155,155,155,155,155,155,155,156,156,156,156,156,156,157,157,157,157,157,157,157,157,157,158,158,158,158,158,158,158,158,158,159,159,159,159,159,159,159,159,159,160,160,160,160,160,160,160,161,161,161,161,161,161,161,161,161,161,162,162,162,162,162,162,162,162,162,163,163,163,163,163,163,163,163,163,163,164,164,164,164,164,164,164,164,164,165,165,165,165,165,165,165,165,165,166,166,166,166,166,166,166,166,166,167,167,167,167,167,167,167,167,167,168,168,168,168,168,168,168,168,168],[4,8,19,21,23,26,69,71,73,2,4,15,16,19,23,67,69,77,5,9,20,21,25,38,70,71,81,14,19,20,21,66,69,70,71,80,119,128,3,5,17,18,20,25,68,70,83,22,31,72,74,85,88,89,120,122,124,31,32,36,37,74,75,76,79,89,122,24,45,86,88,90,91,120,123,125,46,87,88,89,91,92,120,121,122,123,126,45,47,48,49,90,91,93,94,95,123,52,53,54,99,100,101,102,104,127,55,56,57,103,104,127,60,61,105,106,128,157,176,62,63,106,107,128,158,189,6,28,39,65,109,113,129,162,184,12,28,109,110,111,129,161,162,163,174,178,13,39,113,114,115,129,162,164,165,188,190,50,117,130,131,132,166,168,169,175,179,6,28,39,73,81,119,162,180,28,73,77,78,119,161,162,163,176,181,39,81,83,84,119,162,164,165,182,189,50,124,125,126,166,168,169,177,183,1,7,29,40,82,133,134,137,149,184,29,33,34,82,133,136,137,138,150,174,178,40,41,42,82,134,137,139,140,151,188,190,51,96,97,98,135,141,143,144,152,175,179,1,26,38,80,133,134,137,153,180,15,26,30,80,133,136,137,138,154,176,181,17,27,38,80,134,137,139,140,155,182,189,44,85,86,87,135,141,143,144,156,177,183,4,8,22,23,26,31,72,73,74,2,4,15,23,31,36,74,77,79,9,21,24,38,71,81,88,120,19,21,69,71,80,88,89,119,120,122,128,16,19,30,37,67,69,78,89,105,122,5,17,20,25,45,70,83,90,91,123,14,20,27,46,66,70,84,91,92,107,123,10,11,22,44,52,72,99,22,31,52,53,72,74,85,99,102,124,24,55,86,88,103,104,120,125,127,54,87,88,89,104,120,121,122,126,127,45,47,56,57,90,91,93,94,123,11,52,59,99,55,103,104,127,60,61,76,108,159,176,62,106,121,128,185,189,64,101,108,160,177,6,28,50,65,109,117,130,166,184,12,28,109,110,112,130,161,166,167,174,178,13,39,113,129,131,132,162,168,169,188,190,50,117,118,130,166,171,172,175,179,6,28,50,73,124,166,180,28,73,75,77,124,161,166,167,176,181,39,81,119,125,126,162,168,169,182,189,50,100,124,166,171,172,177,183,1,7,29,51,96,133,135,141,149,184,29,33,35,96,133,136,141,142,150,174,178,40,82,97,98,134,137,143,144,151,188,190,51,58,96,135,141,146,147,152,175,179,1,26,44,85,133,135,141,153,180,15,26,32,85,133,136,141,142,154,176,181,38,80,86,87,134,137,143,144,155,182,189,44,85,135,141,146,147,156,177,183,5,19,20,21,25,38,69,70,71,81,14,16,19,20,66,67,69,70,80,119,3,14,17,18,20,66,68,70,83,22,24,31,44,72,74,88,120,31,36,74,79,85,88,89,120,122,124,45,86,88,89,90,91,120,122,123,125,37,46,87,89,91,92,122,123,126,46,47,48,49,91,92,93,95,123,52,53,55,99,102,103,104,127,54,56,57,104,127,63,105,106,107,128,157,158,189,76,108,121,159,177,185,28,39,109,110,113,129,161,162,184,111,114,115,129,162,163,164,165,188,190,112,130,131,132,166,167,168,169,175,179,28,39,73,77,81,119,161,162,180,78,83,84,119,162,163,164,165,182,189,75,124,125,126,166,167,168,169,177,183,29,33,40,82,133,134,136,137,149,184,34,41,42,82,137,138,139,140,151,188,35,96,97,98,141,142,143,144,152,179,15,26,38,80,133,134,136,137,153,180,17,27,30,80,137,138,139,140,155,182,32,85,86,87,141,142,143,144,156,183,8,21,22,26,71,72,73,88,120,4,15,19,23,31,69,74,77,89,122,5,9,24,25,38,45,81,90,20,21,70,71,80,88,91,119,120,123,128,14,19,30,46,66,69,78,89,92,105,122,3,5,17,25,45,48,83,90,95,18,20,27,49,68,70,84,91,107,123,10,11,24,44,55,103,22,52,72,85,88,99,104,120,124,127,31,32,53,54,74,75,76,89,102,122,24,45,55,56,86,90,103,125,57,87,88,91,104,120,121,123,126,127,11,55,103,52,59,99,100,101,104,127,60,106,108,121,128,176,185,62,63,94,186,189,64,177,187,6,39,50,65,113,117,132,168,184,12,28,109,129,130,131,162,166,169,174,178,13,39,113,114,116,132,164,168,170,188,190,50,117,118,132,168,171,173,175,179,6,39,50,81,125,168,180,28,73,119,124,126,162,166,169,176,181,39,81,83,93,125,164,168,170,182,189,50,125,168,171,173,177,183,1,7,40,51,98,134,135,143,149,184,29,82,96,97,133,137,141,144,150,174,178,40,41,43,98,134,139,143,145,151,188,190,51,58,98,135,143,146,148,152,175,179,1,38,44,86,134,135,143,153,180,26,80,85,87,133,137,141,144,154,176,181,17,38,47,86,134,139,143,145,155,182,189,44,86,135,143,146,148,156,177,183,4,19,20,21,23,26,69,70,71,73,2,14,15,16,19,66,67,69,77,14,18,19,20,66,68,69,70,80,119,22,24,44,45,72,88,90,120,31,74,85,88,89,91,120,122,123,124,32,36,37,46,75,79,89,92,122,45,48,86,88,90,91,95,120,123,125,46,49,87,89,91,92,122,123,126,52,55,56,99,103,104,127,53,54,57,100,102,104,127,61,105,106,107,128,157,158,176,94,108,121,177,185,186,28,39,109,113,114,129,162,164,184,110,111,115,129,161,162,163,165,174,178,116,130,131,132,166,168,169,170,175,179,28,39,73,81,83,119,162,164,180,77,78,84,119,161,162,163,165,176,181,93,124,125,126,166,168,169,170,177,183,29,40,41,82,133,134,137,139,149,184,33,34,42,82,136,137,138,140,150,178,43,96,97,98,141,143,144,145,152,179,17,26,38,80,133,134,137,139,153,180,15,27,30,80,136,137,138,140,154,181,47,85,86,87,141,143,144,145,156,183,4,22,23,26,31,52,72,73,74,99,2,15,31,36,53,74,77,79,102,21,24,38,55,71,81,88,103,120,19,69,80,88,89,104,119,120,122,127,16,30,37,54,67,78,89,122,17,20,45,56,70,83,90,91,123,14,27,46,57,66,84,91,92,123,31,52,53,59,74,85,99,102,124,55,86,88,103,104,120,125,127,54,87,89,104,122,126,127,61,76,101,108,159,160,176,106,121,128,185,187,189,28,50,109,117,118,130,166,171,184,110,112,130,161,166,167,172,174,178,129,131,132,162,168,169,173,188,190,28,50,73,124,166,171,180,75,77,100,124,161,166,167,172,176,181,119,125,126,162,168,169,173,182,189,29,51,58,96,133,135,141,146,149,184,33,35,96,136,141,142,147,150,178,82,97,98,137,143,144,148,151,188,26,44,85,133,135,141,146,153,180,15,32,85,136,141,142,147,154,181,80,86,87,137,143,144,148,155,182],C([253,232,316,295,22,463,85,64,442,253,232,463,316,295,1,85,64,442,295,232,316,253,64,463,85,22,442,316,253,295,232,85,22,64,1,463,442,211,295,232,463,316,253,1,85,22,442,232,253,1,22,463,295,316,64,85,442,232,463,253,316,1,442,211,22,295,64,232,295,463,253,64,316,22,85,442,316,463,232,253,295,85,1,211,22,64,442,232,463,295,316,1,253,442,211,64,22,232,253,316,1,442,211,22,295,64,232,295,316,1,253,22,232,253,85,295,64,316,463,232,295,253,85,22,316,463,1,22,64,232,253,295,316,85,463,211,1,232,253,316,295,22,64,85,442,463,211,1,232,295,316,253,22,64,85,463,442,1,232,253,316,295,22,64,85,442,463,232,253,295,22,64,85,316,463,232,1,22,85,64,253,295,316,442,463,232,1,64,85,22,253,295,316,463,442,232,22,64,85,253,295,316,442,463,1,232,253,295,316,22,64,85,463,442,232,253,316,295,1,22,64,85,463,211,442,232,295,316,253,1,22,64,85,463,442,211,232,253,316,295,1,22,64,85,463,211,442,232,22,64,85,253,295,316,463,442,22,1,85,64,232,253,295,316,463,211,442,64,85,1,22,232,253,295,316,463,442,211,1,22,64,85,232,253,295,316,463,211,442,254,233,359,23,464,380,128,443,149,254,233,464,2,359,380,128,443,149,233,254,359,464,23,443,380,149,254,233,23,2,464,359,380,443,128,149,212,254,233,464,380,23,2,443,359,212,128,233,464,254,2,359,23,443,128,380,149,254,233,464,380,23,2,443,359,149,212,128,233,359,254,464,380,23,149,233,254,359,380,2,23,464,128,149,443,233,359,464,254,128,380,23,443,149,380,464,233,254,359,2,212,23,443,128,233,464,359,380,2,254,443,212,23,233,254,380,23,233,2,254,23,233,254,149,359,380,464,233,254,149,23,380,464,233,149,254,380,464,2,23,128,233,254,359,380,149,464,212,2,233,254,380,359,23,128,149,443,464,212,2,233,254,380,359,23,128,149,464,443,2,233,359,254,23,128,149,443,464,233,254,359,23,149,380,464,233,2,149,23,128,254,359,380,443,464,233,2,23,128,149,254,359,380,464,443,233,149,23,254,359,380,443,464,2,233,254,359,380,23,128,149,464,443,233,254,380,359,2,23,128,149,464,212,443,233,254,380,359,2,23,128,149,464,443,212,233,359,254,2,23,128,149,464,212,443,233,23,128,149,254,359,380,464,443,23,2,149,128,233,254,359,380,464,212,443,2,23,128,149,233,254,359,380,464,443,212,2,23,233,254,359,380,464,212,443,297,276,318,255,66,465,45,87,24,444,318,276,255,297,87,45,24,66,465,444,297,276,465,318,255,45,87,24,444,255,297,276,465,24,45,318,87,255,276,24,45,465,297,318,66,87,444,297,465,255,276,66,318,24,45,87,444,276,318,465,255,297,87,24,66,444,276,465,297,318,255,45,444,66,24,255,276,297,24,45,66,318,87,276,297,318,255,24,297,45,255,87,24,276,318,465,45,255,87,276,465,318,24,66,255,276,297,318,45,87,465,276,297,318,255,24,45,66,87,465,444,276,255,318,297,24,45,66,87,444,465,255,297,24,45,66,87,276,318,465,45,66,87,24,255,276,297,318,465,444,45,24,66,87,255,276,297,318,444,465,255,276,297,318,24,66,45,87,465,444,276,297,318,255,24,45,66,87,465,444,276,255,318,297,24,45,66,87,465,444,45,24,66,87,255,297,276,318,465,444,66,87,45,24,255,276,297,318,465,444,45,24,66,87,255,276,297,318,465,444,237,300,363,468,69,132,447,405,174,237,468,300,6,363,69,132,447,405,174,300,237,363,69,468,405,447,174,300,237,69,6,468,363,405,447,132,174,216,300,237,468,405,69,6,447,363,174,216,132,300,237,468,6,363,405,447,132,174,300,237,468,405,69,6,447,363,216,132,237,363,300,468,405,174,237,363,6,468,300,132,405,69,447,174,237,468,363,405,6,447,216,300,132,69,237,300,363,405,468,69,132,447,405,468,237,300,363,6,216,69,447,132,237,300,69,237,363,6,447,216,300,69,237,300,363,174,69,468,405,237,300,174,405,468,237,468,405,6,69,132,237,300,363,405,174,468,216,6,237,300,363,405,69,132,174,447,468,216,6,237,300,405,363,69,132,174,468,447,6,237,363,300,69,132,174,447,468,237,300,363,69,174,405,468,237,6,69,132,174,300,363,405,447,468,237,6,69,174,132,300,363,405,468,447,237,69,300,363,405,447,468,6,237,300,363,405,69,132,174,468,447,237,300,363,405,6,69,132,174,468,216,447,237,300,405,363,6,69,132,174,468,447,216,237,363,300,6,69,132,174,468,216,447,237,69,132,174,300,363,405,468,447,6,69,132,174,237,300,363,405,468,216,447,69,6,174,132,237,300,363,405,468,447,216,6,69,237,300,363,405,468,216,447,259,322,343,301,28,469,91,112,70,448,259,343,469,322,301,112,91,70,448,322,343,259,301,91,112,28,70,469,448,259,301,469,343,28,322,112,91,259,28,469,301,322,343,70,91,112,448,469,259,322,343,448,28,301,112,70,301,343,469,259,70,322,112,28,91,448,322,343,469,259,301,91,28,70,448,259,301,343,28,70,322,91,259,322,343,448,28,301,70,259,91,301,112,70,322,343,469,112,259,91,469,322,343,28,70,259,301,343,322,91,112,469,259,322,343,301,28,70,91,112,448,469,343,259,322,301,28,70,91,112,448,469,259,301,28,70,112,91,322,343,469,28,91,112,70,259,301,322,343,448,469,112,28,70,91,259,301,322,343,448,469,259,301,343,322,28,70,91,112,469,448,259,322,343,301,28,70,91,112,469,448,343,259,322,301,28,70,91,112,469,448,112,28,70,91,259,301,322,343,469,448,28,112,91,70,259,301,322,343,469,448,112,28,70,91,259,301,322,343,469,448,263,368,32,473,389,431,137,452,158,200,263,473,368,389,431,137,452,158,200,263,368,473,431,32,452,389,200,158,263,32,473,368,389,431,452,137,158,200,263,473,389,431,32,452,368,137,473,263,368,431,32,452,137,389,158,263,473,389,431,32,452,368,158,137,263,368,389,431,32,473,137,158,452,368,473,263,137,389,32,452,158,389,473,263,368,32,452,137,263,158,200,368,389,431,473,263,158,32,389,431,473,32,137,263,368,431,389,158,200,473,263,389,368,32,137,158,200,452,473,263,389,368,32,137,158,200,473,452,263,368,32,158,389,431,473,158,32,200,137,263,368,389,431,452,473,32,137,158,263,368,389,431,473,452,263,368,431,389,32,137,158,200,473,452,263,389,368,32,137,158,200,473,452,263,389,368,32,137,158,200,473,452,32,137,158,263,368,389,431,473,452,32,158,137,263,368,389,431,473,452,32,137,158,263,368,389,431,473,452]),168,190);

    [L,~,P] = lu(M(:,1:135));
    P = P';
    M = [P*L P(:,136:end)]\M(:,136:end);
    M = full(M(136:end,:));

    [L,U,P] = lu(M(:,1:21));
    P = P';
    M = [P*L P(:,22:end)]\M(:,22:end);
    M1 = M(1:21,:);
    M2 = M(22:end,:);

    [Q,R,P] = qr(M2(:,1:end-7));
    A = U\[M1(:,1:end-7)*P M1(:,end-6:end)];
    B = R(:,1:12)\[R(:,13:end) Q'*M2(:,end-6:end)];
    M = [-A(:,end-21:end)+A(:,1:end-22)*B; -B];

    P1 = [35:55 (1:27)*P 28:34];
    P2 = [7,9,11,16,35,36,37,38,39,40,41,42,43,44,45,46,47,22,23,25,27,49,51,52,53,54,55,48,13,14,17,50,26,32];
    T = getT(M,P1(1:end-22),P1(end-21:end),P2);

    [V,~] = eig(T);
    S([1,2,3,4,6],:) = V([16,17,18,19,21],:)./repmat(V(22,:),5,1);
    S(5,:) = V(22,:)./V(20,:);
    
    f = S(6,:);
    b1 = S(5,:);
    a4 = sqrt(S(4,:));
    a3 = S(3,:)./a4;
    a2 = S(2,:)./a4;
    a1 = S(1,:).*a3.*b1;
    S = [a1; a2; a3; a4; b1; f];

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end