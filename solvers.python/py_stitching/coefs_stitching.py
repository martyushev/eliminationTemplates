import numpy as np

def coefs_stitching(data):
    c1 = data[0].T.flat
    c2 = data[1].T.flat

    C = np.zeros((2,16))
    C.flat[0] = c1[0]
    C.flat[1] = c1[1]
    C.flat[2] = c1[2]
    C.flat[3] = c1[3]
    C.flat[4] = c1[4]
    C.flat[5] = c1[5]
    C.flat[6] = c1[6]
    C.flat[7] = c1[7]
    C.flat[9] = c1[8]
    C.flat[8] = c1[9]
    C.flat[10] = c1[10]
    C.flat[12] = c1[11]
    C.flat[11] = c1[12]
    C.flat[13] = c1[13]
    C.flat[14] = c1[14]
    C.flat[15] = c1[15]
    C.flat[16] = c2[0]
    C.flat[17] = c2[1]
    C.flat[18] = c2[2]
    C.flat[19] = c2[3]
    C.flat[20] = c2[4]
    C.flat[21] = c2[5]
    C.flat[22] = c2[6]
    C.flat[23] = c2[7]
    C.flat[25] = c2[8]
    C.flat[24] = c2[9]
    C.flat[26] = c2[10]
    C.flat[28] = c2[11]
    C.flat[27] = c2[12]
    C.flat[29] = c2[13]
    C.flat[30] = c2[14]
    C.flat[31] = c2[15]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x,y):
        return np.array([x**6*y**3,x**5*y**3,x**4*y**3,x**4*y**2,y**3*x**3,y**2*x**3,y**3*x**2,y**2*x**2,y**3*x,y*x**2,y**2*x,y**3,x*y,y**2,y,1])

    return C,U