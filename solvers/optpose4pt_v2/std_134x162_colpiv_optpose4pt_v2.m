% Input: coefficient matrix C of size 5x19

function S = std_134x162_colpiv_optpose4pt_v2(C)

    i_dx = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,25,25,25,26,26,26,27,27,27,28,28,28,29,29,29,30,30,30,31,31,31,32,32,32,33,33,33,34,34,34,35,35,35,36,36,36,37,37,37,38,38,38,39,39,39,40,40,40,41,41,41,42,42,42,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,125,126,126,126,126,126,126,126,126,126,126,126,126,126,126,126,126,126,126,126,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,127,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,129,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,130,131,131,131,131,131,131,131,131,131,131,131,131,131,131,131,131,131,131,131,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,132,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,134,134,134,134,134,134,134,134,134,134,134,134,134,134,134,134,134,134,134,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,135,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,137,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,138,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,139,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,143,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,144,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,145,146,146,146,146,146,146,146,146,146,146,146,146,146,146,146,146,146,146,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,148,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,149,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,151,151,151,151,151,151,151,151,151,151,151,151,151,151,151,151,151,151,151,152,152,152,152,152,152,152,152,152,152,152,152,152,152,152,152,152,152,152,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,155,155,155,155,155,155,155,155,155,155,155,155,155,155,155,155,155,155,155,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,156,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,157,158,158,158,158,158,158,158,158,158,158,158,158,158,158,158,158,158,158,158,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,160,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,161,162,162,162,162,162,162,162,162,162,162,162,162,162,162,162,162,162,162,162,163,163,163,163,163,163,163,163,163,163,163,163,163,163,163,163,163,163,163,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,164,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,165,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,167,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,169,169,169,169,169,169,169,169,169,169,169,169,169,169,169,169,169,169,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,170,171,171,171,171,171,171,171,171,171,171,171,171,171,171,171,171,171,171,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,174,174,174,174,174,174,174,174,174,174,174,174,174,174,174,174,174,174,174,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,176,176,176,176,176,176,176,176,176,176,176,176,176,176,176,176,176,176,177,177,177,177,177,177,177,177,177,177,177,177,177,177,177,177,177,177];
    j_dx = [43,199,205,40,127,202,42,129,204,41,128,203,38,125,200,39,126,201,25,156,187,34,84,196,22,68,128,21,67,127,30,161,192,36,86,198,27,158,189,35,85,197,10,116,177,19,65,125,33,83,195,31,162,193,28,159,190,32,163,194,2,103,164,17,123,184,14,120,181,9,113,174,4,105,166,8,111,172,11,117,178,5,106,167,26,157,188,24,155,186,37,87,199,23,69,129,18,124,185,16,122,183,13,119,180,7,110,171,1,62,88,29,160,191,20,66,126,12,118,179,3,104,165,15,121,182,6,108,169,43,186,188,189,190,191,192,193,194,195,196,197,198,199,200,202,203,204,205,40,90,127,166,168,169,170,174,175,176,180,181,182,185,189,191,194,197,202,42,125,126,127,128,129,177,179,180,181,182,183,184,185,195,197,198,199,204,38,39,40,41,42,43,128,171,173,174,175,176,183,184,185,192,194,198,203,38,88,125,165,166,167,169,171,172,174,177,178,180,183,186,189,192,195,200,39,89,126,164,167,168,170,172,173,175,178,179,181,184,187,190,193,196,201,25,70,130,131,133,135,136,138,142,143,145,150,156,164,167,172,178,187,34,81,84,126,142,145,146,148,150,151,153,156,157,159,162,178,181,184,196,19,20,21,22,23,37,68,86,110,112,113,114,115,122,123,124,128,161,163,21,64,67,85,105,107,108,109,113,114,115,119,120,121,124,127,158,160,163,24,25,27,30,33,38,77,136,137,138,140,149,150,152,161,171,174,183,192,33,34,35,36,37,42,86,128,149,151,152,153,154,161,162,163,183,185,198,27,72,74,131,132,133,137,138,140,144,145,147,152,158,166,169,174,180,189,35,82,85,127,144,146,147,148,152,153,154,158,159,160,163,180,182,185,197,19,62,65,83,104,105,106,108,110,111,113,116,117,119,122,125,155,158,161,33,80,83,125,143,144,145,147,149,150,152,155,156,158,161,177,180,183,195,25,26,28,31,34,39,78,135,138,139,141,150,151,153,162,172,175,184,193,28,73,75,130,133,134,138,139,141,145,146,148,153,159,167,170,175,181,190,27,28,29,32,35,40,79,137,139,140,141,152,153,154,163,174,176,185,194,11,12,14,17,20,34,60,96,99,100,102,111,112,114,123,150,153,162,184,14,55,57,91,94,95,99,100,102,106,107,109,114,120,145,148,153,159,181,4,5,6,9,13,27,46,48,49,50,51,98,99,101,113,137,140,152,174,2,3,5,8,11,25,45,47,48,50,96,97,99,111,135,138,150,172,11,52,91,92,94,96,97,99,103,104,106,111,117,142,145,150,156,178,26,71,73,78,81,131,134,136,139,143,146,151,157,165,168,173,179,188,37,83,84,85,86,87,125,127,128,129,155,157,158,159,160,161,162,163,199,23,65,66,67,68,69,83,85,86,87,116,118,119,120,121,122,123,124,129,13,14,15,18,21,35,61,98,100,101,102,113,114,115,124,152,154,163,185,10,11,13,16,19,33,59,97,98,99,101,110,111,113,122,149,152,161,183,13,54,56,92,93,94,98,99,101,105,106,108,113,119,144,147,152,158,180,1,2,4,7,10,24,44,46,47,49,59,77,96,98,110,137,149,171,29,74,75,76,79,82,90,132,134,140,141,147,148,154,160,169,176,182,191,20,63,66,84,103,106,107,109,111,112,114,117,118,120,123,126,156,159,162,12,53,55,60,63,92,95,97,100,104,107,112,118,143,146,151,157,179,15,56,57,58,61,64,82,93,95,101,102,108,109,115,121,147,154,160,182,43,186,188,189,190,191,192,193,194,195,196,197,198,199,200,202,203,204,205,40,90,127,166,168,169,170,174,175,176,180,181,182,185,189,191,194,197,202,42,125,126,127,128,129,177,179,180,181,182,183,184,185,195,197,198,199,204,38,39,40,41,42,43,128,171,173,174,175,176,183,184,185,192,194,198,203,38,88,125,165,166,167,169,171,172,174,177,178,180,183,186,189,192,195,200,39,89,126,164,167,168,170,172,173,175,178,179,181,184,187,190,193,196,201,25,70,130,131,133,135,136,138,142,143,145,150,156,164,167,172,178,187,34,81,84,126,142,145,146,148,150,151,153,156,157,159,162,178,181,184,196,19,20,21,22,23,37,68,86,110,112,113,114,115,122,123,124,128,161,163,21,64,67,85,105,107,108,109,113,114,115,119,120,121,124,127,158,160,163,24,25,27,30,33,38,77,136,137,138,140,149,150,152,161,171,174,183,192,33,34,35,36,37,42,86,128,149,151,152,153,154,161,162,163,183,185,198,27,72,74,131,132,133,137,138,140,144,145,147,152,158,166,169,174,180,189,35,82,85,127,144,146,147,148,152,153,154,158,159,160,163,180,182,185,197,19,62,65,83,104,105,106,108,110,111,113,116,117,119,122,125,155,158,161,33,80,83,125,143,144,145,147,149,150,152,155,156,158,161,177,180,183,195,25,26,28,31,34,39,78,135,138,139,141,150,151,153,162,172,175,184,193,28,73,75,130,133,134,138,139,141,145,146,148,153,159,167,170,175,181,190,27,28,29,32,35,40,79,137,139,140,141,152,153,154,163,174,176,185,194,11,12,14,17,20,34,60,96,99,100,102,111,112,114,123,150,153,162,184,14,55,57,91,94,95,99,100,102,106,107,109,114,120,145,148,153,159,181,4,5,6,9,13,27,46,48,49,50,51,98,99,101,113,137,140,152,174,2,3,5,8,11,25,45,47,48,50,96,97,99,111,135,138,150,172,11,52,91,92,94,96,97,99,103,104,106,111,117,142,145,150,156,178,26,71,73,78,81,131,134,136,139,143,146,151,157,165,168,173,179,188,37,83,84,85,86,87,125,127,128,129,155,157,158,159,160,161,162,163,199,23,65,66,67,68,69,83,85,86,87,116,118,119,120,121,122,123,124,129,13,14,15,18,21,35,61,98,100,101,102,113,114,115,124,152,154,163,185,10,11,13,16,19,33,59,97,98,99,101,110,111,113,122,149,152,161,183,13,54,56,92,93,94,98,99,101,105,106,108,113,119,144,147,152,158,180,1,2,4,7,10,24,44,46,47,49,59,77,96,98,110,137,149,171,29,74,75,76,79,82,90,132,134,140,141,147,148,154,160,169,176,182,191,20,63,66,84,103,106,107,109,111,112,114,117,118,120,123,126,156,159,162,12,53,55,60,63,92,95,97,100,104,107,112,118,143,146,151,157,179,15,56,57,58,61,64,82,93,95,101,102,108,109,115,121,147,154,160,182,43,186,188,189,190,191,192,193,194,195,196,197,198,199,200,202,203,204,205,40,90,127,166,168,169,170,174,175,176,180,181,182,185,189,191,194,197,202,42,125,126,127,128,129,177,179,180,181,182,183,184,185,195,197,198,199,204,38,39,40,41,42,43,128,171,173,174,175,176,183,184,185,192,194,198,203,38,88,125,165,166,167,169,171,172,174,177,178,180,183,186,189,192,195,200,39,89,126,164,167,168,170,172,173,175,178,179,181,184,187,190,193,196,201,25,70,130,131,133,135,136,138,142,143,145,150,156,164,167,172,178,187,34,81,84,126,142,145,146,148,150,151,153,156,157,159,162,178,181,184,196,19,20,21,22,23,37,68,86,110,112,113,114,115,122,123,124,128,161,163,21,64,67,85,105,107,108,109,113,114,115,119,120,121,124,127,158,160,163,24,25,27,30,33,38,77,136,137,138,140,149,150,152,161,171,174,183,192,33,34,35,36,37,42,86,128,149,151,152,153,154,161,162,163,183,185,198,27,72,74,131,132,133,137,138,140,144,145,147,152,158,166,169,174,180,189,35,82,85,127,144,146,147,148,152,153,154,158,159,160,163,180,182,185,197,19,62,65,83,104,105,106,108,110,111,113,116,117,119,122,125,155,158,161,33,80,83,125,143,144,145,147,149,150,152,155,156,158,161,177,180,183,195,25,26,28,31,34,39,78,135,138,139,141,150,151,153,162,172,175,184,193,28,73,75,130,133,134,138,139,141,145,146,148,153,159,167,170,175,181,190,27,28,29,32,35,40,79,137,139,140,141,152,153,154,163,174,176,185,194,11,12,14,17,20,34,60,96,99,100,102,111,112,114,123,150,153,162,184,14,55,57,91,94,95,99,100,102,106,107,109,114,120,145,148,153,159,181,4,5,6,9,13,27,46,48,49,50,51,98,99,101,113,137,140,152,174,2,3,5,8,11,25,45,47,48,50,96,97,99,111,135,138,150,172,11,52,91,92,94,96,97,99,103,104,106,111,117,142,145,150,156,178,26,71,73,78,81,131,134,136,139,143,146,151,157,165,168,173,179,188,37,83,84,85,86,87,125,127,128,129,155,157,158,159,160,161,162,163,199,23,65,66,67,68,69,83,85,86,87,116,118,119,120,121,122,123,124,129,13,14,15,18,21,35,61,98,100,101,102,113,114,115,124,152,154,163,185,10,11,13,16,19,33,59,97,98,99,101,110,111,113,122,149,152,161,183,13,54,56,92,93,94,98,99,101,105,106,108,113,119,144,147,152,158,180,1,2,4,7,10,24,44,46,47,49,59,77,96,98,110,137,149,171,20,63,66,84,103,106,107,109,111,112,114,117,118,120,123,126,156,159,162,12,53,55,60,63,92,95,97,100,104,107,112,118,143,146,151,157,179,43,186,188,189,190,191,192,193,194,195,196,197,198,199,200,202,203,204,205,40,90,127,166,168,169,170,174,175,176,180,181,182,185,189,191,194,197,202,42,125,126,127,128,129,177,179,180,181,182,183,184,185,195,197,198,199,204,38,39,40,41,42,43,128,171,173,174,175,176,183,184,185,192,194,198,203,38,88,125,165,166,167,169,171,172,174,177,178,180,183,186,189,192,195,200,39,89,126,164,167,168,170,172,173,175,178,179,181,184,187,190,193,196,201,25,70,130,131,133,135,136,138,142,143,145,150,156,164,167,172,178,187,34,81,84,126,142,145,146,148,150,151,153,156,157,159,162,178,181,184,196,19,20,21,22,23,37,68,86,110,112,113,114,115,122,123,124,128,161,163,21,64,67,85,105,107,108,109,113,114,115,119,120,121,124,127,158,160,163,24,25,27,30,33,38,77,136,137,138,140,149,150,152,161,171,174,183,192,33,34,35,36,37,42,86,128,149,151,152,153,154,161,162,163,183,185,198,27,72,74,131,132,133,137,138,140,144,145,147,152,158,166,169,174,180,189,35,82,85,127,144,146,147,148,152,153,154,158,159,160,163,180,182,185,197,19,62,65,83,104,105,106,108,110,111,113,116,117,119,122,125,155,158,161,33,80,83,125,143,144,145,147,149,150,152,155,156,158,161,177,180,183,195,25,26,28,31,34,39,78,135,138,139,141,150,151,153,162,172,175,184,193,28,73,75,130,133,134,138,139,141,145,146,148,153,159,167,170,175,181,190,27,28,29,32,35,40,79,137,139,140,141,152,153,154,163,174,176,185,194,11,12,14,17,20,34,60,96,99,100,102,111,112,114,123,150,153,162,184,14,55,57,91,94,95,99,100,102,106,107,109,114,120,145,148,153,159,181,4,5,6,9,13,27,46,48,49,50,51,98,99,101,113,137,140,152,174,2,3,5,8,11,25,45,47,48,50,96,97,99,111,135,138,150,172,11,52,91,92,94,96,97,99,103,104,106,111,117,142,145,150,156,178,26,71,73,78,81,131,134,136,139,143,146,151,157,165,168,173,179,188,23,65,66,67,68,69,83,85,86,87,116,118,119,120,121,122,123,124,129,13,14,15,18,21,35,61,98,100,101,102,113,114,115,124,152,154,163,185,10,11,13,16,19,33,59,97,98,99,101,110,111,113,122,149,152,161,183,13,54,56,92,93,94,98,99,101,105,106,108,113,119,144,147,152,158,180,1,2,4,7,10,24,44,46,47,49,59,77,96,98,110,137,149,171,12,53,55,60,63,92,95,97,100,104,107,112,118,143,146,151,157,179];
    C_dx = [45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,45,70,95,41,1,6,11,16,21,26,31,36,46,51,56,61,66,71,76,81,86,91,41,21,66,1,6,11,16,26,31,36,46,51,56,61,71,76,81,86,91,41,46,51,56,61,66,1,6,11,16,21,26,31,36,71,76,81,86,91,26,31,36,41,61,81,66,1,6,11,16,21,46,51,56,71,76,86,91,41,1,66,6,11,16,21,26,31,36,46,51,56,61,71,76,81,86,91,41,6,66,1,11,16,21,26,31,36,46,51,56,61,71,76,81,86,91,41,1,11,16,21,26,31,36,46,51,56,61,66,71,76,81,86,91,41,6,66,86,1,11,16,21,26,31,36,46,51,56,61,71,76,81,91,26,31,36,41,61,81,66,86,1,6,11,16,21,46,51,56,91,71,76,41,21,66,86,1,6,11,16,26,31,36,46,51,56,61,91,71,76,81,26,31,36,41,61,81,1,6,11,16,21,46,51,56,66,71,76,86,91,26,31,36,41,61,81,66,86,1,6,11,16,21,46,51,56,71,76,91,41,1,21,6,11,16,26,31,36,46,51,56,61,66,71,76,81,86,91,41,21,66,86,1,6,11,16,26,31,36,46,51,56,61,71,76,81,91,41,1,66,86,6,11,16,21,26,31,36,46,51,56,61,91,71,76,81,41,1,66,86,6,11,16,21,26,31,36,46,51,56,61,71,76,81,91,26,31,36,41,61,81,6,1,11,16,21,46,51,56,66,71,76,86,91,41,6,21,1,11,16,26,31,36,46,51,56,61,66,71,76,81,86,91,26,31,36,41,61,81,21,1,6,11,16,46,51,56,66,71,76,86,91,26,31,36,41,61,81,6,1,11,16,21,46,51,56,66,71,76,86,91,41,6,21,1,11,16,26,31,36,46,51,56,61,66,71,76,81,86,91,26,31,36,41,61,81,1,6,11,16,21,46,51,56,66,71,76,86,91,26,31,36,41,61,81,1,11,16,21,46,51,56,66,71,76,86,91,41,1,11,16,21,26,31,36,46,51,56,61,66,71,76,81,86,91,41,1,16,31,51,11,21,26,36,46,56,61,66,71,76,81,86,91,41,46,51,56,61,66,71,76,81,86,1,6,11,16,21,26,31,36,91,41,46,51,56,61,66,71,76,81,86,1,6,11,16,21,26,31,36,91,26,31,36,41,61,81,21,1,6,11,16,46,51,56,66,71,76,86,91,26,31,36,41,61,81,1,6,11,16,21,46,51,56,66,71,76,86,91,41,1,21,6,11,16,26,31,36,46,51,56,61,66,71,76,81,86,91,26,31,36,41,61,81,1,11,16,21,46,71,51,56,66,76,86,91,41,11,16,21,36,56,76,1,6,26,31,46,51,61,66,71,81,86,91,41,6,66,86,1,11,16,21,26,31,36,46,51,56,61,91,71,76,81,41,1,16,31,51,11,21,26,36,46,56,61,66,71,76,81,86,91,41,11,16,21,36,56,76,1,6,26,31,46,51,61,66,71,81,86,91,42,2,7,12,17,22,27,32,37,47,52,57,62,67,72,77,82,87,92,42,22,67,2,7,12,17,27,32,37,47,52,57,62,72,77,82,87,92,42,47,52,57,62,67,2,7,12,17,22,27,32,37,72,77,82,87,92,27,32,37,42,62,82,67,2,7,12,17,22,47,52,57,72,77,87,92,42,2,67,7,12,17,22,27,32,37,47,52,57,62,72,77,82,87,92,42,7,67,2,12,17,22,27,32,37,47,52,57,62,72,77,82,87,92,42,2,12,17,22,27,32,37,47,52,57,62,67,72,77,82,87,92,42,7,67,87,2,12,17,22,27,32,37,47,52,57,62,72,77,82,92,27,32,37,42,62,82,67,87,2,7,12,17,22,47,52,57,92,72,77,42,22,67,87,2,7,12,17,27,32,37,47,52,57,62,92,72,77,82,27,32,37,42,62,82,2,7,12,17,22,47,52,57,67,72,77,87,92,27,32,37,42,62,82,67,87,2,7,12,17,22,47,52,57,72,77,92,42,2,22,7,12,17,27,32,37,47,52,57,62,67,72,77,82,87,92,42,22,67,87,2,7,12,17,27,32,37,47,52,57,62,72,77,82,92,42,2,67,87,7,12,17,22,27,32,37,47,52,57,62,92,72,77,82,42,2,67,87,7,12,17,22,27,32,37,47,52,57,62,72,77,82,92,27,32,37,42,62,82,7,2,12,17,22,47,52,57,67,72,77,87,92,42,7,22,2,12,17,27,32,37,47,52,57,62,67,72,77,82,87,92,27,32,37,42,62,82,22,2,7,12,17,47,52,57,67,72,77,87,92,27,32,37,42,62,82,7,2,12,17,22,47,52,57,67,72,77,87,92,42,7,22,2,12,17,27,32,37,47,52,57,62,67,72,77,82,87,92,27,32,37,42,62,82,2,7,12,17,22,47,52,57,67,72,77,87,92,27,32,37,42,62,82,2,12,17,22,47,52,57,67,72,77,87,92,42,2,12,17,22,27,32,37,47,52,57,62,67,72,77,82,87,92,42,2,17,32,52,12,22,27,37,47,57,62,67,72,77,82,87,92,42,47,52,57,62,67,72,77,82,87,2,7,12,17,22,27,32,37,92,42,47,52,57,62,67,72,77,82,87,2,7,12,17,22,27,32,37,92,27,32,37,42,62,82,22,2,7,12,17,47,52,57,67,72,77,87,92,27,32,37,42,62,82,2,7,12,17,22,47,52,57,67,72,77,87,92,42,2,22,7,12,17,27,32,37,47,52,57,62,67,72,77,82,87,92,27,32,37,42,62,82,2,12,17,22,47,72,52,57,67,77,87,92,42,12,17,22,37,57,77,2,7,27,32,47,52,62,67,72,82,87,92,42,7,67,87,2,12,17,22,27,32,37,47,52,57,62,92,72,77,82,42,2,17,32,52,12,22,27,37,47,57,62,67,72,77,82,87,92,42,12,17,22,37,57,77,2,7,27,32,47,52,62,67,72,82,87,92,43,3,8,13,18,23,28,33,38,48,53,58,63,68,73,78,83,88,93,43,23,68,3,8,13,18,28,33,38,48,53,58,63,73,78,83,88,93,43,48,53,58,63,68,3,8,13,18,23,28,33,38,73,78,83,88,93,28,33,38,43,63,83,68,3,8,13,18,23,48,53,58,73,78,88,93,43,3,68,8,13,18,23,28,33,38,48,53,58,63,73,78,83,88,93,43,8,68,3,13,18,23,28,33,38,48,53,58,63,73,78,83,88,93,43,3,13,18,23,28,33,38,48,53,58,63,68,73,78,83,88,93,43,8,68,88,3,13,18,23,28,33,38,48,53,58,63,73,78,83,93,28,33,38,43,63,83,68,88,3,8,13,18,23,48,53,58,93,73,78,43,23,68,88,3,8,13,18,28,33,38,48,53,58,63,93,73,78,83,28,33,38,43,63,83,3,8,13,18,23,48,53,58,68,73,78,88,93,28,33,38,43,63,83,68,88,3,8,13,18,23,48,53,58,73,78,93,43,3,23,8,13,18,28,33,38,48,53,58,63,68,73,78,83,88,93,43,23,68,88,3,8,13,18,28,33,38,48,53,58,63,73,78,83,93,43,3,68,88,8,13,18,23,28,33,38,48,53,58,63,93,73,78,83,43,3,68,88,8,13,18,23,28,33,38,48,53,58,63,73,78,83,93,28,33,38,43,63,83,8,3,13,18,23,48,53,58,68,73,78,88,93,43,8,23,3,13,18,28,33,38,48,53,58,63,68,73,78,83,88,93,28,33,38,43,63,83,23,3,8,13,18,48,53,58,68,73,78,88,93,28,33,38,43,63,83,8,3,13,18,23,48,53,58,68,73,78,88,93,43,8,23,3,13,18,28,33,38,48,53,58,63,68,73,78,83,88,93,28,33,38,43,63,83,3,8,13,18,23,48,53,58,68,73,78,88,93,28,33,38,43,63,83,3,13,18,23,48,53,58,68,73,78,88,93,43,3,13,18,23,28,33,38,48,53,58,63,68,73,78,83,88,93,43,3,18,33,53,13,23,28,38,48,58,63,68,73,78,83,88,93,43,48,53,58,63,68,73,78,83,88,3,8,13,18,23,28,33,38,93,43,48,53,58,63,68,73,78,83,88,3,8,13,18,23,28,33,38,93,28,33,38,43,63,83,23,3,8,13,18,48,53,58,68,73,78,88,93,28,33,38,43,63,83,3,8,13,18,23,48,53,58,68,73,78,88,93,43,3,23,8,13,18,28,33,38,48,53,58,63,68,73,78,83,88,93,28,33,38,43,63,83,3,13,18,23,48,73,53,58,68,78,88,93,43,8,68,88,3,13,18,23,28,33,38,48,53,58,63,93,73,78,83,43,3,18,33,53,13,23,28,38,48,58,63,68,73,78,83,88,93,44,4,9,14,19,24,29,34,39,49,54,59,64,69,74,79,84,89,94,44,24,69,4,9,14,19,29,34,39,49,54,59,64,74,79,84,89,94,44,49,54,59,64,69,4,9,14,19,24,29,34,39,74,79,84,89,94,29,34,39,44,64,84,69,4,9,14,19,24,49,54,59,74,79,89,94,44,4,69,9,14,19,24,29,34,39,49,54,59,64,74,79,84,89,94,44,9,69,4,14,19,24,29,34,39,49,54,59,64,74,79,84,89,94,44,4,14,19,24,29,34,39,49,54,59,64,69,74,79,84,89,94,44,9,69,89,4,14,19,24,29,34,39,49,54,59,64,74,79,84,94,29,34,39,44,64,84,69,89,4,9,14,19,24,49,54,59,94,74,79,44,24,69,89,4,9,14,19,29,34,39,49,54,59,64,94,74,79,84,29,34,39,44,64,84,4,9,14,19,24,49,54,59,69,74,79,89,94,29,34,39,44,64,84,69,89,4,9,14,19,24,49,54,59,74,79,94,44,4,24,9,14,19,29,34,39,49,54,59,64,69,74,79,84,89,94,44,24,69,89,4,9,14,19,29,34,39,49,54,59,64,74,79,84,94,44,4,69,89,9,14,19,24,29,34,39,49,54,59,64,94,74,79,84,44,4,69,89,9,14,19,24,29,34,39,49,54,59,64,74,79,84,94,29,34,39,44,64,84,9,4,14,19,24,49,54,59,69,74,79,89,94,44,9,24,4,14,19,29,34,39,49,54,59,64,69,74,79,84,89,94,29,34,39,44,64,84,24,4,9,14,19,49,54,59,69,74,79,89,94,29,34,39,44,64,84,9,4,14,19,24,49,54,59,69,74,79,89,94,44,9,24,4,14,19,29,34,39,49,54,59,64,69,74,79,84,89,94,29,34,39,44,64,84,4,9,14,19,24,49,54,59,69,74,79,89,94,29,34,39,44,64,84,4,14,19,24,49,54,59,69,74,79,89,94,44,4,14,19,24,29,34,39,49,54,59,64,69,74,79,84,89,94,44,4,19,34,54,14,24,29,39,49,59,64,69,74,79,84,89,94,44,49,54,59,64,69,74,79,84,89,4,9,14,19,24,29,34,39,94,29,34,39,44,64,84,24,4,9,14,19,49,54,59,69,74,79,89,94,29,34,39,44,64,84,4,9,14,19,24,49,54,59,69,74,79,89,94,44,4,24,9,14,19,29,34,39,49,54,59,64,69,74,79,84,89,94,29,34,39,44,64,84,4,14,19,24,49,74,54,59,69,79,89,94,44,4,19,34,54,14,24,29,39,49,59,64,69,74,79,84,89,94];
    M = sparse(i_dx,j_dx,C(C_dx),177,205);

    M = M(44:end,44:end)-(M(44:end,1:43)/M(1:43,1:43))*M(1:43,44:end); % Schur complement reduction

    [L,~,Pi] = lu(M(:,1:47));
    Pi = Pi';
    M = [Pi*L Pi(:,48:end)]\M(:,48:end);
    M = full(M(48:end,:));

    [L,UR,Pi] = lu(M(:,1:39));
    Pi = Pi';
    M = [Pi*L Pi(:,40:end)]\M(:,40:end);
    MP = M(1:39,:);
    NP = M(40:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-6));
    A = UR\[MP(:,1:end-6)*Pi MP(:,end-5:end)];
    B = U(:,1:48)\[U(:,49:end) Q'*NP(:,end-5:end)];
    M = [-A(:,end-27:end)+A(:,1:end-28)*B; -B];

    xP = [77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,48,49,50,51,52,53,54,55,56,111,112,113,114,115,66,67,68,69,70,75];
    P1 = [(1:70)*Pi 71:76];
    T = getT(M,[77:115 P1(1:end-28)],P1(end-27:end),xP);

    [V,~] = eig(T);
    S = V(23:27,:)./repmat(V(28,:),5,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end