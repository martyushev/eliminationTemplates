import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 5x28
# Output: solution matrix S of size 5x36

def red_72x108_relpose_4pt(C):
    M = csr_matrix((C.flat[[0,1,2,4,5,10,11,12,15,19,24,3,6,7,8,9,13,14,16,20,25,22,23,27,17,18,26,0,1,4,5,10,11,12,15,19,24,2,3,6,7,8,9,13,14,16,20,25,22,23,27,17,18,26,0,1,2,3,8,9,10,11,13,14,17,18,19,20,22,23,24,25,26,27,4,5,6,7,0,12,1,2,4,5,6,7,8,9,10,11,13,15,19,20,24,25,22,23,27,17,18,26,12,0,1,2,4,5,6,7,8,9,10,11,15,19,20,24,25,22,23,27,17,18,26,0,1,10,11,19,24,2,4,5,6,7,8,9,13,14,17,18,22,23,27,26,0,2,4,5,6,7,8,9,10,11,17,18,22,23,27,26,0,12,1,2,3,4,5,6,7,15,16,19,8,9,10,11,13,14,17,18,20,22,23,24,25,26,27,0,12,1,2,3,4,5,6,7,15,16,19,8,9,10,11,13,14,17,18,20,22,23,24,25,26,27,4,5,10,11,12,15,24,0,1,2,3,6,7,8,9,13,14,17,18,22,23,25,26,27,12,0,1,2,3,4,5,6,7,8,9,10,11,13,14,17,18,22,23,24,25,26,27,0,1,2,3,4,5,6,7,8,9,10,11,13,14,17,18,22,23,24,25,26,27,0,12,1,2,3,15,16,10,11,13,14,22,23,24,25,27,4,5,6,7,8,9,17,18,19,20,26,0,12,1,2,15,16,10,11,13,14,22,23,24,25,27,4,5,6,7,8,9,17,18,19,20,26,0,1,2,4,5,10,11,12,15,19,24,3,6,7,8,9,13,14,22,23,25,27,17,18,20,26,0,12,1,2,4,5,6,7,10,11,13,14,22,23,24,25,27,8,9,17,18,19,20,26,0,12,1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,22,23,24,25,26,27,0,12,1,2,3,10,11,13,14,15,16,22,23,24,25,27,4,5,6,7,8,9,17,18,19,20,26,28,29,30,32,33,38,39,40,43,47,52,31,34,35,36,37,41,42,44,48,53,50,51,55,45,46,54,28,29,32,33,38,39,40,43,47,52,30,31,34,35,36,37,41,42,44,48,53,50,51,55,45,46,54,28,29,30,31,36,37,38,39,41,42,45,46,47,48,50,51,52,53,54,55,32,33,34,35,28,40,29,30,32,33,34,35,36,37,38,39,41,43,47,48,52,53,50,51,55,45,46,54,40,28,29,30,32,33,34,35,36,37,38,39,43,47,48,52,53,50,51,55,45,46,54,28,29,38,39,47,52,30,32,33,34,35,36,37,41,42,45,46,50,51,55,54,28,30,32,33,34,35,36,37,38,39,45,46,50,51,55,54,28,40,29,30,31,32,33,34,35,43,44,47,36,37,38,39,41,42,45,46,48,50,51,52,53,54,55,28,40,29,30,31,32,33,34,35,43,44,47,36,37,38,39,41,42,45,46,48,50,51,52,53,54,55,32,33,38,39,40,43,52,28,29,30,31,34,35,36,37,41,42,45,46,50,51,53,54,55,40,28,29,30,31,32,33,34,35,36,37,38,39,41,42,45,46,50,51,52,53,54,55,28,29,30,31,32,33,34,35,36,37,38,39,41,42,45,46,50,51,52,53,54,55,28,40,29,30,31,43,44,38,39,41,42,50,51,52,53,55,32,33,34,35,36,37,45,46,47,48,54,28,40,29,30,43,44,38,39,41,42,50,51,52,53,55,32,33,34,35,36,37,45,46,47,48,54,28,29,30,32,33,38,39,40,43,47,52,31,34,35,36,37,41,42,50,51,53,55,45,46,48,54,28,40,29,30,32,33,34,35,38,39,41,42,50,51,52,53,55,36,37,45,46,47,48,54,28,40,29,30,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,50,51,52,53,54,55,28,40,29,30,31,38,39,41,42,43,44,50,51,52,53,55,32,33,34,35,36,37,45,46,47,48,54,56,57,58,60,61,66,67,68,71,75,80,59,62,63,64,65,69,70,72,76,81,78,79,83,73,74,82,56,57,60,61,66,67,68,71,75,80,58,59,62,63,64,65,69,70,72,76,81,78,79,83,73,74,82,56,57,58,59,64,65,66,67,69,70,73,74,75,76,78,79,80,81,82,83,60,61,62,63,56,68,57,58,60,61,62,63,64,65,66,67,69,71,75,76,80,81,78,79,83,73,74,82,68,56,57,58,60,61,62,63,64,65,66,67,71,75,76,80,81,78,79,83,73,74,82,56,57,66,67,75,80,58,60,61,62,63,64,65,69,70,73,74,78,79,83,82,56,58,60,61,62,63,64,65,66,67,73,74,78,79,83,82,56,68,57,58,59,60,61,62,63,71,72,75,64,65,66,67,69,70,73,74,76,78,79,80,81,82,83,56,68,57,58,59,60,61,62,63,71,72,75,64,65,66,67,69,70,73,74,76,78,79,80,81,82,83,60,61,66,67,68,71,80,56,57,58,59,62,63,64,65,69,70,73,74,78,79,81,82,83,68,56,57,58,59,60,61,62,63,64,65,66,67,69,70,73,74,78,79,80,81,82,83,56,57,58,59,60,61,62,63,64,65,66,67,69,70,73,74,78,79,80,81,82,83,56,68,57,58,59,71,72,66,67,69,70,78,79,80,81,83,60,61,62,63,64,65,73,74,75,76,82,56,68,57,58,71,72,66,67,69,70,78,79,80,81,83,60,61,62,63,64,65,73,74,75,76,82,56,57,58,60,61,66,67,68,71,75,80,59,62,63,64,65,69,70,78,79,81,83,73,74,76,82,56,68,57,58,60,61,62,63,66,67,69,70,78,79,80,81,83,64,65,73,74,75,76,82,56,68,57,58,59,60,61,62,63,64,65,66,67,69,70,71,72,73,74,75,76,78,79,80,81,82,83,56,68,57,58,59,66,67,69,70,71,72,78,79,80,81,83,60,61,62,63,64,65,73,74,75,76,82,84,85,86,88,89,94,95,96,99,103,108,87,90,91,92,93,97,98,100,104,109,106,107,111,101,102,110,84,85,88,89,94,95,96,99,103,108,86,87,90,91,92,93,97,98,100,104,109,106,107,111,101,102,110,84,85,86,87,92,93,94,95,97,98,101,102,103,104,106,107,108,109,110,111,88,89,90,91,84,96,85,86,88,89,90,91,92,93,94,95,97,99,103,104,108,109,106,107,111,101,102,110,96,84,85,86,88,89,90,91,92,93,94,95,99,103,104,108,109,106,107,111,101,102,110,84,85,94,95,103,108,86,88,89,90,91,92,93,97,98,101,102,106,107,111,110,84,86,88,89,90,91,92,93,94,95,101,102,106,107,111,110,84,96,85,86,87,88,89,90,91,99,100,103,92,93,94,95,97,98,101,102,104,106,107,108,109,110,111,84,96,85,86,87,88,89,90,91,99,100,103,92,93,94,95,97,98,101,102,104,106,107,108,109,110,111,88,89,94,95,96,99,108,84,85,86,87,90,91,92,93,97,98,101,102,106,107,109,110,111,96,84,85,86,87,88,89,90,91,92,93,94,95,97,98,101,102,106,107,108,109,110,111,84,85,86,87,88,89,90,91,92,93,94,95,97,98,101,102,106,107,108,109,110,111,84,96,85,86,87,99,100,94,95,97,98,106,107,108,109,111,88,89,90,91,92,93,101,102,103,104,110,84,96,85,86,99,100,94,95,97,98,106,107,108,109,111,88,89,90,91,92,93,101,102,103,104,110,84,85,86,88,89,94,95,96,99,103,108,87,90,91,92,93,97,98,106,107,109,111,101,102,104,110,84,96,85,86,88,89,90,91,94,95,97,98,106,107,108,109,111,92,93,101,102,103,104,110,84,96,85,86,87,88,89,90,91,92,93,94,95,97,98,99,100,101,102,103,104,106,107,108,109,110,111,84,96,85,86,87,94,95,97,98,99,100,106,107,108,109,111,88,89,90,91,92,93,101,102,103,104,110]],([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,65,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,69,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,70,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71],[0,3,4,8,9,13,14,16,18,20,24,31,38,39,50,51,66,67,70,72,78,82,83,91,105,106,121,1,4,9,10,14,15,17,19,21,25,30,32,39,40,51,52,67,68,71,73,79,83,84,92,106,107,122,2,5,6,7,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,36,37,41,42,4,18,31,32,38,39,43,44,53,54,66,67,69,70,72,74,78,80,85,86,93,108,109,123,19,30,32,33,39,40,44,45,54,55,67,68,71,73,75,79,81,86,87,94,109,110,124,6,7,18,19,23,27,34,41,42,46,47,56,57,70,71,72,73,78,79,95,125,34,35,46,47,48,49,58,59,70,71,74,75,80,81,96,126,9,20,38,39,43,50,51,53,54,72,74,76,102,103,105,106,108,109,111,112,114,118,119,121,123,127,132,10,21,39,40,44,51,52,54,55,73,75,77,103,104,106,107,109,110,112,113,115,119,120,122,124,128,133,11,12,20,21,22,23,28,37,41,42,46,56,57,60,61,72,73,76,77,121,122,125,129,134,23,42,46,47,48,56,57,58,59,62,63,72,73,74,75,114,115,123,124,125,126,130,135,12,56,57,58,60,61,62,63,64,65,76,77,114,115,116,117,127,128,129,130,131,136,14,24,66,67,69,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,118,119,121,123,132,15,25,67,68,79,81,83,84,86,87,89,90,92,94,98,106,107,109,110,112,113,119,120,122,124,133,17,18,19,20,21,24,25,26,27,28,29,70,72,73,76,77,78,79,91,92,95,99,121,122,125,134,19,27,70,71,72,73,74,75,78,79,80,81,93,94,95,96,100,114,115,123,124,125,126,135,21,28,72,73,74,76,77,114,115,116,117,121,122,123,124,125,126,127,128,129,130,132,133,134,135,136,137,25,29,78,79,80,91,92,93,94,95,96,97,98,99,100,101,121,122,123,124,127,128,132,133,134,135,137,0,3,4,8,9,13,14,16,18,20,24,31,38,39,50,51,66,67,70,72,78,82,83,91,105,106,121,1,4,9,10,14,15,17,19,21,25,30,32,39,40,51,52,67,68,71,73,79,83,84,92,106,107,122,2,5,6,7,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,36,37,41,42,4,18,31,32,38,39,43,44,53,54,66,67,69,70,72,74,78,80,85,86,93,108,109,123,19,30,32,33,39,40,44,45,54,55,67,68,71,73,75,79,81,86,87,94,109,110,124,6,7,18,19,23,27,34,41,42,46,47,56,57,70,71,72,73,78,79,95,125,34,35,46,47,48,49,58,59,70,71,74,75,80,81,96,126,9,20,38,39,43,50,51,53,54,72,74,76,102,103,105,106,108,109,111,112,114,118,119,121,123,127,132,10,21,39,40,44,51,52,54,55,73,75,77,103,104,106,107,109,110,112,113,115,119,120,122,124,128,133,11,12,20,21,22,23,28,37,41,42,46,56,57,60,61,72,73,76,77,121,122,125,129,134,23,42,46,47,48,56,57,58,59,62,63,72,73,74,75,114,115,123,124,125,126,130,135,12,56,57,58,60,61,62,63,64,65,76,77,114,115,116,117,127,128,129,130,131,136,14,24,66,67,69,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,118,119,121,123,132,15,25,67,68,79,81,83,84,86,87,89,90,92,94,98,106,107,109,110,112,113,119,120,122,124,133,17,18,19,20,21,24,25,26,27,28,29,70,72,73,76,77,78,79,91,92,95,99,121,122,125,134,19,27,70,71,72,73,74,75,78,79,80,81,93,94,95,96,100,114,115,123,124,125,126,135,21,28,72,73,74,76,77,114,115,116,117,121,122,123,124,125,126,127,128,129,130,132,133,134,135,136,137,25,29,78,79,80,91,92,93,94,95,96,97,98,99,100,101,121,122,123,124,127,128,132,133,134,135,137,0,3,4,8,9,13,14,16,18,20,24,31,38,39,50,51,66,67,70,72,78,82,83,91,105,106,121,1,4,9,10,14,15,17,19,21,25,30,32,39,40,51,52,67,68,71,73,79,83,84,92,106,107,122,2,5,6,7,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,36,37,41,42,4,18,31,32,38,39,43,44,53,54,66,67,69,70,72,74,78,80,85,86,93,108,109,123,19,30,32,33,39,40,44,45,54,55,67,68,71,73,75,79,81,86,87,94,109,110,124,6,7,18,19,23,27,34,41,42,46,47,56,57,70,71,72,73,78,79,95,125,34,35,46,47,48,49,58,59,70,71,74,75,80,81,96,126,9,20,38,39,43,50,51,53,54,72,74,76,102,103,105,106,108,109,111,112,114,118,119,121,123,127,132,10,21,39,40,44,51,52,54,55,73,75,77,103,104,106,107,109,110,112,113,115,119,120,122,124,128,133,11,12,20,21,22,23,28,37,41,42,46,56,57,60,61,72,73,76,77,121,122,125,129,134,23,42,46,47,48,56,57,58,59,62,63,72,73,74,75,114,115,123,124,125,126,130,135,12,56,57,58,60,61,62,63,64,65,76,77,114,115,116,117,127,128,129,130,131,136,14,24,66,67,69,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,118,119,121,123,132,15,25,67,68,79,81,83,84,86,87,89,90,92,94,98,106,107,109,110,112,113,119,120,122,124,133,17,18,19,20,21,24,25,26,27,28,29,70,72,73,76,77,78,79,91,92,95,99,121,122,125,134,19,27,70,71,72,73,74,75,78,79,80,81,93,94,95,96,100,114,115,123,124,125,126,135,21,28,72,73,74,76,77,114,115,116,117,121,122,123,124,125,126,127,128,129,130,132,133,134,135,136,137,25,29,78,79,80,91,92,93,94,95,96,97,98,99,100,101,121,122,123,124,127,128,132,133,134,135,137,0,3,4,8,9,13,14,16,18,20,24,31,38,39,50,51,66,67,70,72,78,82,83,91,105,106,121,1,4,9,10,14,15,17,19,21,25,30,32,39,40,51,52,67,68,71,73,79,83,84,92,106,107,122,2,5,6,7,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,36,37,41,42,4,18,31,32,38,39,43,44,53,54,66,67,69,70,72,74,78,80,85,86,93,108,109,123,19,30,32,33,39,40,44,45,54,55,67,68,71,73,75,79,81,86,87,94,109,110,124,6,7,18,19,23,27,34,41,42,46,47,56,57,70,71,72,73,78,79,95,125,34,35,46,47,48,49,58,59,70,71,74,75,80,81,96,126,9,20,38,39,43,50,51,53,54,72,74,76,102,103,105,106,108,109,111,112,114,118,119,121,123,127,132,10,21,39,40,44,51,52,54,55,73,75,77,103,104,106,107,109,110,112,113,115,119,120,122,124,128,133,11,12,20,21,22,23,28,37,41,42,46,56,57,60,61,72,73,76,77,121,122,125,129,134,23,42,46,47,48,56,57,58,59,62,63,72,73,74,75,114,115,123,124,125,126,130,135,12,56,57,58,60,61,62,63,64,65,76,77,114,115,116,117,127,128,129,130,131,136,14,24,66,67,69,78,80,82,83,85,86,88,89,91,93,97,105,106,108,109,111,112,118,119,121,123,132,15,25,67,68,79,81,83,84,86,87,89,90,92,94,98,106,107,109,110,112,113,119,120,122,124,133,17,18,19,20,21,24,25,26,27,28,29,70,72,73,76,77,78,79,91,92,95,99,121,122,125,134,19,27,70,71,72,73,74,75,78,79,80,81,93,94,95,96,100,114,115,123,124,125,126,135,21,28,72,73,74,76,77,114,115,116,117,121,122,123,124,125,126,127,128,129,130,132,133,134,135,136,137,25,29,78,79,80,91,92,93,94,95,96,97,98,99,100,101,121,122,123,124,127,128,132,133,134,135,137])),shape=(72,138))

    M0 = csr_matrix((np.array([1,1,-1,1,1,-1,1,-1,-1,1,-1,2,1,-1,1,-1,1,-1,1,1,-1,1,-1,1,1,-1,1,1,-1,1,1,-1,1,1,-1,1,1,-1,1,-1,1,-1,1,-1,1,1,1,-1,1,1,-1,-1,1,-1,1,1,1,-1,1,1,-1,-1,-1,1,-1,1,1,-1,1,-1,1,-1,1,1,1,-1,1,-1,1]),([0,0,0,1,1,1,2,2,2,2,2,2,3,3,4,4,5,5,6,6,6,7,7,8,8,8,9,9,9,10,10,10,11,11,11,12,12,12,13,13,13,14,14,15,15,16,16,16,17,17,17,18,18,19,19,20,20,20,21,21,21,22,23,24,24,24,25,25,25,26,26,27,27,28,28,28,29,29,29],[2,21,53,3,22,54,4,29,35,51,68,98,23,55,24,56,26,48,5,27,49,28,50,13,72,88,14,73,89,15,74,90,28,34,97,29,35,98,39,58,81,59,82,60,83,40,46,61,41,47,62,63,84,64,85,44,86,102,45,87,103,104,105,50,67,97,51,68,98,69,99,70,100,96,101,107,66,71,106])),shape=(30,108))
    M = M[:,30:]-M[:,:30]@M0 # Schur complement reduction
    M = M.toarray()

    P,L,_ = lu(M[:,:52])
    M = solve(np.concatenate((P@L,P[:,52:]),axis=1),M[:,52:])
    M = M[-20:,:]

    T0 = np.zeros((36,36))
    T0[[3,4,5,6,7,8,16,17,18,19,20,21,22,23,24,30,31,32,33,35],:] = -M[:,20:]
    T0.flat[[9,46,83,340,377,414,453,490,529,566,930,967,1004,1041,1078,1259]] = 1
    T1 = np.zeros((36,36))
    T1[np.ix_([3,4,5,6,7,8,16,17,18,19,20,21,22,23,24,30,31,32,33,35],[3,4,5,6,7,8,16,17,18,19,20,21,22,23,24,30,31,32,33,35])] = M[:,:20]
    T1.flat[[0,37,74,333,370,407,444,481,518,555,925,962,999,1036,1073,1258]] = 1

    _,V = eig(T0,T1)
    S = V[30:35,:]/np.tile(V[35,:],(5,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S