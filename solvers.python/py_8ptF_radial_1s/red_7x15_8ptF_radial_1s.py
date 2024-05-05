import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 2x16
# Output: solution matrix S of size 2x8

def red_7x15_8ptF_radial_1s(C):
    M = csr_matrix((C.flat[[0,2,5,6,10,13,15,1,3,4,7,8,11,12,14,29,31,24,27,28,30,29,31,24,27,28,30,24,27,29,30,31,29,31,24,27,28,30,24,28,27,29,30,31,24,28,27,29,30,31]],([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,6,6,6,6,6,6],[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,5,6,11,12,13,14,4,5,9,10,11,12,2,11,12,13,14,3,4,7,8,9,10,1,2,9,10,11,12,0,1,7,8,9,10])),shape=(7,15))
    M = M.toarray()

    P,L,_ = lu(M[:,:3])
    M = solve(np.concatenate((P@L,P[:,3:]),axis=1),M[:,3:])
    M = M[-4:,:]

    T0 = np.zeros((8,8))
    T0[[1,3,5,7],:] = -M[:,4:]
    T0.flat[[1,19,37,55]] = 1
    T1 = np.zeros((8,8))
    T1[np.ix_([1,3,5,7],[1,3,5,7])] = M[:,:4]
    T1.flat[[0,18,36,54]] = 1

    _,V = eig(T0,T1)
    S = V[5:7,:]/np.tile(V[7,:],(2,1))
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S