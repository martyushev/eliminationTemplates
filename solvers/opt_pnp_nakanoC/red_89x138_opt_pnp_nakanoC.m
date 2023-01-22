% Input: coefficient matrix C of size 6x35
% Output: solution matrix S of size 3x49

function S = red_89x138_opt_pnp_nakanoC(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89];
    jx = [5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,1,2,3,4,6,7,8,9,31,32,33,52,53,63,64,65,66,67,68,70,73,74,78,90,91,92,93,95,96,98,101,105,106,108,117,5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,12,13,14,15,16,20,21,22,23,27,28,29,33,38,39,40,41,45,46,47,51,52,57,58,59,61,62,63,66,72,76,80,103,112,122,19,20,21,22,23,26,27,28,29,32,33,44,45,46,47,50,51,52,53,61,63,65,66,67,72,73,76,77,81,103,106,111,112,115,125,25,26,27,28,29,31,32,33,49,50,51,52,53,63,64,65,66,67,68,70,72,73,74,77,78,82,101,103,105,106,108,114,115,117,127,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,37,38,39,40,41,44,45,46,47,50,51,52,53,56,57,58,59,61,62,72,73,76,77,80,81,84,103,106,111,112,115,121,122,125,131,43,44,45,46,47,49,50,51,52,53,61,70,72,73,74,76,77,78,81,82,85,103,105,106,108,110,111,112,114,115,117,124,125,127,133,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,55,56,57,58,59,61,62,72,73,74,76,77,78,80,81,82,84,85,87,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,1,2,3,4,6,7,8,9,31,32,33,52,53,63,64,65,66,67,68,70,73,74,78,90,91,92,93,95,96,98,101,105,106,108,117,5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,12,13,14,15,16,20,21,22,23,27,28,29,33,38,39,40,41,45,46,47,51,52,57,58,59,61,62,63,66,72,76,80,103,112,122,19,20,21,22,23,26,27,28,29,32,33,44,45,46,47,50,51,52,53,61,63,65,66,67,72,73,76,77,81,103,106,111,112,115,125,25,26,27,28,29,31,32,33,49,50,51,52,53,63,64,65,66,67,68,70,72,73,74,77,78,82,101,103,105,106,108,114,115,117,127,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,37,38,39,40,41,44,45,46,47,50,51,52,53,56,57,58,59,61,62,72,73,76,77,80,81,84,103,106,111,112,115,121,122,125,131,43,44,45,46,47,49,50,51,52,53,61,70,72,73,74,76,77,78,81,82,85,103,105,106,108,110,111,112,114,115,117,124,125,127,133,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,55,56,57,58,59,61,62,72,73,74,76,77,78,80,81,82,84,85,87,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,1,2,3,4,6,7,8,9,31,32,33,52,53,63,64,65,66,67,68,70,73,74,78,90,91,92,93,95,96,98,101,105,106,108,117,5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,11,12,13,14,15,19,20,21,22,26,27,28,32,33,37,38,39,40,44,45,46,50,56,57,58,65,103,106,111,112,115,121,122,125,131,12,13,14,15,16,20,21,22,23,27,28,29,33,38,39,40,41,45,46,47,51,52,57,58,59,61,62,63,66,72,76,80,103,112,122,17,18,19,20,21,24,25,26,27,30,31,32,34,42,43,44,45,48,49,50,60,64,100,104,105,107,110,111,113,114,116,123,124,126,132,18,19,20,21,22,25,26,27,28,31,32,33,43,44,45,46,49,50,64,65,101,103,105,106,108,110,111,112,114,115,117,124,125,127,133,19,20,21,22,23,26,27,28,29,32,33,44,45,46,47,50,51,52,53,61,63,65,66,67,72,73,76,77,81,103,106,111,112,115,125,24,25,26,27,28,30,31,32,33,34,48,49,50,64,65,100,101,102,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,25,26,27,28,29,31,32,33,49,50,51,52,53,63,64,65,66,67,68,70,72,73,74,77,78,82,101,103,105,106,108,114,115,117,127,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,35,36,37,38,39,42,43,44,45,48,49,50,54,55,56,57,60,104,105,107,110,111,113,114,116,119,120,121,123,124,126,129,130,132,135,36,37,38,39,40,43,44,45,46,49,50,55,56,57,58,103,105,106,108,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,37,38,39,40,41,44,45,46,47,50,51,52,53,56,57,58,59,61,62,72,73,76,77,80,81,84,103,106,111,112,115,121,122,125,131,42,43,44,45,46,48,49,50,60,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,43,44,45,46,47,49,50,51,52,53,61,70,72,73,74,76,77,78,81,82,85,103,105,106,108,110,111,112,114,115,117,124,125,127,133,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,54,55,56,57,58,60,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,55,56,57,58,59,61,62,72,73,74,76,77,78,80,81,82,84,85,87,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,1,2,3,4,6,7,8,9,31,32,33,52,53,63,64,65,66,67,68,70,73,74,78,90,91,92,93,95,96,98,101,105,106,108,117,5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,11,12,13,14,15,19,20,21,22,26,27,28,32,33,37,38,39,40,44,45,46,50,56,57,58,65,103,106,111,112,115,121,122,125,131,12,13,14,15,16,20,21,22,23,27,28,29,33,38,39,40,41,45,46,47,51,52,57,58,59,61,62,63,66,72,76,80,103,112,122,17,18,19,20,21,24,25,26,27,30,31,32,34,42,43,44,45,48,49,50,60,64,100,104,105,107,110,111,113,114,116,123,124,126,132,18,19,20,21,22,25,26,27,28,31,32,33,43,44,45,46,49,50,64,65,101,103,105,106,108,110,111,112,114,115,117,124,125,127,133,19,20,21,22,23,26,27,28,29,32,33,44,45,46,47,50,51,52,53,61,63,65,66,67,72,73,76,77,81,103,106,111,112,115,125,24,25,26,27,28,30,31,32,33,34,48,49,50,64,65,100,101,102,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,25,26,27,28,29,31,32,33,49,50,51,52,53,63,64,65,66,67,68,70,72,73,74,77,78,82,101,103,105,106,108,114,115,117,127,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,35,36,37,38,39,42,43,44,45,48,49,50,54,55,56,57,60,104,105,107,110,111,113,114,116,119,120,121,123,124,126,129,130,132,135,36,37,38,39,40,43,44,45,46,49,50,55,56,57,58,103,105,106,108,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,37,38,39,40,41,44,45,46,47,50,51,52,53,56,57,58,59,61,62,72,73,76,77,80,81,84,103,106,111,112,115,121,122,125,131,42,43,44,45,46,48,49,50,60,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,43,44,45,46,47,49,50,51,52,53,61,70,72,73,74,76,77,78,81,82,85,103,105,106,108,110,111,112,114,115,117,124,125,127,133,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,54,55,56,57,58,60,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,55,56,57,58,59,61,62,72,73,74,76,77,78,80,81,82,84,85,87,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,1,2,3,4,6,7,8,9,31,32,33,52,53,63,64,65,66,67,68,70,73,74,78,90,91,92,93,95,96,98,101,105,106,108,117,5,6,7,8,9,10,34,53,64,65,66,67,68,69,70,71,74,75,79,91,92,93,94,95,96,97,98,99,100,101,102,107,108,109,118,11,12,13,14,15,19,20,21,22,26,27,28,32,33,37,38,39,40,44,45,46,50,56,57,58,65,103,106,111,112,115,121,122,125,131,12,13,14,15,16,20,21,22,23,27,28,29,33,38,39,40,41,45,46,47,51,52,57,58,59,61,62,63,66,72,76,80,103,112,122,17,18,19,20,21,24,25,26,27,30,31,32,34,42,43,44,45,48,49,50,60,64,100,104,105,107,110,111,113,114,116,123,124,126,132,18,19,20,21,22,25,26,27,28,31,32,33,43,44,45,46,49,50,64,65,101,103,105,106,108,110,111,112,114,115,117,124,125,127,133,19,20,21,22,23,26,27,28,29,32,33,44,45,46,47,50,51,52,53,61,63,65,66,67,72,73,76,77,81,103,106,111,112,115,125,24,25,26,27,28,30,31,32,33,34,48,49,50,64,65,100,101,102,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,25,26,27,28,29,31,32,33,49,50,51,52,53,63,64,65,66,67,68,70,72,73,74,77,78,82,101,103,105,106,108,114,115,117,127,30,31,32,33,34,52,53,63,64,65,66,67,68,69,70,71,73,74,75,78,79,83,100,101,102,104,105,106,107,108,109,116,117,118,128,35,36,37,38,39,42,43,44,45,48,49,50,54,55,56,57,60,104,105,107,110,111,113,114,116,119,120,121,123,124,126,129,130,132,135,36,37,38,39,40,43,44,45,46,49,50,55,56,57,58,103,105,106,108,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,37,38,39,40,41,44,45,46,47,50,51,52,53,56,57,58,59,61,62,72,73,76,77,80,81,84,103,106,111,112,115,121,122,125,131,42,43,44,45,46,48,49,50,60,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,43,44,45,46,47,49,50,51,52,53,61,70,72,73,74,76,77,78,81,82,85,103,105,106,108,110,111,112,114,115,117,124,125,127,133,48,49,50,51,52,53,70,71,72,73,74,75,77,78,79,82,83,86,103,104,105,106,107,108,109,113,114,115,116,117,118,126,127,128,134,54,55,56,57,58,60,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,55,56,57,58,59,61,62,72,73,74,76,77,78,80,81,82,84,85,87,110,111,112,114,115,117,120,121,122,124,125,127,130,131,133,136,60,61,72,73,74,75,76,77,78,79,81,82,83,85,86,88,110,111,112,113,114,115,116,117,118,123,124,125,126,127,128,132,133,134,137,62,76,77,78,79,80,81,82,83,84,85,86,87,88,89,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138];
    kx = [1,25,49,67,79,85,91,163,97,103,109,127,139,145,175,181,193,199,205,7,13,19,31,37,43,55,61,73,115,121,133,151,157,169,187,1,7,13,19,31,109,127,25,37,43,49,67,79,85,139,145,163,175,181,193,199,205,55,61,73,91,97,103,115,121,133,151,157,169,187,1,7,13,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,1,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,2,8,14,26,50,68,80,86,92,98,104,164,176,110,116,122,128,140,146,182,194,200,206,20,32,38,44,56,62,74,134,152,158,170,188,2,26,50,68,80,86,92,164,98,104,110,128,140,146,176,182,194,200,206,8,14,20,32,38,44,56,62,74,116,122,134,152,158,170,188,2,8,14,20,26,32,38,44,50,56,62,68,74,92,98,104,110,116,122,128,140,146,152,158,164,176,194,80,86,182,200,206,134,170,188,2,8,14,20,26,32,38,44,50,56,62,92,98,104,110,116,128,140,146,164,68,74,80,86,176,182,194,200,206,122,134,152,158,170,188,2,8,14,20,26,32,38,44,92,98,110,128,140,50,56,62,68,80,86,146,164,176,182,194,200,206,74,104,116,122,134,152,158,170,188,2,8,14,20,32,110,128,26,38,44,50,68,80,86,140,146,164,176,182,194,200,206,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,20,26,32,38,44,50,56,68,80,86,92,98,104,110,128,164,140,146,176,182,194,200,206,62,74,116,122,134,152,158,170,188,2,8,14,20,26,32,38,50,68,80,110,86,128,140,146,164,176,182,194,200,206,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,20,26,50,110,68,80,86,128,140,146,164,176,182,194,200,206,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,3,9,15,27,51,69,81,87,93,99,105,165,177,111,117,123,129,141,147,183,195,201,207,21,33,39,45,57,63,75,135,153,159,171,189,3,27,51,69,81,87,93,165,99,105,111,129,141,147,177,183,195,201,207,9,15,21,33,39,45,57,63,75,117,123,135,153,159,171,189,3,9,15,21,27,33,39,45,51,57,63,69,75,93,99,105,111,117,123,129,141,147,153,159,165,177,195,81,87,183,201,207,135,171,189,3,9,15,21,27,33,39,45,51,57,63,93,99,105,111,117,129,141,147,165,69,75,81,87,177,183,195,201,207,123,135,153,159,171,189,3,9,15,21,27,33,39,45,93,99,111,129,141,51,57,63,69,81,87,147,165,177,183,195,201,207,75,105,117,123,135,153,159,171,189,3,9,15,21,33,111,129,27,39,45,51,69,81,87,141,147,165,177,183,195,201,207,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,21,27,33,39,45,51,57,69,81,87,93,99,105,111,129,165,141,147,177,183,195,201,207,63,75,117,123,135,153,159,171,189,3,9,15,21,27,33,39,51,69,81,111,87,129,141,147,165,177,183,195,201,207,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,21,27,51,111,69,81,87,129,141,147,165,177,183,195,201,207,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,4,10,16,28,52,70,82,88,94,100,106,166,178,112,118,124,130,142,148,184,196,202,208,22,34,40,46,58,64,76,136,154,160,172,190,4,28,52,70,82,88,94,166,100,106,112,130,142,148,178,184,196,202,208,10,16,22,34,40,46,58,64,76,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,94,100,106,112,118,124,130,136,154,160,166,88,142,148,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,94,100,106,112,118,124,130,142,148,154,160,166,178,196,82,88,184,202,208,136,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,94,100,106,112,118,124,130,154,82,88,136,142,148,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,94,100,106,112,118,124,76,82,88,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,94,100,106,112,118,130,142,148,166,70,76,82,88,178,184,196,202,208,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,94,100,106,64,70,76,82,88,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,94,100,112,130,142,52,58,64,70,82,88,148,166,178,184,196,202,208,76,106,118,124,136,154,160,172,190,4,10,16,22,34,112,130,28,40,46,52,70,82,88,142,148,166,178,184,196,202,208,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,94,100,106,112,118,76,82,88,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,94,100,106,112,70,76,82,88,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,70,82,88,94,100,106,112,130,166,142,148,178,184,196,202,208,64,76,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,94,52,58,64,70,76,82,88,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,52,70,82,112,88,130,142,148,166,178,184,196,202,208,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,52,112,70,82,88,130,142,148,166,178,184,196,202,208,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,5,11,17,29,53,71,83,89,95,101,107,167,179,113,119,125,131,143,149,185,197,203,209,23,35,41,47,59,65,77,137,155,161,173,191,5,29,53,71,83,89,95,167,101,107,113,131,143,149,179,185,197,203,209,11,17,23,35,41,47,59,65,77,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,95,101,107,113,119,125,131,137,155,161,167,89,143,149,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,95,101,107,113,119,125,131,143,149,155,161,167,179,197,83,89,185,203,209,137,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,95,101,107,113,119,125,131,155,83,89,137,143,149,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,95,101,107,113,119,125,77,83,89,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,95,101,107,113,119,131,143,149,167,71,77,83,89,179,185,197,203,209,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,95,101,107,65,71,77,83,89,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,95,101,113,131,143,53,59,65,71,83,89,149,167,179,185,197,203,209,77,107,119,125,137,155,161,173,191,5,11,17,23,35,113,131,29,41,47,53,71,83,89,143,149,167,179,185,197,203,209,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,95,101,107,113,119,77,83,89,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,95,101,107,113,71,77,83,89,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,71,83,89,95,101,107,113,131,167,143,149,179,185,197,203,209,65,77,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,95,53,59,65,71,77,83,89,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,53,71,83,113,89,131,143,149,167,179,185,197,203,209,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,53,113,71,83,89,131,143,149,167,179,185,197,203,209,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,6,12,18,30,54,72,84,90,96,102,108,168,180,114,120,126,132,144,150,186,198,204,210,24,36,42,48,60,66,78,138,156,162,174,192,6,30,54,72,84,90,96,168,102,108,114,132,144,150,180,186,198,204,210,12,18,24,36,42,48,60,66,78,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,96,102,108,114,120,126,132,138,156,162,168,90,144,150,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,96,102,108,114,120,126,132,144,150,156,162,168,180,198,84,90,186,204,210,138,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,96,102,108,114,120,126,132,156,84,90,138,144,150,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,96,102,108,114,120,126,78,84,90,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,96,102,108,114,120,132,144,150,168,72,78,84,90,180,186,198,204,210,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,96,102,108,66,72,78,84,90,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,96,102,114,132,144,54,60,66,72,84,90,150,168,180,186,198,204,210,78,108,120,126,138,156,162,174,192,6,12,18,24,36,114,132,30,42,48,54,72,84,90,144,150,168,180,186,198,204,210,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,96,102,108,114,120,78,84,90,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,96,102,108,114,72,78,84,90,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,72,84,90,96,102,108,114,132,168,144,150,180,186,198,204,210,66,78,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,96,54,60,66,72,78,84,90,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,54,72,84,114,90,132,144,150,168,180,186,198,204,210,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,54,114,72,84,90,132,144,150,168,180,186,198,204,210,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192];
    M = sparse(ix,jx,C(kx),89,138);

    [L,~,P] = lu(M(:,1:62));
    P = P';
    M = [P*L P(:,63:end)]\M(:,63:end);
    M = M(end-26:end,:);

    T = zeros(49);
    T([1,2,3,4,7,9,10,12,13,14,17,19,20,23,26,28,29,33,36,38,39,42,44,45,47,48,49],:) = -M(:,1:27)\M(:,28:end);
    T([495,545,596,942,1289,1339,1390,1687,1737,1788,1838,1889,1941,1991,2041,2092,2142,2193,2245,2295,2346,2398]) = 1;

    [V,~] = eig(T);
    S = V(46:48,:)./repmat(V(49,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end