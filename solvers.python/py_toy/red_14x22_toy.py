import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 3x10
# Output: solution matrix S of size 3x8

def red_14x22_toy(C):
    M = csr_matrix((C.flat[[8,4,6,8,9,4,6,4,8,9,6,8,9,4,6,4,6,8,9,4,8,9,6,13,17,19,15,13,19,15,13,19,15,13,15,17,19,13,15,19,20,21,20,29,21,20,29,21]],([0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,8,8,8,9,9,9,9,10,10,10,11,11,12,12,12,13,13,13],[8,11,12,12,13,18,20,5,6,7,9,10,12,15,17,2,16,20,21,1,9,11,15,5,10,13,19,4,7,18,3,6,15,1,14,17,21,0,2,11,4,19,3,8,16,0,13,14])),shape=(14,22))
    M = M.toarray()

    P,L,_ = lu(M[:,:9])
    M = solve(np.concatenate((P@L,P[:,9:]),axis=1),M[:,9:])
    M = M[-5:,:]

    T0 = np.zeros((8,8))
    T0[[1,3,4,6,7],:] = -M[:,5:]
    T0.flat[[5,22,47]] = 1
    T1 = np.zeros((8,8))
    T1[np.ix_([1,3,4,6,7],[1,3,4,6,7])] = M[:,:5]
    T1.flat[[0,18,45]] = 1

    _,V = eig(T0,T1)
    S = V[4:7,:]/np.tile(V[7,:],(3,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S