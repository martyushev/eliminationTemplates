% Input: coefficient matrix C of size 5x28
% Output: solution matrix S of size 5x36

function S = red_72x108_colpiv_relpose_4pt(C)

    M = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72],[3,4,7,14,15,16,18,21,22,29,30,34,41,42,43,61,63,66,70,76,77,81,82,90,104,105,122,5,8,9,10,14,25,27,28,29,30,51,53,56,60,61,62,63,73,74,76,78,82,83,91,105,106,123,1,2,3,5,6,7,9,11,12,13,16,17,18,19,20,23,24,25,26,28,36,49,69,72,16,29,32,34,38,41,42,44,45,61,62,64,65,66,70,76,77,79,84,85,92,107,108,124,25,51,52,53,54,55,56,57,61,62,64,65,73,74,76,78,80,85,86,93,108,109,125,12,16,17,24,25,26,34,48,56,66,67,68,69,71,72,74,75,77,78,94,126,34,38,39,40,46,48,56,57,58,59,68,71,79,80,95,127,18,30,38,43,44,45,63,64,66,70,76,101,102,104,105,107,108,110,111,113,115,119,120,122,124,128,133,27,28,54,57,60,63,64,65,73,74,76,102,103,105,106,108,109,111,112,114,116,120,121,123,125,129,134,11,13,18,19,23,26,28,35,47,49,66,67,68,69,72,74,75,113,114,122,123,126,130,135,26,37,38,39,40,50,57,58,66,67,68,71,72,74,75,115,116,124,125,126,127,131,136,23,31,33,35,37,39,47,50,67,75,113,114,115,116,117,118,128,129,130,131,132,137,7,14,32,41,61,77,79,81,82,84,85,87,88,90,92,96,104,105,107,108,110,111,119,120,122,124,133,5,8,51,61,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,120,121,123,125,134,1,2,5,7,9,12,13,16,18,25,28,34,66,74,77,78,90,91,94,98,113,114,122,123,126,135,12,25,34,38,56,57,66,74,77,78,79,80,92,93,94,95,99,115,116,124,125,126,127,136,13,28,38,66,74,113,114,115,116,117,118,122,123,124,125,126,127,128,129,130,131,133,134,135,136,137,138,1,5,77,78,79,90,91,92,93,94,95,96,97,98,99,100,122,123,124,125,128,129,133,134,135,136,138,3,4,7,14,15,16,18,21,22,29,30,34,41,42,43,61,63,66,70,76,77,81,82,90,104,105,122,5,8,9,10,14,25,27,28,29,30,51,53,56,60,61,62,63,73,74,76,78,82,83,91,105,106,123,1,2,3,5,6,7,9,11,12,13,16,17,18,19,20,23,24,25,26,28,36,49,69,72,16,29,32,34,38,41,42,44,45,61,62,64,65,66,70,76,77,79,84,85,92,107,108,124,25,51,52,53,54,55,56,57,61,62,64,65,73,74,76,78,80,85,86,93,108,109,125,12,16,17,24,25,26,34,48,56,66,67,68,69,71,72,74,75,77,78,94,126,34,38,39,40,46,48,56,57,58,59,68,71,79,80,95,127,18,30,38,43,44,45,63,64,66,70,76,101,102,104,105,107,108,110,111,113,115,119,120,122,124,128,133,27,28,54,57,60,63,64,65,73,74,76,102,103,105,106,108,109,111,112,114,116,120,121,123,125,129,134,11,13,18,19,23,26,28,35,47,49,66,67,68,69,72,74,75,113,114,122,123,126,130,135,26,37,38,39,40,50,57,58,66,67,68,71,72,74,75,115,116,124,125,126,127,131,136,23,31,33,35,37,39,47,50,67,75,113,114,115,116,117,118,128,129,130,131,132,137,7,14,32,41,61,77,79,81,82,84,85,87,88,90,92,96,104,105,107,108,110,111,119,120,122,124,133,5,8,51,61,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,120,121,123,125,134,1,2,5,7,9,12,13,16,18,25,28,34,66,74,77,78,90,91,94,98,113,114,122,123,126,135,12,25,34,38,56,57,66,74,77,78,79,80,92,93,94,95,99,115,116,124,125,126,127,136,13,28,38,66,74,113,114,115,116,117,118,122,123,124,125,126,127,128,129,130,131,133,134,135,136,137,138,1,5,77,78,79,90,91,92,93,94,95,96,97,98,99,100,122,123,124,125,128,129,133,134,135,136,138,3,4,7,14,15,16,18,21,22,29,30,34,41,42,43,61,63,66,70,76,77,81,82,90,104,105,122,5,8,9,10,14,25,27,28,29,30,51,53,56,60,61,62,63,73,74,76,78,82,83,91,105,106,123,1,2,3,5,6,7,9,11,12,13,16,17,18,19,20,23,24,25,26,28,36,49,69,72,16,29,32,34,38,41,42,44,45,61,62,64,65,66,70,76,77,79,84,85,92,107,108,124,25,51,52,53,54,55,56,57,61,62,64,65,73,74,76,78,80,85,86,93,108,109,125,12,16,17,24,25,26,34,48,56,66,67,68,69,71,72,74,75,77,78,94,126,34,38,39,40,46,48,56,57,58,59,68,71,79,80,95,127,18,30,38,43,44,45,63,64,66,70,76,101,102,104,105,107,108,110,111,113,115,119,120,122,124,128,133,27,28,54,57,60,63,64,65,73,74,76,102,103,105,106,108,109,111,112,114,116,120,121,123,125,129,134,11,13,18,19,23,26,28,35,47,49,66,67,68,69,72,74,75,113,114,122,123,126,130,135,26,37,38,39,40,50,57,58,66,67,68,71,72,74,75,115,116,124,125,126,127,131,136,23,31,33,35,37,39,47,50,67,75,113,114,115,116,117,118,128,129,130,131,132,137,7,14,32,41,61,77,79,81,82,84,85,87,88,90,92,96,104,105,107,108,110,111,119,120,122,124,133,5,8,51,61,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,120,121,123,125,134,1,2,5,7,9,12,13,16,18,25,28,34,66,74,77,78,90,91,94,98,113,114,122,123,126,135,12,25,34,38,56,57,66,74,77,78,79,80,92,93,94,95,99,115,116,124,125,126,127,136,13,28,38,66,74,113,114,115,116,117,118,122,123,124,125,126,127,128,129,130,131,133,134,135,136,137,138,1,5,77,78,79,90,91,92,93,94,95,96,97,98,99,100,122,123,124,125,128,129,133,134,135,136,138,3,4,7,14,15,16,18,21,22,29,30,34,41,42,43,61,63,66,70,76,77,81,82,90,104,105,122,5,8,9,10,14,25,27,28,29,30,51,53,56,60,61,62,63,73,74,76,78,82,83,91,105,106,123,1,2,3,5,6,7,9,11,12,13,16,17,18,19,20,23,24,25,26,28,36,49,69,72,16,29,32,34,38,41,42,44,45,61,62,64,65,66,70,76,77,79,84,85,92,107,108,124,25,51,52,53,54,55,56,57,61,62,64,65,73,74,76,78,80,85,86,93,108,109,125,12,16,17,24,25,26,34,48,56,66,67,68,69,71,72,74,75,77,78,94,126,34,38,39,40,46,48,56,57,58,59,68,71,79,80,95,127,18,30,38,43,44,45,63,64,66,70,76,101,102,104,105,107,108,110,111,113,115,119,120,122,124,128,133,27,28,54,57,60,63,64,65,73,74,76,102,103,105,106,108,109,111,112,114,116,120,121,123,125,129,134,11,13,18,19,23,26,28,35,47,49,66,67,68,69,72,74,75,113,114,122,123,126,130,135,26,37,38,39,40,50,57,58,66,67,68,71,72,74,75,115,116,124,125,126,127,131,136,23,31,33,35,37,39,47,50,67,75,113,114,115,116,117,118,128,129,130,131,132,137,7,14,32,41,61,77,79,81,82,84,85,87,88,90,92,96,104,105,107,108,110,111,119,120,122,124,133,5,8,51,61,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,120,121,123,125,134,1,2,5,7,9,12,13,16,18,25,28,34,66,74,77,78,90,91,94,98,113,114,122,123,126,135,12,25,34,38,56,57,66,74,77,78,79,80,92,93,94,95,99,115,116,124,125,126,127,136,13,28,38,66,74,113,114,115,116,117,118,122,123,124,125,126,127,128,129,130,131,133,134,135,136,137,138,1,5,77,78,79,90,91,92,93,94,95,96,97,98,99,100,122,123,124,125,128,129,133,134,135,136,138],C([61,51,121,56,1,76,96,6,21,11,26,81,66,16,41,71,46,101,31,36,126,111,116,136,86,91,131,121,56,61,1,51,76,26,96,6,21,71,11,81,46,66,16,41,36,101,31,126,111,116,136,86,91,131,136,121,51,116,1,111,56,96,126,131,66,16,86,41,6,46,11,71,101,91,21,26,31,36,61,1,66,76,101,51,6,41,31,56,11,46,36,96,21,26,121,126,111,116,136,86,91,131,61,56,11,1,46,36,76,101,51,6,41,31,26,96,21,121,126,111,116,136,86,91,131,121,51,6,1,56,96,66,11,71,86,41,31,21,36,26,91,46,111,116,136,131,51,86,41,31,11,1,56,91,46,36,21,26,111,116,136,131,61,1,81,21,31,16,26,36,76,6,11,41,46,51,56,66,71,86,91,96,101,111,116,121,126,131,136,1,61,36,81,26,21,31,16,11,76,6,41,46,51,56,66,71,86,91,96,101,111,116,121,126,131,136,61,121,51,21,26,76,56,41,46,1,66,31,16,6,11,71,36,86,91,111,116,126,131,136,61,41,66,31,16,46,71,36,51,21,6,11,1,56,26,86,91,111,116,121,126,131,136,1,41,46,21,31,16,26,36,6,11,51,56,66,71,86,91,111,116,121,126,131,136,61,1,16,6,11,76,81,51,56,66,71,111,116,121,126,136,21,26,31,36,41,46,86,91,96,101,131,61,1,11,6,76,81,51,56,66,71,111,116,121,126,136,21,26,31,36,41,46,86,91,96,101,131,121,61,56,51,1,76,96,6,21,11,26,16,31,36,66,71,111,116,126,136,41,46,86,91,101,131,61,1,6,31,11,36,21,26,51,56,66,71,111,116,121,126,136,41,46,86,91,96,101,131,61,1,16,6,11,21,26,31,36,41,46,51,56,66,71,76,81,86,91,96,101,111,116,121,126,131,136,61,1,6,11,16,51,56,66,71,76,81,111,116,121,126,136,21,26,31,36,41,46,86,91,96,101,131,62,52,122,57,2,77,97,7,22,12,27,82,67,17,42,72,47,102,32,37,127,112,117,137,87,92,132,122,57,62,2,52,77,27,97,7,22,72,12,82,47,67,17,42,37,102,32,127,112,117,137,87,92,132,137,122,52,117,2,112,57,97,127,132,67,17,87,42,7,47,12,72,102,92,22,27,32,37,62,2,67,77,102,52,7,42,32,57,12,47,37,97,22,27,122,127,112,117,137,87,92,132,62,57,12,2,47,37,77,102,52,7,42,32,27,97,22,122,127,112,117,137,87,92,132,122,52,7,2,57,97,67,12,72,87,42,32,22,37,27,92,47,112,117,137,132,52,87,42,32,12,2,57,92,47,37,22,27,112,117,137,132,62,2,82,22,32,17,27,37,77,7,12,42,47,52,57,67,72,87,92,97,102,112,117,122,127,132,137,2,62,37,82,27,22,32,17,12,77,7,42,47,52,57,67,72,87,92,97,102,112,117,122,127,132,137,62,122,52,22,27,77,57,42,47,2,67,32,17,7,12,72,37,87,92,112,117,127,132,137,62,42,67,32,17,47,72,37,52,22,7,12,2,57,27,87,92,112,117,122,127,132,137,2,42,47,22,32,17,27,37,7,12,52,57,67,72,87,92,112,117,122,127,132,137,62,2,17,7,12,77,82,52,57,67,72,112,117,122,127,137,22,27,32,37,42,47,87,92,97,102,132,62,2,12,7,77,82,52,57,67,72,112,117,122,127,137,22,27,32,37,42,47,87,92,97,102,132,122,62,57,52,2,77,97,7,22,12,27,17,32,37,67,72,112,117,127,137,42,47,87,92,102,132,62,2,7,32,12,37,22,27,52,57,67,72,112,117,122,127,137,42,47,87,92,97,102,132,62,2,17,7,12,22,27,32,37,42,47,52,57,67,72,77,82,87,92,97,102,112,117,122,127,132,137,62,2,7,12,17,52,57,67,72,77,82,112,117,122,127,137,22,27,32,37,42,47,87,92,97,102,132,63,53,123,58,3,78,98,8,23,13,28,83,68,18,43,73,48,103,33,38,128,113,118,138,88,93,133,123,58,63,3,53,78,28,98,8,23,73,13,83,48,68,18,43,38,103,33,128,113,118,138,88,93,133,138,123,53,118,3,113,58,98,128,133,68,18,88,43,8,48,13,73,103,93,23,28,33,38,63,3,68,78,103,53,8,43,33,58,13,48,38,98,23,28,123,128,113,118,138,88,93,133,63,58,13,3,48,38,78,103,53,8,43,33,28,98,23,123,128,113,118,138,88,93,133,123,53,8,3,58,98,68,13,73,88,43,33,23,38,28,93,48,113,118,138,133,53,88,43,33,13,3,58,93,48,38,23,28,113,118,138,133,63,3,83,23,33,18,28,38,78,8,13,43,48,53,58,68,73,88,93,98,103,113,118,123,128,133,138,3,63,38,83,28,23,33,18,13,78,8,43,48,53,58,68,73,88,93,98,103,113,118,123,128,133,138,63,123,53,23,28,78,58,43,48,3,68,33,18,8,13,73,38,88,93,113,118,128,133,138,63,43,68,33,18,48,73,38,53,23,8,13,3,58,28,88,93,113,118,123,128,133,138,3,43,48,23,33,18,28,38,8,13,53,58,68,73,88,93,113,118,123,128,133,138,63,3,18,8,13,78,83,53,58,68,73,113,118,123,128,138,23,28,33,38,43,48,88,93,98,103,133,63,3,13,8,78,83,53,58,68,73,113,118,123,128,138,23,28,33,38,43,48,88,93,98,103,133,123,63,58,53,3,78,98,8,23,13,28,18,33,38,68,73,113,118,128,138,43,48,88,93,103,133,63,3,8,33,13,38,23,28,53,58,68,73,113,118,123,128,138,43,48,88,93,98,103,133,63,3,18,8,13,23,28,33,38,43,48,53,58,68,73,78,83,88,93,98,103,113,118,123,128,133,138,63,3,8,13,18,53,58,68,73,78,83,113,118,123,128,138,23,28,33,38,43,48,88,93,98,103,133,64,54,124,59,4,79,99,9,24,14,29,84,69,19,44,74,49,104,34,39,129,114,119,139,89,94,134,124,59,64,4,54,79,29,99,9,24,74,14,84,49,69,19,44,39,104,34,129,114,119,139,89,94,134,139,124,54,119,4,114,59,99,129,134,69,19,89,44,9,49,14,74,104,94,24,29,34,39,64,4,69,79,104,54,9,44,34,59,14,49,39,99,24,29,124,129,114,119,139,89,94,134,64,59,14,4,49,39,79,104,54,9,44,34,29,99,24,124,129,114,119,139,89,94,134,124,54,9,4,59,99,69,14,74,89,44,34,24,39,29,94,49,114,119,139,134,54,89,44,34,14,4,59,94,49,39,24,29,114,119,139,134,64,4,84,24,34,19,29,39,79,9,14,44,49,54,59,69,74,89,94,99,104,114,119,124,129,134,139,4,64,39,84,29,24,34,19,14,79,9,44,49,54,59,69,74,89,94,99,104,114,119,124,129,134,139,64,124,54,24,29,79,59,44,49,4,69,34,19,9,14,74,39,89,94,114,119,129,134,139,64,44,69,34,19,49,74,39,54,24,9,14,4,59,29,89,94,114,119,124,129,134,139,4,44,49,24,34,19,29,39,9,14,54,59,69,74,89,94,114,119,124,129,134,139,64,4,19,9,14,79,84,54,59,69,74,114,119,124,129,139,24,29,34,39,44,49,89,94,99,104,134,64,4,14,9,79,84,54,59,69,74,114,119,124,129,139,24,29,34,39,44,49,89,94,99,104,134,124,64,59,54,4,79,99,9,24,14,29,19,34,39,69,74,114,119,129,139,44,49,89,94,104,134,64,4,9,34,14,39,24,29,54,59,69,74,114,119,124,129,139,44,49,89,94,99,104,134,64,4,19,9,14,24,29,34,39,44,49,54,59,69,74,79,84,89,94,99,104,114,119,124,129,134,139,64,4,9,14,19,54,59,69,74,79,84,114,119,124,129,139,24,29,34,39,44,49,89,94,99,104,134]),72,138);

    M0 = sparse([1,1,1,2,2,3,3,3,4,4,4,5,5,5,6,6,6,6,6,6,7,7,7,8,8,9,9,9,10,10,10,11,12,12,13,13,13,14,14,15,15,15,16,16,17,17,18,18,18,19,19,19,20,20,21,21,22,22,22,23,23,23,24,24,24,25,25,26,27,27,27,28,28,28,29,29,30,30,30],[65,70,107,68,100,4,60,83,2,57,80,50,67,99,3,18,28,50,67,99,49,66,98,59,82,26,61,84,22,30,53,105,69,101,97,102,108,58,81,32,33,52,62,85,9,49,8,87,103,1,9,98,37,47,14,54,15,71,89,3,28,99,16,45,48,63,86,106,25,73,91,27,88,104,34,55,35,72,90],[1,-1,1,-1,1,1,-1,1,1,-1,1,1,-1,1,-1,1,-1,1,-1,2,1,-1,1,-1,1,1,-1,1,1,1,-1,-1,-1,1,1,1,-1,-1,1,1,1,-1,-1,1,1,-1,1,1,-1,1,1,-1,1,-1,1,-1,1,1,-1,1,1,-1,1,1,-1,-1,1,-1,1,1,-1,1,1,-1,1,-1,1,1,-1],30,108);
    M = M(:,31:end)-M(:,1:30)*M0; % Schur complement reduction

    [L,~,P] = lu(M(:,1:50));
    P = P';
    M = [P*L P(:,51:end)]\M(:,51:end);
    M = full(M(51:end,:));

    [L,U,P] = lu(M(:,1:20));
    P = P';
    M = [P*L P(:,21:end)]\M(:,21:end);
    M1 = M(1:20,:);
    M2 = M(21:end,:);

    [Q,R,P] = qr(M2(:,1:end-6));
    A = U\[M1(:,1:end-6)*P M1(:,end-5:end)];
    B = R(:,1:2)\[R(:,3:end) Q'*M2(:,end-5:end)];
    M = [-A(:,end-35:end)+A(:,1:end-36)*B; -B];

    P1 = [39:58 (1:32)*P 33:38];
    P2 = [10,11,12,39,40,41,42,43,44,19,20,21,22,23,24,25,28,29,45,46,47,48,49,50,51,52,53,33,34,35,36,37,54,55,56,57,38,58];
    T = getT(M,P1(1:end-36),P1(end-35:end),P2);

    [V,~] = eig(T);
    S = V(31:35,:)./repmat(V(36,:),5,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end