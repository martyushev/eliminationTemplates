import numpy as np

def coefs_wpnp(data):
    A = data[0].T.flat
    B = data[1].T.flat

    C = np.zeros((4,24))
    C.flat[[21,46,67,95]] = -4*A[2]*B[4]
    C.flat[[70,93]] = -4*A[2]*B[5]
    C.flat[[23,43]] = 4*A[2]*B[5]
    C.flat[[0,7,36,44,51,65,76,81]] = 4*A[0]**2+4*A[1]**2
    C.flat[[14,29,61,83]] = 8*A[0]**2-8*A[1]**2
    C.flat[19] = -4*A[0]*B[0]-4*A[1]*B[3]
    C.flat[47] = -4*A[0]*B[0]+4*A[1]*B[3]
    C.flat[69] = 4*A[0]*B[0]-4*A[1]*B[3]
    C.flat[94] = 4*A[0]*B[0]+4*A[1]*B[3]
    C.flat[[45,71]] = -4*A[0]*B[1]-4*A[1]*B[2]
    C.flat[[22,91]] = -4*A[0]*B[1]+4*A[1]*B[2]
    C.flat[[2,39,49,90]] = -4*A[0]**2+4*A[1]**2+8*A[2]**2
    C.flat[[16,34,56,78]] = 4*A[0]**2-4*A[1]**2+8*A[2]**2

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(w1,x1,y1,z1):
        return np.array([x1*w1**3,x1*y1*w1**2,x1*w1*y1**2,x1*y1**3,x1*z1*w1**2,x1*y1*w1*z1,x1*z1*y1**2,x1*w1*z1**2,x1*y1*z1**2,x1*z1**3,x1*w1**2,y1*x1*w1,y1**2*x1,z1*x1*w1,z1*y1*x1,z1**2*x1,x1*w1,x1*y1,x1*z1,w1,x1,y1,z1,1])

    return C,U