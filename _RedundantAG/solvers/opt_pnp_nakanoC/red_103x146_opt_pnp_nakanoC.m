% Input: coefficient matrix C of size 6x35
% Output: solution matrix S of size 3x43

function S = red_103x146_opt_pnp_nakanoC(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,72,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,73,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,74,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,76,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,77,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,78,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,82,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,83,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,84,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,86,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,88,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,89,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,90,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,91,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,92,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,93,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,94,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,97,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,98,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,102,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103];
    jx = [14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,3,4,5,6,7,10,11,12,13,16,17,18,21,22,34,35,36,37,41,42,43,47,48,63,64,65,69,70,79,81,86,90,104,111,120,9,10,11,12,13,15,16,17,18,20,21,22,23,40,41,42,43,46,47,48,51,68,69,70,71,81,82,86,87,91,104,106,111,114,123,14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,26,27,28,29,30,34,35,36,37,41,42,43,47,48,56,57,58,59,63,64,65,69,70,75,76,77,79,80,81,86,90,94,111,120,130,33,34,35,36,37,40,41,42,43,46,47,48,51,62,63,64,65,68,69,70,71,79,81,82,86,87,90,91,95,111,114,119,120,123,133,39,40,41,42,43,45,46,47,48,50,51,67,68,69,70,71,81,82,83,84,86,87,88,91,92,96,109,111,113,114,116,122,123,125,135,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,55,56,57,58,59,62,63,64,65,68,69,70,71,74,75,76,77,79,80,86,87,90,91,94,95,98,111,114,119,120,123,129,130,133,139,61,62,63,64,65,67,68,69,70,71,79,84,86,87,88,90,91,92,95,96,99,111,113,114,116,118,119,120,122,123,125,132,133,135,141,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,73,74,75,76,77,79,80,86,87,88,90,91,92,94,95,96,98,99,101,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,3,4,5,6,7,10,11,12,13,16,17,18,21,22,34,35,36,37,41,42,43,47,48,63,64,65,69,70,79,81,86,90,104,111,120,9,10,11,12,13,15,16,17,18,20,21,22,23,40,41,42,43,46,47,48,51,68,69,70,71,81,82,86,87,91,104,106,111,114,123,14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,26,27,28,29,30,34,35,36,37,41,42,43,47,48,56,57,58,59,63,64,65,69,70,75,76,77,79,80,81,86,90,94,111,120,130,33,34,35,36,37,40,41,42,43,46,47,48,51,62,63,64,65,68,69,70,71,79,81,82,86,87,90,91,95,111,114,119,120,123,133,39,40,41,42,43,45,46,47,48,50,51,67,68,69,70,71,81,82,83,84,86,87,88,91,92,96,109,111,113,114,116,122,123,125,135,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,55,56,57,58,59,62,63,64,65,68,69,70,71,74,75,76,77,79,80,86,87,90,91,94,95,98,111,114,119,120,123,129,130,133,139,61,62,63,64,65,67,68,69,70,71,79,84,86,87,88,90,91,92,95,96,99,111,113,114,116,118,119,120,122,123,125,132,133,135,141,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,73,74,75,76,77,79,80,86,87,88,90,91,92,94,95,96,98,99,101,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,1,2,3,4,5,8,9,10,11,14,15,16,19,20,32,33,34,35,39,40,41,45,46,50,61,62,63,67,68,105,113,118,119,122,132,2,3,4,5,6,9,10,11,12,15,16,17,20,33,34,35,36,40,41,42,46,47,51,62,63,64,68,104,106,111,114,119,120,123,133,3,4,5,6,7,10,11,12,13,16,17,18,21,22,34,35,36,37,41,42,43,47,48,63,64,65,69,70,79,81,86,90,104,111,120,8,9,10,11,12,14,15,16,17,19,20,39,40,41,42,45,46,47,50,51,67,68,104,105,106,107,109,111,113,114,116,122,123,125,135,9,10,11,12,13,15,16,17,18,20,21,22,23,40,41,42,43,46,47,48,51,68,69,70,71,81,82,86,87,91,104,106,111,114,123,14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,25,26,27,28,29,33,34,35,36,40,41,42,46,47,51,55,56,57,58,62,63,64,68,74,75,76,111,114,119,120,123,129,130,133,139,26,27,28,29,30,34,35,36,37,41,42,43,47,48,56,57,58,59,63,64,65,69,70,75,76,77,79,80,81,86,90,94,111,120,130,31,32,33,34,35,38,39,40,41,44,45,46,49,50,60,61,62,63,66,67,68,78,108,112,113,115,118,119,121,122,124,131,132,134,140,32,33,34,35,36,39,40,41,42,45,46,47,50,51,61,62,63,64,67,68,109,111,113,114,116,118,119,120,122,123,125,132,133,135,141,33,34,35,36,37,40,41,42,43,46,47,48,51,62,63,64,65,68,69,70,71,79,81,82,86,87,90,91,95,111,114,119,120,123,133,38,39,40,41,42,44,45,46,47,49,50,51,66,67,68,108,109,110,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,39,40,41,42,43,45,46,47,48,50,51,67,68,69,70,71,81,82,83,84,86,87,88,91,92,96,109,111,113,114,116,122,123,125,135,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,53,54,55,56,57,60,61,62,63,66,67,68,72,73,74,75,78,112,113,115,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,54,55,56,57,58,61,62,63,64,67,68,73,74,75,76,111,113,114,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,55,56,57,58,59,62,63,64,65,68,69,70,71,74,75,76,77,79,80,86,87,90,91,94,95,98,111,114,119,120,123,129,130,133,139,60,61,62,63,64,66,67,68,78,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,61,62,63,64,65,67,68,69,70,71,79,84,86,87,88,90,91,92,95,96,99,111,113,114,116,118,119,120,122,123,125,132,133,135,141,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,72,73,74,75,76,78,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,73,74,75,76,77,79,80,86,87,88,90,91,92,94,95,96,98,99,101,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,1,2,3,4,5,8,9,10,11,14,15,16,19,20,32,33,34,35,39,40,41,45,46,50,61,62,63,67,68,105,113,118,119,122,132,2,3,4,5,6,9,10,11,12,15,16,17,20,33,34,35,36,40,41,42,46,47,51,62,63,64,68,104,106,111,114,119,120,123,133,3,4,5,6,7,10,11,12,13,16,17,18,21,22,34,35,36,37,41,42,43,47,48,63,64,65,69,70,79,81,86,90,104,111,120,8,9,10,11,12,14,15,16,17,19,20,39,40,41,42,45,46,47,50,51,67,68,104,105,106,107,109,111,113,114,116,122,123,125,135,9,10,11,12,13,15,16,17,18,20,21,22,23,40,41,42,43,46,47,48,51,68,69,70,71,81,82,86,87,91,104,106,111,114,123,14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,25,26,27,28,29,33,34,35,36,40,41,42,46,47,51,55,56,57,58,62,63,64,68,74,75,76,111,114,119,120,123,129,130,133,139,26,27,28,29,30,34,35,36,37,41,42,43,47,48,56,57,58,59,63,64,65,69,70,75,76,77,79,80,81,86,90,94,111,120,130,31,32,33,34,35,38,39,40,41,44,45,46,49,50,60,61,62,63,66,67,68,78,108,112,113,115,118,119,121,122,124,131,132,134,140,32,33,34,35,36,39,40,41,42,45,46,47,50,51,61,62,63,64,67,68,109,111,113,114,116,118,119,120,122,123,125,132,133,135,141,33,34,35,36,37,40,41,42,43,46,47,48,51,62,63,64,65,68,69,70,71,79,81,82,86,87,90,91,95,111,114,119,120,123,133,38,39,40,41,42,44,45,46,47,49,50,51,66,67,68,108,109,110,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,39,40,41,42,43,45,46,47,48,50,51,67,68,69,70,71,81,82,83,84,86,87,88,91,92,96,109,111,113,114,116,122,123,125,135,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,53,54,55,56,57,60,61,62,63,66,67,68,72,73,74,75,78,112,113,115,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,54,55,56,57,58,61,62,63,64,67,68,73,74,75,76,111,113,114,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,55,56,57,58,59,62,63,64,65,68,69,70,71,74,75,76,77,79,80,86,87,90,91,94,95,98,111,114,119,120,123,129,130,133,139,60,61,62,63,64,66,67,68,78,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,61,62,63,64,65,67,68,69,70,71,79,84,86,87,88,90,91,92,95,96,99,111,113,114,116,118,119,120,122,123,125,132,133,135,141,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,72,73,74,75,76,78,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,73,74,75,76,77,79,80,86,87,88,90,91,92,94,95,96,98,99,101,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,1,2,3,4,5,8,9,10,11,14,15,16,19,20,32,33,34,35,39,40,41,45,46,50,61,62,63,67,68,105,113,118,119,122,132,2,3,4,5,6,9,10,11,12,15,16,17,20,33,34,35,36,40,41,42,46,47,51,62,63,64,68,104,106,111,114,119,120,123,133,3,4,5,6,7,10,11,12,13,16,17,18,21,22,34,35,36,37,41,42,43,47,48,63,64,65,69,70,79,81,86,90,104,111,120,8,9,10,11,12,14,15,16,17,19,20,39,40,41,42,45,46,47,50,51,67,68,104,105,106,107,109,111,113,114,116,122,123,125,135,9,10,11,12,13,15,16,17,18,20,21,22,23,40,41,42,43,46,47,48,51,68,69,70,71,81,82,86,87,91,104,106,111,114,123,14,15,16,17,18,19,20,21,22,23,24,45,46,47,48,50,51,70,71,81,82,83,84,87,88,92,104,105,106,107,109,113,114,116,125,25,26,27,28,29,33,34,35,36,40,41,42,46,47,51,55,56,57,58,62,63,64,68,74,75,76,111,114,119,120,123,129,130,133,139,26,27,28,29,30,34,35,36,37,41,42,43,47,48,56,57,58,59,63,64,65,69,70,75,76,77,79,80,81,86,90,94,111,120,130,31,32,33,34,35,38,39,40,41,44,45,46,49,50,60,61,62,63,66,67,68,78,108,112,113,115,118,119,121,122,124,131,132,134,140,32,33,34,35,36,39,40,41,42,45,46,47,50,51,61,62,63,64,67,68,109,111,113,114,116,118,119,120,122,123,125,132,133,135,141,33,34,35,36,37,40,41,42,43,46,47,48,51,62,63,64,65,68,69,70,71,79,81,82,86,87,90,91,95,111,114,119,120,123,133,38,39,40,41,42,44,45,46,47,49,50,51,66,67,68,108,109,110,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,39,40,41,42,43,45,46,47,48,50,51,67,68,69,70,71,81,82,83,84,86,87,88,91,92,96,109,111,113,114,116,122,123,125,135,44,45,46,47,48,49,50,51,52,70,71,81,82,83,84,85,87,88,89,92,93,97,108,109,110,112,113,114,115,116,117,124,125,126,136,53,54,55,56,57,60,61,62,63,66,67,68,72,73,74,75,78,112,113,115,118,119,121,122,124,127,128,129,131,132,134,137,138,140,143,54,55,56,57,58,61,62,63,64,67,68,73,74,75,76,111,113,114,116,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,55,56,57,58,59,62,63,64,65,68,69,70,71,74,75,76,77,79,80,86,87,90,91,94,95,98,111,114,119,120,123,129,130,133,139,60,61,62,63,64,66,67,68,78,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,61,62,63,64,65,67,68,69,70,71,79,84,86,87,88,90,91,92,95,96,99,111,113,114,116,118,119,120,122,123,125,132,133,135,141,66,67,68,69,70,71,84,85,86,87,88,89,91,92,93,96,97,100,111,112,113,114,115,116,117,121,122,123,124,125,126,134,135,136,142,72,73,74,75,76,78,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,73,74,75,76,77,79,80,86,87,88,90,91,92,94,95,96,98,99,101,118,119,120,122,123,125,128,129,130,132,133,135,138,139,141,144,78,79,86,87,88,89,90,91,92,93,95,96,97,99,100,102,118,119,120,121,122,123,124,125,126,131,132,133,134,135,136,140,141,142,145,80,90,91,92,93,94,95,96,97,98,99,100,101,102,103,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146];
    kx = [1,7,13,19,25,31,37,49,67,79,85,91,97,103,109,115,121,163,175,127,139,145,181,193,199,205,43,55,61,73,133,151,157,169,187,1,7,13,19,25,31,37,43,85,109,127,49,67,79,139,145,163,175,181,193,199,205,55,61,73,91,97,103,115,121,133,151,157,169,187,1,7,13,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,1,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,25,49,67,79,85,109,127,139,145,163,175,181,193,199,205,1,7,13,19,31,37,43,55,61,73,91,97,103,115,121,133,151,157,169,187,2,8,14,20,26,32,38,44,50,56,62,68,80,86,92,98,104,110,116,122,128,134,140,152,158,164,176,182,194,146,200,206,74,170,188,2,8,14,20,26,32,38,44,50,56,68,80,86,92,98,104,110,116,122,128,134,152,164,176,182,140,146,194,200,206,62,74,158,170,188,2,8,14,20,26,32,38,50,68,80,86,92,98,104,110,116,122,164,176,128,140,146,182,194,200,206,44,56,62,74,134,152,158,170,188,2,8,14,20,26,32,38,44,50,56,62,68,74,80,92,98,104,110,116,122,128,140,146,152,158,164,176,194,86,182,200,206,134,170,188,2,8,14,20,26,32,38,44,50,56,62,68,74,92,98,104,110,116,128,140,146,164,80,86,176,182,194,200,206,122,134,152,158,170,188,2,8,14,20,26,32,38,44,50,56,62,92,98,110,128,140,68,80,86,146,164,176,182,194,200,206,74,104,116,122,134,152,158,170,188,2,8,14,20,26,32,38,44,86,110,128,50,68,80,140,146,164,176,182,194,200,206,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,20,26,32,38,44,50,56,68,80,86,92,98,104,110,128,164,140,146,176,182,194,200,206,62,74,116,122,134,152,158,170,188,2,8,14,20,26,32,38,50,68,80,110,86,128,140,146,164,176,182,194,200,206,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,8,14,20,26,50,110,68,80,86,128,140,146,164,176,182,194,200,206,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,2,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,26,50,68,80,86,110,128,140,146,164,176,182,194,200,206,2,8,14,20,32,38,44,56,62,74,92,98,104,116,122,134,152,158,170,188,3,9,15,21,27,33,39,45,51,57,63,69,81,87,93,99,105,111,117,123,129,135,141,153,159,165,177,183,195,147,201,207,75,171,189,3,9,15,21,27,33,39,45,51,57,69,81,87,93,99,105,111,117,123,129,135,153,165,177,183,141,147,195,201,207,63,75,159,171,189,3,9,15,21,27,33,39,51,69,81,87,93,99,105,111,117,123,165,177,129,141,147,183,195,201,207,45,57,63,75,135,153,159,171,189,3,9,15,21,27,33,39,45,51,57,63,69,75,81,93,99,105,111,117,123,129,141,147,153,159,165,177,195,87,183,201,207,135,171,189,3,9,15,21,27,33,39,45,51,57,63,69,75,93,99,105,111,117,129,141,147,165,81,87,177,183,195,201,207,123,135,153,159,171,189,3,9,15,21,27,33,39,45,51,57,63,93,99,111,129,141,69,81,87,147,165,177,183,195,201,207,75,105,117,123,135,153,159,171,189,3,9,15,21,27,33,39,45,87,111,129,51,69,81,141,147,165,177,183,195,201,207,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,21,27,33,39,45,51,57,69,81,87,93,99,105,111,129,165,141,147,177,183,195,201,207,63,75,117,123,135,153,159,171,189,3,9,15,21,27,33,39,51,69,81,111,87,129,141,147,165,177,183,195,201,207,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,9,15,21,27,51,111,69,81,87,129,141,147,165,177,183,195,201,207,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,3,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,27,51,69,81,87,111,129,141,147,165,177,183,195,201,207,3,9,15,21,33,39,45,57,63,75,93,99,105,117,123,135,153,159,171,189,4,10,16,22,28,34,40,46,52,58,64,70,76,82,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,88,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,94,100,106,112,118,124,130,136,142,148,154,160,166,172,82,88,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,82,88,94,100,106,112,118,124,130,136,142,154,160,166,178,184,196,148,202,208,76,172,190,4,10,16,22,28,34,40,46,52,58,64,94,100,106,112,118,124,130,136,142,154,160,70,76,82,88,148,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,70,82,88,94,100,106,112,118,124,130,136,154,166,178,184,142,148,196,202,208,64,76,160,172,190,4,10,16,22,28,34,40,52,70,82,88,94,100,106,112,118,124,166,178,130,142,148,184,196,202,208,46,58,64,76,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,154,160,166,142,148,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,82,94,100,106,112,118,124,130,142,148,154,160,166,178,196,88,184,202,208,136,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,94,100,106,112,118,124,130,154,88,136,142,148,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,82,94,100,106,112,118,124,88,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,70,76,94,100,106,112,118,130,142,148,166,82,88,178,184,196,202,208,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,94,100,106,76,82,88,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,94,100,112,130,142,70,82,88,148,166,178,184,196,202,208,76,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,88,112,130,52,70,82,142,148,166,178,184,196,202,208,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,94,100,106,112,118,76,82,88,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,64,94,100,106,112,70,76,82,88,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,46,52,58,70,82,88,94,100,106,112,130,166,142,148,178,184,196,202,208,64,76,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,94,52,58,64,70,76,82,88,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,34,40,52,70,82,112,88,130,142,148,166,178,184,196,202,208,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,10,16,22,28,34,40,46,52,58,64,70,76,82,88,94,100,106,112,118,124,130,136,142,148,154,160,166,172,178,184,190,196,202,208,4,10,16,22,28,52,112,70,82,88,130,142,148,166,178,184,196,202,208,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,4,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,28,52,70,82,88,112,130,142,148,166,178,184,196,202,208,4,10,16,22,34,40,46,58,64,76,94,100,106,118,124,136,154,160,172,190,5,11,17,23,29,35,41,47,53,59,65,71,77,83,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,89,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,95,101,107,113,119,125,131,137,143,149,155,161,167,173,83,89,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,83,89,95,101,107,113,119,125,131,137,143,155,161,167,179,185,197,149,203,209,77,173,191,5,11,17,23,29,35,41,47,53,59,65,95,101,107,113,119,125,131,137,143,155,161,71,77,83,89,149,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,71,83,89,95,101,107,113,119,125,131,137,155,167,179,185,143,149,197,203,209,65,77,161,173,191,5,11,17,23,29,35,41,53,71,83,89,95,101,107,113,119,125,167,179,131,143,149,185,197,203,209,47,59,65,77,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,155,161,167,143,149,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,83,95,101,107,113,119,125,131,143,149,155,161,167,179,197,89,185,203,209,137,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,95,101,107,113,119,125,131,155,89,137,143,149,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,83,95,101,107,113,119,125,89,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,71,77,95,101,107,113,119,131,143,149,167,83,89,179,185,197,203,209,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,95,101,107,77,83,89,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,95,101,113,131,143,71,83,89,149,167,179,185,197,203,209,77,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,89,113,131,53,71,83,143,149,167,179,185,197,203,209,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,95,101,107,113,119,77,83,89,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,65,95,101,107,113,71,77,83,89,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,47,53,59,71,83,89,95,101,107,113,131,167,143,149,179,185,197,203,209,65,77,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,95,53,59,65,71,77,83,89,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,35,41,53,71,83,113,89,131,143,149,167,179,185,197,203,209,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,11,17,23,29,35,41,47,53,59,65,71,77,83,89,95,101,107,113,119,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,5,11,17,23,29,53,113,71,83,89,131,143,149,167,179,185,197,203,209,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,5,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,29,53,71,83,89,113,131,143,149,167,179,185,197,203,209,5,11,17,23,35,41,47,59,65,77,95,101,107,119,125,137,155,161,173,191,6,12,18,24,30,36,42,48,54,60,66,72,78,84,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,90,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,96,102,108,114,120,126,132,138,144,150,156,162,168,174,84,90,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,84,90,96,102,108,114,120,126,132,138,144,156,162,168,180,186,198,150,204,210,78,174,192,6,12,18,24,30,36,42,48,54,60,66,96,102,108,114,120,126,132,138,144,156,162,72,78,84,90,150,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,72,84,90,96,102,108,114,120,126,132,138,156,168,180,186,144,150,198,204,210,66,78,162,174,192,6,12,18,24,30,36,42,54,72,84,90,96,102,108,114,120,126,168,180,132,144,150,186,198,204,210,48,60,66,78,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,156,162,168,144,150,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,84,96,102,108,114,120,126,132,144,150,156,162,168,180,198,90,186,204,210,138,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,96,102,108,114,120,126,132,156,90,138,144,150,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,84,96,102,108,114,120,126,90,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,72,78,96,102,108,114,120,132,144,150,168,84,90,180,186,198,204,210,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,96,102,108,78,84,90,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,96,102,114,132,144,72,84,90,150,168,180,186,198,204,210,78,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,90,114,132,54,72,84,144,150,168,180,186,198,204,210,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,96,102,108,114,120,78,84,90,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,66,96,102,108,114,72,78,84,90,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,48,54,60,72,84,90,96,102,108,114,132,168,144,150,180,186,198,204,210,66,78,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,96,54,60,66,72,78,84,90,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,36,42,54,72,84,114,90,132,144,150,168,180,186,198,204,210,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162,168,174,180,186,192,198,204,210,6,12,18,24,30,54,114,72,84,90,132,144,150,168,180,186,198,204,210,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,6,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192,30,54,72,84,90,114,132,144,150,168,180,186,198,204,210,6,12,18,24,36,42,48,60,66,78,96,102,108,120,126,138,156,162,174,192];
    M = sparse(ix,jx,C(kx),103,146);

    [L,~,P] = lu(M(:,1:80));
    P = P';
    M = [P*L P(:,81:end)]\M(:,81:end);
    M = M(end-22:end,:);

    T = zeros(43);
    T([1,3,4,6,7,8,11,13,14,17,20,22,23,27,30,32,33,36,38,39,41,42,43],:) = -M(:,1:23)\M(:,24:end);
    T([217,564,869,913,958,1219,1263,1308,1352,1397,1443,1487,1531,1576,1620,1665,1711,1755,1800,1846]) = 1;

    [V,~] = eig(T);
    S = V(40:42,:)./repmat(V(43,:),3,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end