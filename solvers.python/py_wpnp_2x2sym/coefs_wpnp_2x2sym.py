import numpy as np

def coefs_wpnp_2x2sym(data):
    A = data[0].T.flat
    B = data[1].T.flat

    C = np.zeros((4,16),dtype=np.complex_)
    C.flat[[8,19,39,53]] = 64*A[2]**2
    C.flat[[1,25,32,59]] = -32*A[0]**2+32*A[1]**2
    C.flat[[4,22,42,50]] = 32*A[0]**2+32*A[1]**2
    C.flat[[46,61]] = -8*A[2]*B[4]-8*1j*A[2]*B[5]
    C.flat[[15,28]] = 8*1j*A[2]*B[5]-8*A[2]*B[4]
    C.flat[62] = -8*A[0]*B[0]+8*A[1]*B[3]-8*1j*A[0]*B[1]-8*1j*A[1]*B[2]
    C.flat[12] = -8*A[0]*B[0]+8*A[1]*B[3]+8*1j*A[0]*B[1]+8*1j*A[1]*B[2]
    C.flat[45] = 8*A[0]*B[0]+8*A[1]*B[3]+8*1j*A[0]*B[1]-8*1j*A[1]*B[2]
    C.flat[31] = -8*1j*A[0]*B[1]+8*1j*A[1]*B[2]+8*A[0]*B[0]+8*A[1]*B[3]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(w1,x1,y1,z1):
        return np.array([x1*w1**2*y1,x1*y1**2*w1,x1*w1**2*z1,x1*y1*z1*w1,x1*z1**2*w1,y1*x1*w1,y1**2*x1,z1*x1*w1,z1*y1*x1,z1**2*x1,x1*y1,x1*z1,w1,y1,z1,1])

    return C,U