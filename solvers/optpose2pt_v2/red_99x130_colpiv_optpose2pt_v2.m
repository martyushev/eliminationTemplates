% Input: coefficient matrix C of size 6x21
% Output: solution matrix S of size 5x31

function S = red_99x130_colpiv_optpose2pt_v2(C,M0)

    ix = [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,18,18,18,19,19,19,20,20,20,21,21,21,22,22,22,23,23,23,24,24,24,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,104,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,105,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,106,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,108,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,109,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,111,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,113,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,114,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,115,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,116,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,117,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,118,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,121,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,122,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,123,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124,124];
    jx = [20,38,74,23,39,75,25,105,149,16,40,76,14,41,77,5,53,78,17,54,79,8,55,80,18,131,150,21,132,151,11,133,152,4,56,81,7,57,82,10,134,153,19,58,83,22,59,84,24,135,154,15,60,85,13,61,86,3,74,87,6,75,88,9,149,155,2,76,89,12,77,90,1,86,91,20,26,28,30,31,33,34,36,38,53,56,58,74,92,93,95,98,101,131,23,27,29,31,32,34,35,37,39,54,57,59,75,93,94,96,99,102,132,25,92,94,95,96,97,98,99,100,101,102,103,104,105,131,133,134,135,149,13,14,16,20,23,25,30,32,36,37,40,56,60,76,98,99,100,104,134,14,33,35,36,37,38,39,40,41,58,60,61,77,101,102,103,104,105,135,21,107,109,111,112,114,117,118,120,123,124,126,129,132,137,140,143,146,151,11,110,112,113,114,115,119,120,121,125,126,127,130,133,139,141,144,147,152,3,4,5,17,18,19,42,44,50,51,56,66,72,81,116,117,119,128,142,6,7,8,17,21,22,43,45,51,52,57,67,73,82,117,118,120,129,143,9,10,11,18,21,24,116,118,119,120,121,128,129,130,134,142,144,148,153,19,46,48,50,51,53,54,56,58,69,72,74,83,122,123,125,128,131,145,22,47,49,51,52,54,55,57,59,70,73,75,84,123,124,126,129,132,146,24,122,124,125,126,127,128,129,130,131,132,133,134,135,145,147,148,149,154,12,13,15,19,22,24,50,52,56,57,60,72,76,85,128,129,130,134,148,13,53,55,56,57,58,59,60,61,74,76,77,86,131,132,133,134,135,149,3,62,64,66,67,69,70,72,74,78,81,83,87,136,137,139,142,145,150,6,63,65,67,68,70,71,73,75,79,82,84,88,137,138,140,143,146,151,9,136,138,139,140,141,142,143,144,145,146,147,148,149,150,152,153,154,155,1,2,3,6,9,12,66,68,72,73,76,81,85,89,142,143,144,148,153,12,69,71,72,73,74,75,76,77,83,85,86,90,145,146,147,148,149,154,1,78,80,81,82,83,84,85,86,87,89,90,91,150,151,152,153,154,155,20,26,28,30,31,33,34,36,38,53,56,58,74,92,93,95,98,101,131,23,27,29,31,32,34,35,37,39,54,57,59,75,93,94,96,99,102,132,25,92,94,95,96,97,98,99,100,101,102,103,104,105,131,133,134,135,149,13,14,16,20,23,25,30,32,36,37,40,56,60,76,98,99,100,104,134,14,33,35,36,37,38,39,40,41,58,60,61,77,101,102,103,104,105,135,18,106,108,110,111,113,116,117,119,122,123,125,128,131,136,139,142,145,150,21,107,109,111,112,114,117,118,120,123,124,126,129,132,137,140,143,146,151,11,110,112,113,114,115,119,120,121,125,126,127,130,133,139,141,144,147,152,3,4,5,17,18,19,42,44,50,51,56,66,72,81,116,117,119,128,142,6,7,8,17,21,22,43,45,51,52,57,67,73,82,117,118,120,129,143,9,10,11,18,21,24,116,118,119,120,121,128,129,130,134,142,144,148,153,19,46,48,50,51,53,54,56,58,69,72,74,83,122,123,125,128,131,145,22,47,49,51,52,54,55,57,59,70,73,75,84,123,124,126,129,132,146,24,122,124,125,126,127,128,129,130,131,132,133,134,135,145,147,148,149,154,12,13,15,19,22,24,50,52,56,57,60,72,76,85,128,129,130,134,148,13,53,55,56,57,58,59,60,61,74,76,77,86,131,132,133,134,135,149,3,62,64,66,67,69,70,72,74,78,81,83,87,136,137,139,142,145,150,6,63,65,67,68,70,71,73,75,79,82,84,88,137,138,140,143,146,151,9,136,138,139,140,141,142,143,144,145,146,147,148,149,150,152,153,154,155,1,2,3,6,9,12,66,68,72,73,76,81,85,89,142,143,144,148,153,12,69,71,72,73,74,75,76,77,83,85,86,90,145,146,147,148,149,154,1,78,80,81,82,83,84,85,86,87,89,90,91,150,151,152,153,154,155,23,27,28,29,31,32,34,35,37,39,54,55,57,59,75,93,94,96,99,102,132,25,92,93,94,95,96,97,98,99,100,101,102,103,104,105,131,132,133,134,135,149,13,14,16,20,23,25,30,31,32,36,37,40,56,57,60,76,98,99,100,104,134,14,33,34,35,36,37,38,39,40,41,58,59,60,61,77,101,102,103,104,105,135,21,107,108,109,111,112,114,117,118,120,123,124,126,129,132,137,138,140,143,146,151,11,110,111,112,113,114,115,119,120,121,125,126,127,130,133,139,140,141,144,147,152,6,7,8,17,21,22,43,44,45,51,52,57,67,68,73,82,117,118,120,129,143,9,10,11,18,21,24,116,117,118,119,120,121,128,129,130,134,142,143,144,148,153,22,47,48,49,51,52,54,55,57,59,70,71,73,75,84,123,124,126,129,132,146,24,122,123,124,125,126,127,128,129,130,131,132,133,134,135,145,146,147,148,149,154,12,13,15,19,22,24,50,51,52,56,57,60,72,73,76,85,128,129,130,134,148,13,53,54,55,56,57,58,59,60,61,74,75,76,77,86,131,132,133,134,135,149,6,63,64,65,67,68,70,71,73,75,79,80,82,84,88,137,138,140,143,146,151,9,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,1,2,3,6,9,12,66,67,68,72,73,76,81,82,85,89,142,143,144,148,153,12,69,70,71,72,73,74,75,76,77,83,84,85,86,90,145,146,147,148,149,154,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,150,151,152,153,154,155,23,27,28,29,31,32,34,35,37,39,54,55,57,59,75,93,94,96,99,102,132,25,92,93,94,95,96,97,98,99,100,101,102,103,104,105,131,132,133,134,135,149,13,14,16,20,23,25,30,31,32,36,37,40,56,57,60,76,98,99,100,104,134,14,33,34,35,36,37,38,39,40,41,58,59,60,61,77,101,102,103,104,105,135,21,107,108,109,111,112,114,117,118,120,123,124,126,129,132,137,138,140,143,146,151,11,110,111,112,113,114,115,119,120,121,125,126,127,130,133,139,140,141,144,147,152,6,7,8,17,21,22,43,44,45,51,52,57,67,68,73,82,117,118,120,129,143,9,10,11,18,21,24,116,117,118,119,120,121,128,129,130,134,142,143,144,148,153,22,47,48,49,51,52,54,55,57,59,70,71,73,75,84,123,124,126,129,132,146,24,122,123,124,125,126,127,128,129,130,131,132,133,134,135,145,146,147,148,149,154,12,13,15,19,22,24,50,51,52,56,57,60,72,73,76,85,128,129,130,134,148,13,53,54,55,56,57,58,59,60,61,74,75,76,77,86,131,132,133,134,135,149,6,63,64,65,67,68,70,71,73,75,79,80,82,84,88,137,138,140,143,146,151,9,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,1,2,3,6,9,12,66,67,68,72,73,76,81,82,85,89,142,143,144,148,153,12,69,70,71,72,73,74,75,76,77,83,84,85,86,90,145,146,147,148,149,154,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,150,151,152,153,154,155,20,26,27,28,30,31,33,34,36,38,53,54,56,58,74,92,93,95,98,101,131,23,27,28,29,31,32,34,35,37,39,54,55,57,59,75,93,94,96,99,102,132,25,92,93,94,95,96,97,98,99,100,101,102,103,104,105,131,132,133,134,135,149,13,14,16,20,23,25,30,31,32,36,37,40,56,57,60,76,98,99,100,104,134,14,33,34,35,36,37,38,39,40,41,58,59,60,61,77,101,102,103,104,105,135,18,106,107,108,110,111,113,116,117,119,122,123,125,128,131,136,137,139,142,145,150,21,107,108,109,111,112,114,117,118,120,123,124,126,129,132,137,138,140,143,146,151,11,110,111,112,113,114,115,119,120,121,125,126,127,130,133,139,140,141,144,147,152,3,4,5,17,18,19,42,43,44,50,51,56,66,67,72,81,116,117,119,128,142,6,7,8,17,21,22,43,44,45,51,52,57,67,68,73,82,117,118,120,129,143,9,10,11,18,21,24,116,117,118,119,120,121,128,129,130,134,142,143,144,148,153,19,46,47,48,50,51,53,54,56,58,69,70,72,74,83,122,123,125,128,131,145,22,47,48,49,51,52,54,55,57,59,70,71,73,75,84,123,124,126,129,132,146,24,122,123,124,125,126,127,128,129,130,131,132,133,134,135,145,146,147,148,149,154,12,13,15,19,22,24,50,51,52,56,57,60,72,73,76,85,128,129,130,134,148,13,53,54,55,56,57,58,59,60,61,74,75,76,77,86,131,132,133,134,135,149,3,62,63,64,66,67,69,70,72,74,78,79,81,83,87,136,137,139,142,145,150,6,63,64,65,67,68,70,71,73,75,79,80,82,84,88,137,138,140,143,146,151,9,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,1,2,3,6,9,12,66,67,68,72,73,76,81,82,85,89,142,143,144,148,153,12,69,70,71,72,73,74,75,76,77,83,84,85,86,90,145,146,147,148,149,154,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,150,151,152,153,154,155];
    kx = [57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,57,87,123,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,109,79,55,37,43,49,1,13,61,67,85,91,115,121,19,25,31,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,109,55,37,43,49,79,1,13,61,67,85,91,115,121,19,25,31,73,103,109,55,43,37,49,79,1,13,61,67,85,91,115,121,19,25,31,73,103,109,55,49,37,43,79,1,13,19,25,31,61,67,73,85,91,103,115,121,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,109,79,55,37,43,49,1,13,61,67,85,91,115,121,19,25,31,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,109,55,37,43,49,79,1,13,61,67,85,91,115,121,19,25,31,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,55,1,13,37,43,61,67,79,85,91,109,115,121,19,25,31,49,73,103,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,110,80,56,38,44,50,2,14,62,68,86,92,116,122,20,26,32,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,110,56,38,44,50,80,2,14,62,68,86,92,116,122,20,26,32,74,104,110,56,44,38,50,80,2,14,62,68,86,92,116,122,20,26,32,74,104,110,56,50,38,44,80,2,14,20,26,32,62,68,74,86,92,104,116,122,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,110,80,56,38,44,50,2,14,62,68,86,92,116,122,20,26,32,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,110,56,38,44,50,80,2,14,62,68,86,92,116,122,20,26,32,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,56,2,14,38,44,62,68,80,86,92,110,116,122,20,26,32,50,74,104,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,112,82,58,40,46,52,4,10,16,64,70,88,94,100,118,124,22,28,34,76,106,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,112,58,46,40,52,82,4,10,16,64,70,88,94,100,118,124,22,28,34,76,106,112,58,52,40,46,82,4,10,16,22,28,34,64,70,76,88,94,100,106,118,124,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,112,82,58,40,46,52,4,10,16,64,70,88,94,100,118,124,22,28,34,76,106,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,112,58,40,46,52,82,4,10,16,64,70,88,94,100,118,124,22,28,34,76,106,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,58,4,10,16,40,46,64,70,82,88,94,100,112,118,124,22,28,34,52,76,106,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,113,83,59,41,47,53,5,11,17,65,71,89,95,101,119,125,23,29,35,77,107,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,113,59,47,41,53,83,5,11,17,65,71,89,95,101,119,125,23,29,35,77,107,113,59,53,41,47,83,5,11,17,23,29,35,65,71,77,89,95,101,107,119,125,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,113,83,59,41,47,53,5,11,17,65,71,89,95,101,119,125,23,29,35,77,107,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,113,59,41,47,53,83,5,11,17,65,71,89,95,101,119,125,23,29,35,77,107,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,59,5,11,17,41,47,65,71,83,89,95,101,113,119,125,23,29,35,53,77,107,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,114,84,60,42,48,54,6,12,18,66,72,90,96,102,120,126,24,30,36,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,114,60,42,48,54,84,6,12,18,66,72,90,96,102,120,126,24,30,36,78,108,114,60,48,42,54,84,6,12,18,66,72,90,96,102,120,126,24,30,36,78,108,114,60,54,42,48,84,6,12,18,24,30,36,66,72,78,90,96,102,108,120,126,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,114,84,60,42,48,54,6,12,18,66,72,90,96,102,120,126,24,30,36,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,114,60,42,48,54,84,6,12,18,66,72,90,96,102,120,126,24,30,36,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108,60,6,12,18,42,48,66,72,84,90,96,102,114,120,126,24,30,36,54,78,108];
    M = sparse(ix,jx,C(kx),124,155);

    M = M(26:end,26:end)-M(26:end,1:25)*M0; % Schur complement reduction

    [L,~,P] = lu(M(:,1:27));
    P = P';
    M = [P*L P(:,28:end)]\M(:,28:end);
    M = full(M(28:end,:));

    [L,U,P] = lu(M(:,1:39));
    P = P';
    M = [P*L P(:,40:end)]\M(:,40:end);
    M1 = M(1:39,:);
    M2 = M(40:end,:);

    [Q,R,P] = qr(M2(:,1:end-6));
    A = U\[M1(:,1:end-6)*P M1(:,end-5:end)];
    B = R(:,1:33)\[R(:,34:end) Q'*M2(:,end-5:end)];
    M = [-A(:,end-30:end)+A(:,1:end-31)*B; -B];

    P1 = [65:103 (1:58)*P 59:64];
    P2 = [65,66,67,40,41,42,68,69,43,70,71,44,72,73,74,75,76,77,45,46,47,48,49,50,78,79,80,51,52,53,81,82,83,54,55,56,84,85,57,86,87,58,88,89,90,91,92,59,60,61,93,94,62,95,96,63,97,98,99,100,64,101,102,103];
    T = getT(M,P1(1:end-31),P1(end-30:end),P2);

    [V,~] = eig(T);
    S = V(26:30,:)./repmat(V(31,:),5,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end