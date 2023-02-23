% Input: coefficient matrix C of size 6x84
% Output: solution matrix S of size 3x45

function S = red_34x79_colpiv_gen5pra(C,ss)

    M = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34],[7,8,9,14,15,20,21,26,34,35,36,37,38,39,40,44,45,46,50,51,52,57,58,65,66,67,68,69,70,71,72,73,74,75,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,36,38,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,13,14,15,20,21,25,26,29,31,32,36,38,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,10,11,12,16,17,18,19,22,23,24,27,28,30,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,25,27,31,32,41,43,44,45,46,47,50,53,54,62,63,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,13,14,15,20,21,25,26,29,31,32,33,34,35,36,37,38,39,40,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,7,8,9,14,15,20,21,26,34,35,36,37,38,39,40,44,45,46,50,51,52,57,58,65,66,67,68,69,70,71,72,73,74,75,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,36,38,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,13,14,15,20,21,25,26,29,31,32,36,38,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,10,11,12,16,17,18,19,22,23,24,27,28,30,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,25,27,31,32,41,43,44,45,46,47,50,53,54,62,63,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,13,14,15,20,21,25,26,29,31,32,33,34,35,36,37,38,39,40,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,7,8,9,14,15,20,21,26,34,35,36,37,38,39,40,44,45,46,50,51,52,57,58,65,66,67,68,69,70,71,72,73,74,75,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,36,38,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,13,14,15,20,21,25,26,29,31,32,36,38,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,10,11,12,16,17,18,19,22,23,24,27,28,30,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,25,27,31,32,41,43,44,45,46,47,50,53,54,62,63,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,13,14,15,20,21,25,26,29,31,32,33,34,35,36,37,38,39,40,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,7,8,9,14,15,20,21,26,34,35,36,37,38,39,40,44,45,46,50,51,52,57,58,65,66,67,68,69,70,71,72,73,74,75,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,36,38,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,13,14,15,20,21,25,26,29,31,32,36,38,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,10,11,12,16,17,18,19,22,23,24,27,28,30,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,25,27,31,32,41,43,44,45,46,47,50,53,54,62,63,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,7,8,9,13,14,15,20,21,25,26,29,31,32,33,34,35,36,37,38,39,40,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,80,82,84,86,88,90,95,97,99,101,103,105,108,110,112,114,116,121,123,125,127,132,134,136,141,143,148,7,8,9,14,15,20,21,26,34,35,36,37,38,39,40,44,45,46,50,51,52,57,58,65,66,67,68,69,70,71,72,73,74,75,76,78,79,80,81,82,83,84,85,86,87,88,89,91,95,96,97,98,99,100,101,102,103,104,106,108,109,110,111,112,113,114,115,117,121,122,123,124,125,126,128,132,133,134,135,137,141,142,144,149,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,36,38,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,82,84,86,88,90,92,108,110,112,114,116,118,121,123,125,127,129,132,134,136,138,141,143,145,148,150,153,7,8,9,13,14,15,20,21,25,26,29,31,32,36,38,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,80,81,82,83,84,85,86,87,88,89,90,91,93,108,109,110,111,112,113,114,115,116,117,119,121,122,123,124,125,126,127,128,130,132,133,134,135,136,137,139,141,142,143,144,146,148,149,151,154,10,11,12,16,17,18,19,22,23,24,27,28,30,41,42,43,44,45,46,47,48,50,53,54,55,57,59,62,63,64,65,67,68,70,72,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,25,27,31,32,41,43,44,45,46,47,50,53,54,62,63,82,83,84,85,86,87,88,89,90,91,92,93,94,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156],C([445,391,307,385,301,295,175,169,1,7,181,13,187,19,25,409,349,331,325,85,55,205,49,259,43,211,217,61,235,79,241,91,109,115,133,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,445,391,331,307,349,235,109,301,55,19,325,295,205,79,175,13,169,43,1,409,385,259,241,7,181,187,25,211,49,217,61,85,91,115,133,31,37,67,73,97,103,121,127,139,145,151,157,163,193,199,223,229,247,253,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,481,445,385,295,169,1,397,313,193,463,427,277,391,307,187,409,349,259,133,181,19,325,235,109,175,13,205,79,7,43,451,301,25,31,367,151,415,337,247,223,265,115,217,241,211,85,55,49,355,331,139,121,61,67,91,97,37,199,319,403,457,487,499,73,103,127,145,157,163,229,253,271,283,289,343,361,373,379,421,433,439,469,475,493,391,307,187,385,301,181,175,13,169,7,1,445,295,19,25,409,331,241,217,259,109,211,235,205,79,49,43,349,325,133,115,55,61,85,91,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,445,409,259,385,325,235,109,295,205,79,169,43,1,349,133,391,307,217,187,241,85,181,211,175,49,13,7,331,301,115,91,19,25,55,61,31,37,67,73,97,103,121,127,139,145,151,157,163,193,199,223,229,247,253,265,271,277,283,289,313,319,337,343,355,361,367,373,379,397,403,415,421,427,433,439,451,457,463,469,475,481,487,493,499,445,385,295,169,1,307,187,25,409,349,133,301,181,19,325,235,109,13,205,79,7,43,391,175,259,331,217,91,61,115,55,85,49,241,211,31,37,193,199,313,319,397,403,451,457,481,487,499,67,73,97,103,121,127,139,145,151,157,163,223,229,247,253,265,271,277,283,289,337,343,355,361,367,373,379,415,421,427,433,439,463,469,475,493,452,398,314,446,392,308,302,182,296,176,170,482,386,2,8,14,188,20,194,26,32,464,416,356,338,368,260,134,332,92,62,350,326,236,110,212,56,206,80,44,428,410,278,266,50,218,224,68,242,86,248,98,116,122,140,152,38,200,320,404,458,488,500,74,104,128,146,158,164,230,254,272,284,290,344,362,374,380,422,434,440,470,476,494,446,392,308,386,302,296,176,170,2,8,182,14,188,20,26,410,350,332,326,86,56,206,50,260,44,212,218,62,236,80,242,92,110,116,134,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,446,392,332,308,350,236,110,302,56,20,326,296,206,80,176,14,170,44,2,410,386,260,242,8,182,188,26,212,50,218,62,86,92,116,134,32,38,68,74,98,104,122,128,140,146,152,158,164,194,200,224,230,248,254,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,482,446,386,296,170,2,398,314,194,464,428,278,392,308,188,410,350,260,134,182,20,326,236,110,176,14,206,80,8,44,452,302,26,32,368,152,416,338,248,224,266,116,218,242,212,86,56,50,356,332,140,122,62,68,92,98,38,200,320,404,458,488,500,74,104,128,146,158,164,230,254,272,284,290,344,362,374,380,422,434,440,470,476,494,392,308,188,386,302,182,176,14,170,8,2,446,296,20,26,410,332,242,218,260,110,212,236,206,80,50,44,350,326,134,116,56,62,86,92,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,446,410,260,386,326,236,110,296,206,80,170,44,2,350,134,392,308,218,188,242,86,182,212,176,50,14,8,332,302,116,92,20,26,56,62,32,38,68,74,98,104,122,128,140,146,152,158,164,194,200,224,230,248,254,266,272,278,284,290,314,320,338,344,356,362,368,374,380,398,404,416,422,428,434,440,452,458,464,470,476,482,488,494,500,446,386,296,170,2,308,188,26,410,350,134,302,182,20,326,236,110,14,206,80,8,44,392,176,260,332,218,92,62,116,56,86,50,242,212,32,38,194,200,314,320,398,404,452,458,482,488,500,68,74,98,104,122,128,140,146,152,158,164,224,230,248,254,266,272,278,284,290,338,344,356,362,368,374,380,416,422,428,434,440,464,470,476,494,453,399,315,447,393,309,303,183,297,177,171,483,387,3,9,15,189,21,195,27,33,465,417,357,339,369,261,135,333,93,63,351,327,237,111,213,57,207,81,45,429,411,279,267,51,219,225,69,243,87,249,99,117,123,141,153,39,201,321,405,459,489,501,75,105,129,147,159,165,231,255,273,285,291,345,363,375,381,423,435,441,471,477,495,447,393,309,387,303,297,177,171,3,9,183,15,189,21,27,411,351,333,327,87,57,207,51,261,45,213,219,63,237,81,243,93,111,117,135,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,447,393,333,309,351,237,111,303,57,21,327,297,207,81,177,15,171,45,3,411,387,261,243,9,183,189,27,213,51,219,63,87,93,117,135,33,39,69,75,99,105,123,129,141,147,153,159,165,195,201,225,231,249,255,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,483,447,387,297,171,3,399,315,195,465,429,279,393,309,189,411,351,261,135,183,21,327,237,111,177,15,207,81,9,45,453,303,27,33,369,153,417,339,249,225,267,117,219,243,213,87,57,51,357,333,141,123,63,69,93,99,39,201,321,405,459,489,501,75,105,129,147,159,165,231,255,273,285,291,345,363,375,381,423,435,441,471,477,495,393,309,189,387,303,183,177,15,171,9,3,447,297,21,27,411,333,243,219,261,111,213,237,207,81,51,45,351,327,135,117,57,63,87,93,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,447,411,261,387,327,237,111,297,207,81,171,45,3,351,135,393,309,219,189,243,87,183,213,177,51,15,9,333,303,117,93,21,27,57,63,33,39,69,75,99,105,123,129,141,147,153,159,165,195,201,225,231,249,255,267,273,279,285,291,315,321,339,345,357,363,369,375,381,399,405,417,423,429,435,441,453,459,465,471,477,483,489,495,501,447,387,297,171,3,309,189,27,411,351,135,303,183,21,327,237,111,15,207,81,9,45,393,177,261,333,219,93,63,117,57,87,51,243,213,33,39,195,201,315,321,399,405,453,459,483,489,501,69,75,99,105,123,129,141,147,153,159,165,225,231,249,255,267,273,279,285,291,339,345,357,363,369,375,381,417,423,429,435,441,465,471,477,495,454,400,316,448,394,310,304,184,298,178,172,484,388,4,10,16,190,22,196,28,34,466,418,358,340,370,262,136,334,94,64,352,328,238,112,214,58,208,82,46,430,412,280,268,52,220,226,70,244,88,250,100,118,124,142,154,40,202,322,406,460,490,502,76,106,130,148,160,166,232,256,274,286,292,346,364,376,382,424,436,442,472,478,496,448,394,310,388,304,298,178,172,4,10,184,16,190,22,28,412,352,334,328,88,58,208,52,262,46,214,220,64,238,82,244,94,112,118,136,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,448,394,334,310,352,238,112,304,58,22,328,298,208,82,178,16,172,46,4,412,388,262,244,10,184,190,28,214,52,220,64,88,94,118,136,34,40,70,76,100,106,124,130,142,148,154,160,166,196,202,226,232,250,256,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,484,448,388,298,172,4,400,316,196,466,430,280,394,310,190,412,352,262,136,184,22,328,238,112,178,16,208,82,10,46,454,304,28,34,370,154,418,340,250,226,268,118,220,244,214,88,58,52,358,334,142,124,64,70,94,100,40,202,322,406,460,490,502,76,106,130,148,160,166,232,256,274,286,292,346,364,376,382,424,436,442,472,478,496,394,310,190,388,304,184,178,16,172,10,4,448,298,22,28,412,334,244,220,262,112,214,238,208,82,52,46,352,328,136,118,58,64,88,94,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,448,412,262,388,328,238,112,298,208,82,172,46,4,352,136,394,310,220,190,244,88,184,214,178,52,16,10,334,304,118,94,22,28,58,64,34,40,70,76,100,106,124,130,142,148,154,160,166,196,202,226,232,250,256,268,274,280,286,292,316,322,340,346,358,364,370,376,382,400,406,418,424,430,436,442,454,460,466,472,478,484,490,496,502,448,388,298,172,4,310,190,28,412,352,136,304,184,22,328,238,112,16,208,82,10,46,394,178,262,334,220,94,64,118,58,88,52,244,214,34,40,196,202,316,322,400,406,454,460,484,490,502,70,76,100,106,124,130,142,148,154,160,166,226,232,250,256,268,274,280,286,292,340,346,358,364,370,376,382,418,424,430,436,442,466,472,478,496,455,401,317,449,395,311,305,185,299,179,173,485,389,5,11,17,191,23,197,29,35,467,419,359,341,371,263,137,335,95,65,353,329,239,113,215,59,209,83,47,431,413,281,269,53,221,227,71,245,89,251,101,119,125,143,155,41,203,323,407,461,491,503,77,107,131,149,161,167,233,257,275,287,293,347,365,377,383,425,437,443,473,479,497,449,395,311,389,305,299,179,173,5,11,185,17,191,23,29,413,353,335,329,89,59,209,53,263,47,215,221,65,239,83,245,95,113,119,137,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,449,395,335,311,353,239,113,305,59,23,329,299,209,83,179,17,173,47,5,413,389,263,245,11,185,191,29,215,53,221,65,89,95,119,137,35,41,71,77,101,107,125,131,143,149,155,161,167,197,203,227,233,251,257,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,485,449,389,299,173,5,401,317,197,467,431,281,395,311,191,413,353,263,137,185,23,329,239,113,179,17,209,83,11,47,455,305,29,35,371,155,419,341,251,227,269,119,221,245,215,89,59,53,359,335,143,125,65,71,95,101,41,203,323,407,461,491,503,77,107,131,149,161,167,233,257,275,287,293,347,365,377,383,425,437,443,473,479,497,395,311,191,389,305,185,179,17,173,11,5,449,299,23,29,413,335,245,221,263,113,215,239,209,83,53,47,353,329,137,119,59,65,89,95,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497,449,413,263,389,329,239,113,299,209,83,173,47,5,353,137,395,311,221,191,245,89,185,215,179,53,17,11,335,305,119,95,23,29,59,65,35,41,71,77,101,107,125,131,143,149,155,161,167,197,203,227,233,251,257,269,275,281,287,293,317,323,341,347,359,365,371,377,383,401,407,419,425,431,437,443,455,461,467,473,479,485,491,497,503,449,389,299,173,5,311,191,29,413,353,137,305,185,23,329,239,113,17,209,83,11,47,395,179,263,335,221,95,65,119,59,89,53,245,215,35,41,197,203,317,323,401,407,455,461,485,491,503,71,77,101,107,125,131,143,149,155,161,167,227,233,251,257,269,275,281,287,293,341,347,359,365,371,377,383,419,425,431,437,443,467,473,479,497]),34,156);

    M0 = sparse([1,1,1,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,20,20,20,21,21,21,21,21,21,22,22,22,22,22,22,23,23,23,23,23,23,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,26,26,26,27,27,27,27,27,27,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,31,31,31,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,36,36,36,37,37,37,37,37,37,38,38,38,39,39,39,40,40,40,41,41,41,42,42,42,43,43,43,44,44,44,45,45,45,46,46,46,47,47,47,48,48,48,49,49,49,50,50,50,51,51,51,52,52,52,53,53,53,54,54,54,54,54,54,55,55,55,55,55,55,56,56,56,56,56,56,57,57,57,57,57,57,58,58,58,58,58,58,59,59,59,59,59,59,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,62,62,62,63,63,63,64,64,64,65,65,65,66,66,66,66,66,66,67,67,67,68,68,68,69,69,69,70,70,70,71,71,71,71,71,71,72,72,72,73,73,73,74,74,74,75,75,75,76,76,76,77,77,77],[14,17,78,11,15,73,10,14,17,67,70,78,7,11,15,57,61,73,6,10,14,17,47,51,54,67,70,78,3,7,11,15,33,37,41,57,61,73,10,14,67,8,12,58,6,10,47,72,75,79,67,70,78,51,54,70,9,13,66,7,11,57,5,9,46,64,68,76,57,61,73,48,52,68,37,41,61,6,10,14,47,51,67,4,8,12,34,38,58,56,60,63,72,75,79,47,51,54,67,70,78,36,40,43,60,63,75,5,9,13,46,50,66,3,7,11,33,37,57,44,48,52,64,68,76,33,37,41,57,61,73,4,8,12,16,34,38,42,58,62,74,32,36,40,43,56,60,63,72,75,79,12,16,74,8,12,16,58,62,74,1,5,9,13,20,24,28,46,50,66,2,6,10,14,21,25,29,47,51,67,1,5,9,20,24,46,3,7,33,2,6,10,21,25,47,4,8,34,1,5,20,2,6,21,60,63,75,40,43,63,65,69,77,56,60,72,47,51,67,45,49,65,49,53,69,35,39,59,24,28,50,44,48,64,20,24,46,18,22,44,46,50,66,45,49,53,65,69,77,34,38,42,58,62,74,23,27,30,49,53,69,32,36,40,56,60,72,19,23,27,45,49,65,31,35,39,55,59,71,20,24,28,46,50,66,19,23,27,30,45,49,53,65,69,77,58,62,74,55,59,71,38,42,62,36,40,60,18,22,26,44,48,64,31,35,55,32,36,56,19,23,45,33,37,57,21,25,29,47,51,67,34,38,58,21,25,47,22,26,48,23,27,49,25,29,51,27,30,53],[1,ss,1,1,ss,1,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,1,ss,1,1,ss,1,1,ss,1,1,1,ss,1,1,ss,1,1,ss,1,ss,1,1,ss,1,1,ss,1,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2*ss,-ss^2,-2,-1,-2*ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,1,3,3,1,3*ss,6*ss,3*ss,3*ss^2,3*ss^2,ss^3,1,ss,1,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,1,3*ss,3*ss^2,ss^3,3,3,1,6*ss,3*ss,3*ss^2,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,ss,1,-1,-2*ss,-ss^2,-2,-1,-2*ss,1,ss,1,1,ss,1,1,ss,1,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,3,3,1,3*ss,6*ss,3*ss,3*ss^2,3*ss^2,ss^3,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,-1,-2,-1,-2*ss,-2*ss,-ss^2,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss,1,1,ss],77,79);
    M = M(:,78:end)-M(:,1:77)*M0; % Schur complement reduction

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