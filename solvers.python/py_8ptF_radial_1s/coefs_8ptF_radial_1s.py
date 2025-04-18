import numpy as np

def coefs_8ptF_radial_1s(data):
    d = data[0].T.flat

    C = np.zeros((2,16))
    C.flat[29] = -d[23]
    C.flat[31] = -d[31]
    C.flat[0] = -d[4]*d[5]*d[2]+d[6]*d[3]*d[2]
    C.flat[9] = -d[12]*d[10]*d[13]+d[10]*d[11]*d[14]
    C.flat[27] = d[18]-d[7]
    C.flat[30] = d[26]-d[15]
    C.flat[6] = -d[16]*d[22]+d[17]*d[21]+d[18]*d[22]*d[19]-d[18]*d[21]*d[20]
    C.flat[15] = d[30]*d[27]*d[26]-d[28]*d[29]*d[26]+d[24]*d[28]-d[25]*d[27]
    C.flat[2] = d[6]*d[10]*d[3]+d[6]*d[11]*d[2]-d[12]*d[5]*d[2]-d[4]*d[10]*d[5]-d[4]*d[13]*d[2]+d[3]*d[2]*d[14]
    C.flat[5] = d[6]*d[10]*d[11]-d[12]*d[10]*d[5]-d[12]*d[13]*d[2]-d[4]*d[10]*d[13]+d[10]*d[3]*d[14]+d[11]*d[2]*d[14]
    C.flat[12] = d[12]*d[8]-d[11]*d[9]-d[12]*d[10]*d[29]-d[12]*d[13]*d[26]+d[30]*d[10]*d[11]-d[10]*d[28]*d[13]+d[10]*d[27]*d[14]+d[11]*d[14]*d[26]
    C.flat[1] = d[6]*d[18]*d[3]+d[6]*d[19]*d[2]-d[18]*d[4]*d[5]-d[4]*d[21]*d[2]+d[22]*d[3]*d[2]-d[5]*d[2]*d[20]-d[0]*d[6]+d[1]*d[5]
    C.flat[14] = d[12]*d[24]+d[8]*d[28]-d[25]*d[11]-d[9]*d[27]-d[12]*d[29]*d[26]+d[30]*d[10]*d[27]+d[30]*d[11]*d[26]-d[10]*d[28]*d[29]-d[28]*d[13]*d[26]+d[27]*d[14]*d[26]
    C.flat[3] = d[6]*d[18]*d[19]-d[18]*d[4]*d[21]+d[18]*d[22]*d[3]-d[18]*d[5]*d[20]+d[22]*d[19]*d[2]-d[21]*d[2]*d[20]-d[0]*d[22]-d[6]*d[16]+d[5]*d[17]+d[1]*d[21]
    C.flat[10] = -d[24]*d[22]-d[30]*d[16]+d[20]*d[16]+d[17]*d[29]-d[19]*d[17]+d[25]*d[21]+d[18]*d[30]*d[19]+d[18]*d[22]*d[27]-d[18]*d[28]*d[21]-d[18]*d[29]*d[20]+d[22]*d[19]*d[26]-d[21]*d[20]*d[26]
    C.flat[13] = -d[24]*d[30]+d[24]*d[20]+d[16]*d[28]-d[17]*d[27]+d[25]*d[29]-d[19]*d[25]+d[18]*d[30]*d[27]-d[18]*d[28]*d[29]+d[30]*d[19]*d[26]+d[22]*d[27]*d[26]-d[28]*d[21]*d[26]-d[29]*d[20]*d[26]
    C.flat[4] = d[6]*d[18]*d[11]+d[6]*d[10]*d[19]+d[6]*d[3]*d[26]+d[6]*d[27]*d[2]-d[12]*d[18]*d[5]-d[12]*d[21]*d[2]-d[18]*d[4]*d[13]+d[18]*d[3]*d[14]+d[30]*d[3]*d[2]-d[4]*d[10]*d[21]-d[4]*d[5]*d[26]-d[4]*d[29]*d[2]+d[10]*d[22]*d[3]-d[10]*d[5]*d[20]+d[22]*d[11]*d[2]-d[28]*d[5]*d[2]-d[13]*d[2]*d[20]+d[19]*d[2]*d[14]+d[0]*d[4]-d[0]*d[14]-d[6]*d[8]+d[5]*d[9]+d[1]*d[13]-d[1]*d[3]
    C.flat[8] = -d[12]*d[18]*d[13]-d[12]*d[10]*d[21]-d[12]*d[5]*d[26]-d[12]*d[29]*d[2]+d[18]*d[11]*d[14]+d[30]*d[10]*d[3]+d[30]*d[11]*d[2]-d[4]*d[10]*d[29]-d[4]*d[13]*d[26]+d[10]*d[22]*d[11]-d[10]*d[28]*d[5]-d[10]*d[13]*d[20]+d[10]*d[19]*d[14]-d[28]*d[13]*d[2]+d[3]*d[14]*d[26]+d[27]*d[2]*d[14]+d[6]*d[10]*d[27]+d[6]*d[11]*d[26]+d[0]*d[12]+d[8]*d[4]-d[1]*d[11]+d[13]*d[9]-d[3]*d[9]-d[8]*d[14]
    C.flat[7] = d[4]*d[16]-d[1]*d[19]+d[0]*d[20]-d[18]*d[4]*d[29]+d[30]*d[19]*d[2]+d[18]*d[30]*d[3]+d[6]*d[19]*d[26]-d[5]*d[20]*d[26]-d[4]*d[21]*d[26]+d[22]*d[3]*d[26]+d[22]*d[27]*d[2]+d[6]*d[18]*d[27]-d[28]*d[21]*d[2]-d[18]*d[28]*d[5]-d[29]*d[2]*d[20]+d[18]*d[19]*d[14]-d[18]*d[13]*d[20]-d[10]*d[21]*d[20]-d[12]*d[18]*d[21]+d[10]*d[22]*d[19]+d[18]*d[22]*d[11]-d[6]*d[24]+d[9]*d[21]-d[0]*d[30]+d[13]*d[17]-d[14]*d[16]+d[1]*d[29]+d[25]*d[5]-d[8]*d[22]-d[17]*d[3]
    C.flat[11] = -d[17]*d[11]+d[8]*d[20]+d[30]*d[3]*d[26]+d[30]*d[27]*d[2]+d[30]*d[10]*d[19]+d[18]*d[30]*d[11]+d[19]*d[14]*d[26]-d[13]*d[20]*d[26]-d[12]*d[21]*d[26]+d[22]*d[11]*d[26]+d[6]*d[27]*d[26]+d[10]*d[22]*d[27]+d[18]*d[27]*d[14]-d[28]*d[5]*d[26]-d[10]*d[28]*d[21]-d[18]*d[28]*d[13]-d[4]*d[29]*d[26]-d[28]*d[29]*d[2]-d[10]*d[29]*d[20]-d[12]*d[18]*d[29]+d[13]*d[25]-d[25]*d[3]-d[1]*d[27]+d[0]*d[28]-d[19]*d[9]+d[24]*d[4]+d[12]*d[16]+d[29]*d[9]-d[30]*d[8]-d[24]*d[14]
    C.flat[24] = d[2]
    C.flat[28] = d[10]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x,y):
        return np.array([y**3*x**3,y**2*x**3,y**3*x**2,y*x**3,y**2*x**2,y**3*x,x**3,y*x**2,x*y**2,y**3,x**2,y*x,y**2,x,y,1])

    return C,U