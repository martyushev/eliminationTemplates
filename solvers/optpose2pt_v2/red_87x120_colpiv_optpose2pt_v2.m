% Input: coefficient matrix C of size 6x21
% Output: solution matrix S of size 5x33

function S = red_87x120_colpiv_optpose2pt_v2(C)

    M = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87],[19,26,27,28,30,31,33,34,36,38,57,58,60,62,74,93,95,98,101,22,92,94,95,96,97,98,99,100,101,102,103,104,105,121,123,124,125,139,24,27,28,29,31,32,34,35,37,39,58,59,61,63,75,96,97,100,103,12,13,16,19,22,24,30,31,32,36,37,40,60,61,64,76,99,100,104,13,33,34,35,36,37,38,39,40,41,62,63,64,65,77,102,103,104,105,3,10,14,17,18,25,42,43,44,50,51,60,66,67,72,81,107,109,118,4,5,6,20,21,25,106,108,109,110,111,118,119,120,124,132,134,138,143,7,8,9,17,20,23,43,44,45,51,52,61,67,68,73,82,110,111,120,18,46,47,48,50,51,57,58,60,62,69,70,72,74,83,113,115,118,121,21,112,114,115,116,117,118,119,120,121,122,123,124,125,135,137,138,139,144,23,47,48,49,51,52,58,59,61,63,70,71,73,75,84,116,117,120,123,11,12,15,18,21,23,50,51,52,60,61,64,72,73,76,85,119,120,124,12,57,58,59,60,61,62,63,64,65,74,75,76,77,86,122,123,124,125,3,53,54,55,66,67,69,70,72,74,78,79,81,83,87,127,129,132,135,4,126,128,129,130,131,132,133,134,135,136,137,138,139,140,142,143,144,145,7,54,55,56,67,68,70,71,73,75,79,80,82,84,88,130,131,134,137,1,2,3,4,7,11,66,67,68,72,73,76,81,82,85,89,133,134,138,11,69,70,71,72,73,74,75,76,77,83,84,85,86,90,136,137,138,139,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,141,142,143,144,19,26,27,28,30,31,33,34,36,38,57,58,60,62,74,93,95,98,101,22,92,94,95,96,97,98,99,100,101,102,103,104,105,121,123,124,125,139,24,27,28,29,31,32,34,35,37,39,58,59,61,63,75,96,97,100,103,12,13,16,19,22,24,30,31,32,36,37,40,60,61,64,76,99,100,104,13,33,34,35,36,37,38,39,40,41,62,63,64,65,77,102,103,104,105,3,10,14,17,18,25,42,43,44,50,51,60,66,67,72,81,107,109,118,4,5,6,20,21,25,106,108,109,110,111,118,119,120,124,132,134,138,143,7,8,9,17,20,23,43,44,45,51,52,61,67,68,73,82,110,111,120,18,46,47,48,50,51,57,58,60,62,69,70,72,74,83,113,115,118,121,21,112,114,115,116,117,118,119,120,121,122,123,124,125,135,137,138,139,144,23,47,48,49,51,52,58,59,61,63,70,71,73,75,84,116,117,120,123,11,12,15,18,21,23,50,51,52,60,61,64,72,73,76,85,119,120,124,12,57,58,59,60,61,62,63,64,65,74,75,76,77,86,122,123,124,125,3,53,54,55,66,67,69,70,72,74,78,79,81,83,87,127,129,132,135,4,126,128,129,130,131,132,133,134,135,136,137,138,139,140,142,143,144,145,7,54,55,56,67,68,70,71,73,75,79,80,82,84,88,130,131,134,137,1,2,3,4,7,11,66,67,68,72,73,76,81,82,85,89,133,134,138,11,69,70,71,72,73,74,75,76,77,83,84,85,86,90,136,137,138,139,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,141,142,143,144,22,92,93,94,95,96,97,98,99,100,101,102,103,104,105,121,122,123,124,125,139,24,27,28,29,31,32,34,35,37,39,58,59,61,63,75,95,96,97,100,103,123,12,13,16,19,22,24,30,31,32,36,37,40,60,61,64,76,98,99,100,104,124,13,33,34,35,36,37,38,39,40,41,62,63,64,65,77,101,102,103,104,105,125,4,5,6,20,21,25,106,107,108,109,110,111,118,119,120,124,132,133,134,138,143,7,8,9,17,20,23,43,44,45,51,52,61,67,68,73,82,109,110,111,120,134,21,112,113,114,115,116,117,118,119,120,121,122,123,124,125,135,136,137,138,139,144,23,47,48,49,51,52,58,59,61,63,70,71,73,75,84,115,116,117,120,123,137,11,12,15,18,21,23,50,51,52,60,61,64,72,73,76,85,118,119,120,124,138,12,57,58,59,60,61,62,63,64,65,74,75,76,77,86,121,122,123,124,125,139,4,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,7,54,55,56,67,68,70,71,73,75,79,80,82,84,88,129,130,131,134,137,142,1,2,3,4,7,11,66,67,68,72,73,76,81,82,85,89,132,133,134,138,143,11,69,70,71,72,73,74,75,76,77,83,84,85,86,90,135,136,137,138,139,144,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,140,141,142,143,144,145,22,92,93,94,95,96,97,98,99,100,101,102,103,104,105,121,122,123,124,125,139,24,27,28,29,31,32,34,35,37,39,58,59,61,63,75,95,96,97,100,103,123,12,13,16,19,22,24,30,31,32,36,37,40,60,61,64,76,98,99,100,104,124,13,33,34,35,36,37,38,39,40,41,62,63,64,65,77,101,102,103,104,105,125,4,5,6,20,21,25,106,107,108,109,110,111,118,119,120,124,132,133,134,138,143,7,8,9,17,20,23,43,44,45,51,52,61,67,68,73,82,109,110,111,120,134,21,112,113,114,115,116,117,118,119,120,121,122,123,124,125,135,136,137,138,139,144,23,47,48,49,51,52,58,59,61,63,70,71,73,75,84,115,116,117,120,123,137,11,12,15,18,21,23,50,51,52,60,61,64,72,73,76,85,118,119,120,124,138,12,57,58,59,60,61,62,63,64,65,74,75,76,77,86,121,122,123,124,125,139,4,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,7,54,55,56,67,68,70,71,73,75,79,80,82,84,88,129,130,131,134,137,142,1,2,3,4,7,11,66,67,68,72,73,76,81,82,85,89,132,133,134,138,143,11,69,70,71,72,73,74,75,76,77,83,84,85,86,90,135,136,137,138,139,144,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,140,141,142,143,144,145,19,26,27,28,30,31,33,34,36,38,57,58,60,62,74,92,93,95,98,101,121,22,92,93,94,95,96,97,98,99,100,101,102,103,104,105,121,122,123,124,125,139,24,27,28,29,31,32,34,35,37,39,58,59,61,63,75,95,96,97,100,103,123,12,13,16,19,22,24,30,31,32,36,37,40,60,61,64,76,98,99,100,104,124,13,33,34,35,36,37,38,39,40,41,62,63,64,65,77,101,102,103,104,105,125,3,10,14,17,18,25,42,43,44,50,51,60,66,67,72,81,106,107,109,118,132,4,5,6,20,21,25,106,107,108,109,110,111,118,119,120,124,132,133,134,138,143,7,8,9,17,20,23,43,44,45,51,52,61,67,68,73,82,109,110,111,120,134,18,46,47,48,50,51,57,58,60,62,69,70,72,74,83,112,113,115,118,121,135,21,112,113,114,115,116,117,118,119,120,121,122,123,124,125,135,136,137,138,139,144,23,47,48,49,51,52,58,59,61,63,70,71,73,75,84,115,116,117,120,123,137,11,12,15,18,21,23,50,51,52,60,61,64,72,73,76,85,118,119,120,124,138,12,57,58,59,60,61,62,63,64,65,74,75,76,77,86,121,122,123,124,125,139,3,53,54,55,66,67,69,70,72,74,78,79,81,83,87,126,127,129,132,135,140,4,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,7,54,55,56,67,68,70,71,73,75,79,80,82,84,88,129,130,131,134,137,142,1,2,3,4,7,11,66,67,68,72,73,76,81,82,85,89,132,133,134,138,143,11,69,70,71,72,73,74,75,76,77,83,84,85,86,90,135,136,137,138,139,144,1,78,79,80,81,82,83,84,85,86,87,88,89,90,91,140,141,142,143,144,145],C([55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,109,79,55,37,43,49,1,19,31,61,73,85,91,103,115,121,13,25,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,109,37,55,49,79,43,1,19,31,61,73,85,91,103,115,121,13,25,67,109,55,43,49,79,37,1,13,19,25,31,61,67,73,85,91,103,115,121,109,55,49,37,43,79,1,19,31,61,73,85,91,103,115,121,13,25,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,109,79,55,37,43,49,1,19,31,61,73,85,91,103,115,121,13,25,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,55,1,13,19,25,31,37,43,49,61,67,73,79,85,91,103,109,115,121,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,109,55,37,43,49,79,1,19,31,61,73,85,91,103,115,121,13,25,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,55,1,19,31,37,49,61,73,79,85,91,103,109,115,121,13,25,43,67,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,110,80,56,38,44,50,2,20,32,62,74,86,92,104,116,122,14,26,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,110,38,56,50,80,44,2,20,32,62,74,86,92,104,116,122,14,26,68,110,56,44,50,80,38,2,14,20,26,32,62,68,74,86,92,104,116,122,110,56,50,38,44,80,2,20,32,62,74,86,92,104,116,122,14,26,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,110,80,56,38,44,50,2,20,32,62,74,86,92,104,116,122,14,26,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,56,2,14,20,26,32,38,44,50,62,68,74,80,86,92,104,110,116,122,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,110,56,38,44,50,80,2,20,32,62,74,86,92,104,116,122,14,26,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,56,2,20,32,38,50,62,74,80,86,92,104,110,116,122,14,26,44,68,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,112,82,58,40,46,52,4,22,34,64,76,88,94,106,118,124,10,16,28,70,100,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,112,58,46,52,82,40,4,10,16,22,28,34,64,70,76,88,94,100,106,118,124,112,58,52,40,46,82,4,22,34,64,76,88,94,106,118,124,10,16,28,70,100,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,112,82,58,40,46,52,4,22,34,64,76,88,94,106,118,124,10,16,28,70,100,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,58,4,10,16,22,28,34,40,46,52,64,70,76,82,88,94,100,106,112,118,124,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,112,58,40,46,52,82,4,22,34,64,76,88,94,106,118,124,10,16,28,70,100,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,58,4,22,34,40,52,64,76,82,88,94,106,112,118,124,10,16,28,46,70,100,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,113,83,59,41,47,53,5,23,35,65,77,89,95,107,119,125,11,17,29,71,101,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,113,59,47,53,83,41,5,11,17,23,29,35,65,71,77,89,95,101,107,119,125,113,59,53,41,47,83,5,23,35,65,77,89,95,107,119,125,11,17,29,71,101,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,113,83,59,41,47,53,5,23,35,65,77,89,95,107,119,125,11,17,29,71,101,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,59,5,11,17,23,29,35,41,47,53,65,71,77,83,89,95,101,107,113,119,125,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,113,59,41,47,53,83,5,23,35,65,77,89,95,107,119,125,11,17,29,71,101,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,59,5,23,35,41,53,65,77,83,89,95,107,113,119,125,11,17,29,47,71,101,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,114,84,60,42,48,54,6,24,36,66,78,90,96,108,120,126,12,18,30,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,114,42,60,54,84,48,6,24,36,66,78,90,96,108,120,126,12,18,30,72,102,114,60,48,54,84,42,6,12,18,24,30,36,66,72,78,90,96,102,108,120,126,114,60,54,42,48,84,6,24,36,66,78,90,96,108,120,126,12,18,30,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,114,84,60,42,48,54,6,24,36,66,78,90,96,108,120,126,12,18,30,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,60,6,12,18,24,30,36,42,48,54,66,72,78,84,90,96,102,108,114,120,126,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,114,60,42,48,54,84,6,24,36,66,78,90,96,108,120,126,12,18,30,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102,60,6,24,36,42,54,66,78,84,90,96,108,114,120,126,12,18,30,48,72,102]),87,145);

    M0 = sparse([1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25,25],[61,66,51,64,49,62,114,120,99,118,97,116,50,63,36,57,34,55,32,53,52,65,40,61,16,52,35,56,39,60,15,51,33,54,37,58,13,49,98,117,100,119,80,114,38,59,14,50,96,115],[1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1],25,120);
    M = M(:,26:end)-M(:,1:25)*M0; % Schur complement reduction

    [L,~,P] = lu(M(:,1:31));
    P = P';
    M = [P*L P(:,32:end)]\M(:,32:end);
    M = full(M(32:end,:));

    [L,U,P] = lu(M(:,1:35));
    P = P';
    M = [P*L P(:,36:end)]\M(:,36:end);
    M1 = M(1:35,:);
    M2 = M(36:end,:);

    [Q,R,P] = qr(M2(:,1:end-6));
    A = U\[M1(:,1:end-6)*P M1(:,end-5:end)];
    B = R(:,1:21)\[R(:,22:end) Q'*M2(:,end-5:end)];
    M = [-A(:,end-32:end)+A(:,1:end-33)*B; -B];

    P1 = [55:89 (1:48)*P 49:54];
    P2 = [55,30,31,56,32,57,58,33,59,60,34,61,62,63,64,41,42,65,43,66,67,44,45,68,46,69,70,47,71,72,48,73,74,75,76,49,50,77,51,78,79,52,80,81,53,82,83,84,85,54,86,87,88,89];
    T = getT(M,P1(1:end-33),P1(end-32:end),P2);

    [V,~] = eig(T);
    S = V(28:32,:)./repmat(V(33,:),5,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end