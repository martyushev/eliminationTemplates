import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 4x25
# Output: solution matrix S of size 2x14

def red_12x26_pose_35pt(C):
    M = csr_matrix((C.flat[[0,1,4,9,14,18,21,23,24,5,6,7,8,10,11,12,13,15,16,17,19,20,22,0,4,5,6,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,0,4,5,14,18,21,23,24,10,11,12,13,15,16,17,19,20,22,25,26,29,34,39,43,46,48,49,30,31,32,33,35,36,37,38,40,41,42,44,45,47,25,29,30,31,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,25,29,30,39,43,46,48,49,35,36,37,38,40,41,42,44,45,47,50,51,54,59,64,68,71,73,74,55,56,57,58,60,61,62,63,65,66,67,69,70,72,50,54,55,56,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,50,54,55,64,68,71,73,74,60,61,62,63,65,66,67,69,70,72,75,76,79,84,89,93,96,98,99,80,81,82,83,85,86,87,88,90,91,92,94,95,97,75,79,80,81,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,75,79,80,89,93,96,98,99,85,86,87,88,90,91,92,94,95,97]],([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11],[2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,0,2,3,4,5,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,3,4,6,7,8,9,10,12,13,14,15,17,18,19,21,22,24,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,0,2,3,4,5,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,3,4,6,7,8,9,10,12,13,14,15,17,18,19,21,22,24,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,0,2,3,4,5,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,3,4,6,7,8,9,10,12,13,14,15,17,18,19,21,22,24,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,0,2,3,4,5,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,3,4,6,7,8,9,10,12,13,14,15,17,18,19,21,22,24])),shape=(12,26))
    M = M.toarray()

    P,L,_ = lu(M[:,:7])
    M = solve(np.concatenate((P@L,P[:,7:]),axis=1),M[:,7:])
    M = M[-5:,:]

    T0 = np.zeros((14,14))
    T0[[3,7,10,12,13],:] = -M[:,5:]
    T0.flat[[5,20,35,64,79,94,123,138,167]] = 1
    T1 = np.zeros((14,14))
    T1[np.ix_([3,7,10,12,13],[3,7,10,12,13])] = M[:,:5]
    T1.flat[[0,15,30,60,75,90,120,135,165]] = 1

    _,V = eig(T0,T1)
    S = V[11:13,:]/np.tile(V[13,:],(2,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S