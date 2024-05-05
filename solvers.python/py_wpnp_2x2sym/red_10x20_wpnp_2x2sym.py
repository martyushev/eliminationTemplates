import numpy as np
from scipy.sparse import csr_matrix
from scipy.linalg import lu, solve, eig

# Input: coefficient matrix C of size 4x16
# Output: solution matrix S of size 4x10

def red_10x20_wpnp_2x2sym(C):
    M = csr_matrix((C.flat[[1,4,8,12,15,8,15,1,4,12,8,15,1,12,4,19,22,25,28,31,22,25,31,19,28,22,25,31,28,19,32,42,45,46,39,32,42,45,46,39,50,59,61,62,53,59,61,62,50,53]],([0,0,0,0,0,1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,7,8,8,8,8,8,9,9,9,9,9],[0,10,12,15,19,3,8,11,13,19,6,9,14,16,18,1,11,13,15,19,2,4,8,12,19,5,7,9,16,17,0,2,5,6,12,1,3,6,7,13,1,3,5,6,11,4,6,7,10,12])),shape=(10,20))
    M = M.toarray()

    P,L,_ = lu(M[:,:2])
    M = solve(np.concatenate((P@L,P[:,2:]),axis=1),M[:,2:])
    M = M[-8:,:]

    T0 = np.zeros((10,10),dtype=np.complex_)
    T0[[1,2,3,4,7,8,9,6],:] = -M[:,8:]
    T0.flat[[3,59]] = 1
    T1 = np.zeros((10,10),dtype=np.complex_)
    T1[np.ix_([1,2,3,4,7,8,9,6],[1,2,3,4,7,8,9,6])] = M[:,:8]
    T1.flat[[0,55]] = 1

    _,V = eig(T0,T1)
    S = V[5:9,:]/np.tile(V[9,:],(4,1))
    z = np.sqrt(S[3,:])
    y = S[2,:]/z
    x = 1/S[1,:]
    w = S[0,:]
    S = np.concatenate((np.array([w, x, y, z]),np.array([w, x, -y, -z])),axis=1)
    S = S[:,np.all(np.isfinite(S),axis=0)]

    return S