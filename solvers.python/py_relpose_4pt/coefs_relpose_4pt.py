import numpy as np

def coefs_relpose_4pt(data):
    x1 = data[0].T.flat
    x2 = data[1].T.flat
    th = data[2].T.flat
    s = np.sin(th[0])
    c = np.cos(th[0])

    C = np.zeros((5,28))
    C.flat[139] = -1
    C.flat[[124,128,133]] = 1
    C.flat[24] = x1[0]*s
    C.flat[25] = x1[1]*s
    C.flat[52] = x1[2]*s
    C.flat[53] = x1[3]*s
    C.flat[80] = x1[4]*s
    C.flat[81] = x1[5]*s
    C.flat[108] = x1[6]*s
    C.flat[109] = x1[7]*s
    C.flat[17] = x2[0]*s
    C.flat[18] = x2[1]*s
    C.flat[45] = x2[2]*s
    C.flat[46] = x2[3]*s
    C.flat[73] = x2[4]*s
    C.flat[74] = x2[5]*s
    C.flat[101] = x2[6]*s
    C.flat[102] = x2[7]*s
    C.flat[13] = x2[0]*x1[1]*s
    C.flat[11] = x2[1]*x1[0]*s
    C.flat[41] = x2[2]*x1[3]*s
    C.flat[39] = x2[3]*x1[2]*s
    C.flat[69] = x2[4]*x1[5]*s
    C.flat[67] = x2[5]*x1[4]*s
    C.flat[97] = x2[6]*x1[7]*s
    C.flat[95] = x2[7]*x1[6]*s
    C.flat[9] = -x1[0]*c+x1[0]
    C.flat[23] = x1[0]*c-x2[0]*c
    C.flat[20] = x1[0]*c-x1[0]
    C.flat[19] = -x1[1]*c+x1[1]
    C.flat[8] = x1[1]*c-x1[1]
    C.flat[37] = -x1[2]*c+x1[2]
    C.flat[51] = x1[2]*c-x2[2]*c
    C.flat[48] = x1[2]*c-x1[2]
    C.flat[47] = -x1[3]*c+x1[3]
    C.flat[36] = x1[3]*c-x1[3]
    C.flat[65] = -x1[4]*c+x1[4]
    C.flat[76] = x1[4]*c-x1[4]
    C.flat[75] = -x1[5]*c+x1[5]
    C.flat[64] = x1[5]*c-x1[5]
    C.flat[93] = -x1[6]*c+x1[6]
    C.flat[107] = x1[6]*c-x2[6]*c
    C.flat[104] = x1[6]*c-x1[6]
    C.flat[103] = -x1[7]*c+x1[7]
    C.flat[92] = x1[7]*c-x1[7]
    C.flat[0] = x2[0]*c-x2[0]
    C.flat[22] = x2[1]*c-x1[1]*c
    C.flat[2] = x2[1]*c-x2[1]
    C.flat[29] = -x2[2]*c+x2[2]
    C.flat[50] = x2[3]*c-x1[3]*c
    C.flat[30] = x2[3]*c-x2[3]
    C.flat[79] = -x2[4]*c+x1[4]*c
    C.flat[57] = -x2[4]*c+x2[4]
    C.flat[78] = x2[5]*c-x1[5]*c
    C.flat[58] = x2[5]*c-x2[5]
    C.flat[85] = -x2[6]*c+x2[6]
    C.flat[106] = x2[7]*c-x1[7]*c
    C.flat[86] = x2[7]*c-x2[7]
    C.flat[26] = -x2[0]*x1[0]*s-x2[1]*x1[1]*s
    C.flat[14] = -x2[0]*x1[0]*s-s
    C.flat[12] = -x2[0]*x1[1]*c+x2[0]*x1[1]
    C.flat[4] = x2[0]*x1[1]*c-x2[0]*x1[1]
    C.flat[7] = -x2[1]*x1[0]*c+x2[1]*x1[0]
    C.flat[27] = -x2[1]*x1[0]*c+x2[0]*x1[1]*c
    C.flat[16] = x2[1]*x1[0]*c-x2[1]*x1[0]
    C.flat[10] = -x2[1]*x1[1]*s-s
    C.flat[54] = -x2[2]*x1[2]*s-x2[3]*x1[3]*s
    C.flat[42] = -x2[2]*x1[2]*s-s
    C.flat[40] = -x2[2]*x1[3]*c+x2[2]*x1[3]
    C.flat[32] = x2[2]*x1[3]*c-x2[2]*x1[3]
    C.flat[35] = -x2[3]*x1[2]*c+x2[3]*x1[2]
    C.flat[55] = -x2[3]*x1[2]*c+x2[2]*x1[3]*c
    C.flat[44] = x2[3]*x1[2]*c-x2[3]*x1[2]
    C.flat[38] = -x2[3]*x1[3]*s-s
    C.flat[82] = -x2[4]*x1[4]*s-x2[5]*x1[5]*s
    C.flat[70] = -x2[4]*x1[4]*s-s
    C.flat[68] = -x2[4]*x1[5]*c+x2[4]*x1[5]
    C.flat[60] = x2[4]*x1[5]*c-x2[4]*x1[5]
    C.flat[83] = x2[4]*x1[5]*c-x2[5]*x1[4]*c
    C.flat[63] = -x2[5]*x1[4]*c+x2[5]*x1[4]
    C.flat[72] = x2[5]*x1[4]*c-x2[5]*x1[4]
    C.flat[66] = -x2[5]*x1[5]*s-s
    C.flat[110] = -x2[6]*x1[6]*s-x2[7]*x1[7]*s
    C.flat[98] = -x2[6]*x1[6]*s-s
    C.flat[96] = -x2[6]*x1[7]*c+x2[6]*x1[7]
    C.flat[88] = x2[6]*x1[7]*c-x2[6]*x1[7]
    C.flat[91] = -x2[7]*x1[6]*c+x2[7]*x1[6]
    C.flat[111] = -x2[7]*x1[6]*c+x2[6]*x1[7]*c
    C.flat[100] = x2[7]*x1[6]*c-x2[7]*x1[6]
    C.flat[94] = -x2[7]*x1[7]*s-s
    C.flat[1] = x2[0]-x2[0]*c
    C.flat[3] = x2[1]-x2[1]*c
    C.flat[28] = -x2[2]+x2[2]*c
    C.flat[31] = x2[3]-x2[3]*c
    C.flat[56] = -x2[4]+x2[4]*c
    C.flat[59] = x2[5]-x2[5]*c
    C.flat[84] = -x2[6]+x2[6]*c
    C.flat[87] = x2[7]-x2[7]*c
    C.flat[5] = -1+c-x2[0]*x1[0]*c+x2[0]*x1[0]
    C.flat[33] = -1+c-x2[2]*x1[2]*c+x2[2]*x1[2]
    C.flat[61] = -1+c-x2[4]*x1[4]*c+x2[4]*x1[4]
    C.flat[89] = -1+c-x2[6]*x1[6]*c+x2[6]*x1[6]
    C.flat[6] = 1-c+x2[1]*x1[1]*c-x2[1]*x1[1]
    C.flat[34] = 1-c+x2[3]*x1[3]*c-x2[3]*x1[3]
    C.flat[62] = 1-c+x2[5]*x1[5]*c-x2[5]*x1[5]
    C.flat[90] = 1-c+x2[7]*x1[7]*c-x2[7]*x1[7]
    C.flat[15] = -x2[0]*x1[0]+x2[1]*x1[1]+x2[0]*x1[0]*c-x2[1]*x1[1]*c
    C.flat[43] = -x2[2]*x1[2]+x2[3]*x1[3]+x2[2]*x1[2]*c-x2[3]*x1[3]*c
    C.flat[71] = -x2[4]*x1[4]+x2[5]*x1[5]+x2[4]*x1[4]*c-x2[5]*x1[5]*c
    C.flat[99] = -x2[6]*x1[6]+x2[7]*x1[7]+x2[6]*x1[6]*c-x2[7]*x1[7]*c

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(v,w,x,y,z):
        return np.array([w*x**2,y*x*v,w*x*y,y**2*v,z*x*v,w*x*z,z*y*v,w*y*z,v*z**2,w*z**2,x*v,x*w,x**2,y*v,y*w,x*y,y**2,z*v,z*w,x*z,y*z,z**2,v,w,x,y,z,1])

    return C,U