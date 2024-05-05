import numpy as np

def coefs_toy(data):
    A = data[0].T.flat

    C = np.zeros((3,10))
    C.flat[[4,6,8,13,15,17,20,21,22]] = 1
    C.flat[9] = A[0]
    C.flat[19] = A[1]
    C.flat[29] = A[2]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x,y,z):
        return np.array([x**3,y**3,z**2*x,x**2,x*y,y**2,y*z,z**2,z,1])

    return C,U