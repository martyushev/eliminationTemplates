import numpy as np

def coefs_opt_pnp_hesch(data):
    c = data[0].T.flat

    C = np.zeros((3,20))
    C.flat[16] = 2*c[4]
    C.flat[37] = 2*c[7]
    C.flat[58] = 2*c[9]
    C.flat[10] = 3*c[10]
    C.flat[11] = 2*c[11]
    C.flat[13] = 2*c[12]
    C.flat[31] = 2*c[13]
    C.flat[53] = 2*c[15]
    C.flat[32] = 3*c[16]
    C.flat[34] = 2*c[17]
    C.flat[54] = 2*c[18]
    C.flat[55] = 3*c[19]
    C.flat[0] = 4*c[20]
    C.flat[1] = 3*c[21]
    C.flat[4] = 3*c[22]
    C.flat[[2,21]] = 2*c[23]
    C.flat[5] = 2*c[24]
    C.flat[[7,44]] = 2*c[25]
    C.flat[22] = 3*c[26]
    C.flat[25] = 2*c[27]
    C.flat[45] = 2*c[28]
    C.flat[47] = 3*c[29]
    C.flat[23] = 4*c[30]
    C.flat[26] = 3*c[31]
    C.flat[[28,46]] = 2*c[32]
    C.flat[48] = 3*c[33]
    C.flat[49] = 4*c[34]
    C.flat[19] = c[1]
    C.flat[39] = c[2]
    C.flat[59] = c[3]
    C.flat[[17,36]] = c[5]
    C.flat[[18,56]] = c[6]
    C.flat[[38,57]] = c[8]
    C.flat[30] = c[11]
    C.flat[50] = c[12]
    C.flat[12] = c[13]
    C.flat[[14,33,51]] = c[14]
    C.flat[15] = c[15]
    C.flat[52] = c[17]
    C.flat[35] = c[18]
    C.flat[20] = c[21]
    C.flat[40] = c[22]
    C.flat[[24,41]] = c[24]
    C.flat[3] = c[26]
    C.flat[[6,42]] = c[27]
    C.flat[[8,27]] = c[28]
    C.flat[9] = c[29]
    C.flat[43] = c[31]
    C.flat[29] = c[33]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x,y,z):
        return np.array([x**3,y*x**2,y**2*x,y**3,z*x**2,z*y*x,z*y**2,z**2*x,z**2*y,z**3,x**2,x*y,y**2,x*z,y*z,z**2,x,y,z,1])

    return C,U