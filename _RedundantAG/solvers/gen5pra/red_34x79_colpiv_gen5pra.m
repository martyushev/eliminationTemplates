% Input: coefficient matrix C of size 6x84
% Output: solution matrix S of size 3x45

function S = red_34x79_colpiv_gen5pra(C)

    ix = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15,16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31,32,32,32,32,33,33,33,33,34,34,34,34,35,35,35,35,36,36,36,36,37,37,37,37,38,38,38,38,39,39,39,39,40,40,40,40,41,41,41,41,42,42,42,42,43,43,43,43,44,44,44,44,45,45,45,45,46,46,46,46,47,47,47,47,48,48,48,48,49,49,49,49,50,50,50,50,51,51,51,51,52,52,52,52,53,53,53,53,54,54,54,54,55,55,55,55,56,56,56,56,57,57,57,57,58,58,58,58,59,59,59,59,60,60,60,60,61,61,61,61,62,62,62,62,63,63,63,63,64,64,64,64,65,65,65,65,66,66,66,66,67,67,67,67,68,68,68,68,69,69,69,69,70,70,70,70,71,71,71,71,72,72,72,72,73,73,73,73,74,74,74,74,75,75,75,75,76,76,76,76,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111];
    jx = [31,37,39,71,26,38,40,72,19,39,41,60,10,40,42,73,41,78,82,97,42,79,83,98,62,64,66,69,56,58,61,68,50,66,70,74,61,95,99,121,70,96,100,122,54,60,71,75,48,72,73,76,60,97,101,123,73,98,102,124,45,64,74,77,58,99,103,125,74,100,104,126,75,101,105,127,76,102,106,128,77,104,107,130,4,6,32,34,25,27,35,63,18,20,32,57,9,11,27,51,20,80,84,110,11,81,85,111,28,30,36,65,53,55,59,67,47,49,52,65,59,108,112,132,52,109,113,133,22,24,34,57,44,46,51,63,57,110,114,134,51,111,115,135,14,16,30,49,55,112,116,136,49,113,117,137,24,114,118,138,46,115,119,139,16,117,120,140,3,5,26,29,17,19,31,54,8,10,26,48,19,82,86,123,10,83,87,124,21,23,33,56,43,45,50,62,56,121,125,141,50,122,126,142,13,15,29,48,54,123,127,143,48,124,128,144,23,125,129,145,45,126,130,146,15,128,131,147,2,4,18,22,7,9,25,44,18,84,88,134,9,85,89,135,12,14,28,47,53,132,136,148,47,133,137,149,22,134,138,150,44,135,139,151,14,137,140,152,1,3,8,13,17,86,90,143,8,87,91,144,21,141,145,153,43,142,146,154,13,144,147,155,2,88,92,150,7,89,93,151,12,149,152,156,1,91,94,155,8,9,10,11,18,19,20,26,27,32,38,39,40,41,42,47,48,49,50,51,52,56,57,58,59,60,61,65,66,68,70,72,73,74,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,12,13,14,15,16,21,22,23,24,28,29,30,33,34,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,21,22,23,25,26,28,29,31,33,43,44,45,47,48,50,53,54,56,62,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,8,9,10,11,18,19,20,26,27,32,38,39,40,41,42,47,48,49,50,51,52,56,57,58,59,60,61,65,66,68,70,72,73,74,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,12,13,14,15,16,21,22,23,24,28,29,30,33,34,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,21,22,23,25,26,28,29,31,33,43,44,45,47,48,50,53,54,56,62,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,8,9,10,11,18,19,20,26,27,32,38,39,40,41,42,47,48,49,50,51,52,56,57,58,59,60,61,65,66,68,70,72,73,74,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,12,13,14,15,16,21,22,23,24,28,29,30,33,34,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,21,22,23,25,26,28,29,31,33,43,44,45,47,48,50,53,54,56,62,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,8,9,10,11,18,19,20,26,27,32,38,39,40,41,42,47,48,49,50,51,52,56,57,58,59,60,61,65,66,68,70,72,73,74,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,12,13,14,15,16,21,22,23,24,28,29,30,33,34,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,21,22,23,25,26,28,29,31,33,43,44,45,47,48,50,53,54,56,62,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,8,9,10,11,18,19,20,26,27,32,38,39,40,41,42,47,48,49,50,51,52,56,57,58,59,60,61,65,66,68,70,72,73,74,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,10,11,17,18,19,20,25,26,27,31,32,35,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,12,13,14,15,16,21,22,23,24,28,29,30,33,34,36,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,62,63,65,67,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,21,22,23,25,26,28,29,31,33,43,44,45,47,48,50,53,54,56,62,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156];
    kx = [504,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,450,462,504,480,450,462,504,480,504,480,462,450,504,480,462,450,504,450,462,480,450,462,480,504,450,462,480,504,504,462,450,480,504,450,462,480,450,462,480,504,450,462,480,504,504,450,462,480,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,504,450,462,480,504,462,450,480,504,462,450,480,504,462,450,480,450,462,504,480,450,462,504,480,504,480,450,462,504,480,462,450,504,480,462,450,450,462,480,504,450,462,480,504,504,480,450,462,504,480,462,450,450,462,480,504,450,462,480,504,504,480,450,462,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,504,450,462,480,504,462,450,480,504,462,450,480,450,462,504,480,450,462,504,480,504,480,450,462,504,480,462,450,450,462,480,504,450,462,480,504,504,480,450,462,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,504,450,462,480,504,462,450,480,450,462,504,480,450,462,504,480,504,480,450,462,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,450,462,480,504,504,450,462,480,450,462,504,480,450,462,504,480,450,462,480,504,450,462,480,504,450,462,480,504,450,462,504,480,450,462,504,480,450,462,480,504,450,462,504,480,445,391,307,187,385,301,181,295,175,169,1,7,13,19,25,409,349,259,331,241,217,325,235,109,211,85,55,205,49,43,61,79,91,115,133,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,445,409,349,259,391,331,241,307,217,187,385,325,235,301,211,85,181,55,19,295,205,79,175,13,169,7,1,25,43,49,61,91,109,115,133,31,37,67,73,97,103,121,127,139,145,151,157,163,193,199,223,229,247,253,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,481,445,385,295,169,1,451,397,313,193,31,463,427,367,277,151,391,307,187,25,409,349,259,133,301,181,19,325,235,109,175,13,205,79,7,43,415,355,265,139,337,247,121,223,97,67,331,241,115,217,91,61,211,85,55,49,37,199,319,403,457,487,499,73,103,127,145,157,163,229,253,271,283,289,343,361,373,379,421,433,439,469,475,493,445,391,307,187,25,385,301,181,19,295,175,13,169,7,1,409,349,259,133,331,241,115,217,91,61,325,235,109,211,85,55,205,79,49,43,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,445,409,349,259,133,385,325,235,109,295,205,79,169,43,1,391,331,241,115,307,217,91,187,61,25,301,211,85,181,55,19,175,49,13,7,31,37,67,73,97,103,121,127,139,145,151,157,163,193,199,223,229,247,253,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,445,385,295,169,1,391,307,187,25,409,349,259,133,301,181,19,325,235,109,175,13,205,79,7,43,331,241,115,217,91,61,211,85,55,49,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,482,452,398,314,194,446,392,308,188,386,302,182,296,176,170,2,8,14,20,26,32,464,428,368,278,416,356,266,338,248,224,410,350,260,332,242,116,218,92,62,326,236,110,212,56,206,50,44,68,80,86,98,122,134,140,152,38,200,320,404,458,488,500,74,104,128,146,158,164,230,254,272,284,290,344,362,374,380,422,434,440,470,476,494,446,392,308,188,386,302,182,296,176,170,2,8,14,20,26,410,350,260,332,242,218,326,236,110,212,86,56,206,50,44,62,80,92,116,134,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,446,410,350,260,392,332,242,308,218,188,386,326,236,302,212,86,182,56,20,296,206,80,176,14,170,8,2,26,44,50,62,92,110,116,134,32,38,68,74,98,104,122,128,140,146,152,158,164,194,200,224,230,248,254,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,482,446,386,296,170,2,452,398,314,194,32,464,428,368,278,152,392,308,188,26,410,350,260,134,302,182,20,326,236,110,176,14,206,80,8,44,416,356,266,140,338,248,122,224,98,68,332,242,116,218,92,62,212,86,56,50,38,200,320,404,458,488,500,74,104,128,146,158,164,230,254,272,284,290,344,362,374,380,422,434,440,470,476,494,446,392,308,188,26,386,302,182,20,296,176,14,170,8,2,410,350,260,134,332,242,116,218,92,62,326,236,110,212,86,56,206,80,50,44,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,446,410,350,260,134,386,326,236,110,296,206,80,170,44,2,392,332,242,116,308,218,92,188,62,26,302,212,86,182,56,20,176,50,14,8,32,38,68,74,98,104,122,128,140,146,152,158,164,194,200,224,230,248,254,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,446,386,296,170,2,392,308,188,26,410,350,260,134,302,182,20,326,236,110,176,14,206,80,8,44,332,242,116,218,92,62,212,86,56,50,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,483,453,399,315,195,447,393,309,189,387,303,183,297,177,171,3,9,15,21,27,33,465,429,369,279,417,357,267,339,249,225,411,351,261,333,243,117,219,93,63,327,237,111,213,57,207,51,45,69,81,87,99,123,135,141,153,39,201,321,405,459,489,501,75,105,129,147,159,165,231,255,273,285,291,345,363,375,381,423,435,441,471,477,495,447,393,309,189,387,303,183,297,177,171,3,9,15,21,27,411,351,261,333,243,219,327,237,111,213,87,57,207,51,45,63,81,93,117,135,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,447,411,351,261,393,333,243,309,219,189,387,327,237,303,213,87,183,57,21,297,207,81,177,15,171,9,3,27,45,51,63,93,111,117,135,33,39,69,75,99,105,123,129,141,147,153,159,165,195,201,225,231,249,255,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,483,447,387,297,171,3,453,399,315,195,33,465,429,369,279,153,393,309,189,27,411,351,261,135,303,183,21,327,237,111,177,15,207,81,9,45,417,357,267,141,339,249,123,225,99,69,333,243,117,219,93,63,213,87,57,51,39,201,321,405,459,489,501,75,105,129,147,159,165,231,255,273,285,291,345,363,375,381,423,435,441,471,477,495,447,393,309,189,27,387,303,183,21,297,177,15,171,9,3,411,351,261,135,333,243,117,219,93,63,327,237,111,213,87,57,207,81,51,45,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,447,411,351,261,135,387,327,237,111,297,207,81,171,45,3,393,333,243,117,309,219,93,189,63,27,303,213,87,183,57,21,177,51,15,9,33,39,69,75,99,105,123,129,141,147,153,159,165,195,201,225,231,249,255,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,447,387,297,171,3,393,309,189,27,411,351,261,135,303,183,21,327,237,111,177,15,207,81,9,45,333,243,117,219,93,63,213,87,57,51,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,484,454,400,316,196,448,394,310,190,388,304,184,298,178,172,4,10,16,22,28,34,466,430,370,280,418,358,268,340,250,226,412,352,262,334,244,118,220,94,64,328,238,112,214,58,208,52,46,70,82,88,100,124,136,142,154,40,202,322,406,460,490,502,76,106,130,148,160,166,232,256,274,286,292,346,364,376,382,424,436,442,472,478,496,448,394,310,190,388,304,184,298,178,172,4,10,16,22,28,412,352,262,334,244,220,328,238,112,214,88,58,208,52,46,64,82,94,118,136,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,448,412,352,262,394,334,244,310,220,190,388,328,238,304,214,88,184,58,22,298,208,82,178,16,172,10,4,28,46,52,64,94,112,118,136,34,40,70,76,100,106,124,130,142,148,154,160,166,196,202,226,232,250,256,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,484,448,388,298,172,4,454,400,316,196,34,466,430,370,280,154,394,310,190,28,412,352,262,136,304,184,22,328,238,112,178,16,208,82,10,46,418,358,268,142,340,250,124,226,100,70,334,244,118,220,94,64,214,88,58,52,40,202,322,406,460,490,502,76,106,130,148,160,166,232,256,274,286,292,346,364,376,382,424,436,442,472,478,496,448,394,310,190,28,388,304,184,22,298,178,16,172,10,4,412,352,262,136,334,244,118,220,94,64,328,238,112,214,88,58,208,82,52,46,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,448,412,352,262,136,388,328,238,112,298,208,82,172,46,4,394,334,244,118,310,220,94,190,64,28,304,214,88,184,58,22,178,52,16,10,34,40,70,76,100,106,124,130,142,148,154,160,166,196,202,226,232,250,256,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,448,388,298,172,4,394,310,190,28,412,352,262,136,304,184,22,328,238,112,178,16,208,82,10,46,334,244,118,220,94,64,214,88,58,52,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,485,455,401,317,197,449,395,311,191,389,305,185,299,179,173,5,11,17,23,29,35,467,431,371,281,419,359,269,341,251,227,413,353,263,335,245,119,221,95,65,329,239,113,215,59,209,53,47,71,83,89,101,125,137,143,155,41,203,323,407,461,491,503,77,107,131,149,161,167,233,257,275,287,293,347,365,377,383,425,437,443,473,479,497,449,395,311,191,389,305,185,299,179,173,5,11,17,23,29,413,353,263,335,245,221,329,239,113,215,89,59,209,53,47,65,83,95,119,137,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,449,413,353,263,395,335,245,311,221,191,389,329,239,305,215,89,185,59,23,299,209,83,179,17,173,11,5,29,47,53,65,95,113,119,137,35,41,71,77,101,107,125,131,143,149,155,161,167,197,203,227,233,251,257,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,485,449,389,299,173,5,455,401,317,197,35,467,431,371,281,155,395,311,191,29,413,353,263,137,305,185,23,329,239,113,179,17,209,83,11,47,419,359,269,143,341,251,125,227,101,71,335,245,119,221,95,65,215,89,59,53,41,203,323,407,461,491,503,77,107,131,149,161,167,233,257,275,287,293,347,365,377,383,425,437,443,473,479,497,449,395,311,191,29,389,305,185,23,299,179,17,173,11,5,413,353,263,137,335,245,119,221,95,65,329,239,113,215,89,59,209,83,53,47,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,449,413,353,263,137,389,329,239,113,299,209,83,173,47,5,395,335,245,119,311,221,95,191,65,29,305,215,89,185,59,23,179,53,17,11,35,41,71,77,101,107,125,131,143,149,155,161,167,197,203,227,233,251,257,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,449,389,299,173,5,395,311,191,29,413,353,263,137,305,185,23,329,239,113,179,17,209,83,11,47,335,245,119,221,95,65,215,89,59,53,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497];
    M = sparse(ix,jx,C(kx),111,156);

    M = M(78:end,78:end)-(M(78:end,1:77)/M(1:77,1:77))*M(1:77,78:end); % Schur complement reduction

    [L,~,P] = lu(M(:,1:2));
    P = P';
    M = [P*L P(:,3:end)]\M(:,3:end);
    M = full(M(3:end,:));

    [L,U,P] = lu(M(:,1:15));
    P = P';
    M = [P*L P(:,16:end)]\M(:,16:end);
    M1 = M(1:15,:);
    M2 = M(16:end,:);

    [Q,R,P] = qr(M2(:,1:end-4));
    A = U\[M1(:,1:end-4)*P M1(:,end-3:end)];
    B = R(:,1:17)\[R(:,18:end) Q'*M2(:,end-3:end)];
    M = [-A(:,end-44:end)+A(:,1:end-45)*B; -B];

    P1 = [63:77 (1:58)*P 59:62];
    P2 = [63,64,14,15,16,17,18,19,20,21,22,23,25,65,66,27,28,29,30,31,32,33,34,35,36,37,67,68,38,39,40,41,42,43,44,45,46,69,70,47,48,49,50,51,52,53,71,72,54,55,56,57,58,73,74,59,60,61,75,76,62,77];
    T = getT(M,P1(1:end-45),P1(end-44:end),P2);

    [V,~] = eig(T);
    S = V(42:44,:)./repmat(V(45,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end