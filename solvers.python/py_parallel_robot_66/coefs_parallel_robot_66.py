import numpy as np

def coefs_parallel_robot_66(data):
    X = data[0].T.flat
    x = data[1].T.flat
    L = data[2].T.flat

    C = np.zeros((6,46))
    C.flat[[32,35,38,46,47,48,49,50,51,52,53,54,78,81,84,92,93,94,95,96,97,98,99,100,124,127,130,138,139,140,141,142,143,144,145,146,170,173,176,184,185,186,187,188,189,190,191,192,216,219,222,230,231,232,233,234,235,236,237,238,262,265,268]] = 1
    C.flat[45] = -L[0]
    C.flat[80] = -4*x[1]
    C.flat[[61,67,83]] = 4*x[1]
    C.flat[126] = -4*x[2]
    C.flat[[107,113,129]] = 4*x[2]
    C.flat[172] = -4*x[3]
    C.flat[[153,159,175]] = 4*x[3]
    C.flat[218] = -4*x[4]
    C.flat[[199,205,221]] = 4*x[4]
    C.flat[264] = -4*x[5]
    C.flat[[245,251,267]] = 4*x[5]
    C.flat[82] = -4*x[7]
    C.flat[[56,68,77]] = 4*x[7]
    C.flat[128] = -4*x[8]
    C.flat[[102,114,123]] = 4*x[8]
    C.flat[174] = -4*x[9]
    C.flat[[148,160,169]] = 4*x[9]
    C.flat[220] = -4*x[10]
    C.flat[[194,206,215]] = 4*x[10]
    C.flat[266] = -4*x[11]
    C.flat[[240,252,261]] = 4*x[11]
    C.flat[76] = -4*x[13]
    C.flat[[58,63,79]] = 4*x[13]
    C.flat[122] = -4*x[14]
    C.flat[[104,109,125]] = 4*x[14]
    C.flat[168] = -4*x[15]
    C.flat[[150,155,171]] = 4*x[15]
    C.flat[214] = -4*x[16]
    C.flat[[196,201,217]] = 4*x[16]
    C.flat[260] = -4*x[17]
    C.flat[[242,247,263]] = 4*x[17]
    C.flat[[241,243]] = -2*X[5]-2*x[5]
    C.flat[[239,272]] = -2*X[5]+2*x[5]
    C.flat[[65,66]] = -2*X[13]-2*x[13]
    C.flat[[69,90]] = -2*X[13]+2*x[13]
    C.flat[[157,158]] = -2*X[15]-2*x[15]
    C.flat[[161,182]] = -2*X[15]+2*x[15]
    C.flat[[57,59]] = -2*x[1]-2*X[1]
    C.flat[[55,88]] = 2*x[1]-2*X[1]
    C.flat[[103,105]] = -2*x[2]-2*X[2]
    C.flat[[101,134]] = 2*x[2]-2*X[2]
    C.flat[[149,151]] = -2*x[3]-2*X[3]
    C.flat[[147,180]] = 2*x[3]-2*X[3]
    C.flat[[195,197]] = -2*x[4]-2*X[4]
    C.flat[[193,226]] = 2*x[4]-2*X[4]
    C.flat[[60,64]] = -2*x[7]-2*X[7]
    C.flat[[62,89]] = 2*x[7]-2*X[7]
    C.flat[[106,110]] = -2*x[8]-2*X[8]
    C.flat[[108,135]] = 2*x[8]-2*X[8]
    C.flat[[152,156]] = -2*x[9]-2*X[9]
    C.flat[[154,181]] = 2*x[9]-2*X[9]
    C.flat[[198,202]] = -2*x[10]-2*X[10]
    C.flat[[200,227]] = 2*x[10]-2*X[10]
    C.flat[[244,248]] = -2*x[11]-2*X[11]
    C.flat[[246,273]] = 2*x[11]-2*X[11]
    C.flat[[111,112]] = -2*x[14]-2*X[14]
    C.flat[[115,136]] = 2*x[14]-2*X[14]
    C.flat[[203,204]] = -2*x[16]-2*X[16]
    C.flat[[207,228]] = 2*x[16]-2*X[16]
    C.flat[[249,250]] = -2*x[17]-2*X[17]
    C.flat[[253,274]] = 2*x[17]-2*X[17]
    C.flat[71] = -4*X[1]*x[7]-4*X[7]*x[1]
    C.flat[87] = -4*X[1]*x[7]+4*X[7]*x[1]
    C.flat[73] = -4*X[1]*x[13]-4*X[13]*x[1]
    C.flat[86] = 4*X[1]*x[13]-4*X[13]*x[1]
    C.flat[117] = -4*X[2]*x[8]-4*X[8]*x[2]
    C.flat[133] = -4*X[2]*x[8]+4*X[8]*x[2]
    C.flat[119] = -4*X[2]*x[14]-4*X[14]*x[2]
    C.flat[132] = 4*X[2]*x[14]-4*X[14]*x[2]
    C.flat[163] = -4*X[3]*x[9]-4*X[9]*x[3]
    C.flat[179] = -4*X[3]*x[9]+4*X[9]*x[3]
    C.flat[165] = -4*X[3]*x[15]-4*X[15]*x[3]
    C.flat[178] = 4*X[3]*x[15]-4*X[15]*x[3]
    C.flat[209] = -4*X[4]*x[10]-4*X[10]*x[4]
    C.flat[225] = -4*X[4]*x[10]+4*X[10]*x[4]
    C.flat[211] = -4*X[4]*x[16]-4*X[16]*x[4]
    C.flat[224] = 4*X[4]*x[16]-4*X[16]*x[4]
    C.flat[255] = -4*X[5]*x[11]-4*X[11]*x[5]
    C.flat[271] = -4*X[5]*x[11]+4*X[11]*x[5]
    C.flat[257] = -4*X[5]*x[17]-4*X[17]*x[5]
    C.flat[270] = 4*X[5]*x[17]-4*X[17]*x[5]
    C.flat[74] = -4*X[7]*x[13]-4*X[13]*x[7]
    C.flat[85] = -4*X[7]*x[13]+4*X[13]*x[7]
    C.flat[120] = -4*X[8]*x[14]-4*X[14]*x[8]
    C.flat[131] = -4*X[8]*x[14]+4*X[14]*x[8]
    C.flat[166] = -4*X[9]*x[15]-4*X[15]*x[9]
    C.flat[177] = -4*X[9]*x[15]+4*X[15]*x[9]
    C.flat[212] = -4*X[10]*x[16]-4*X[16]*x[10]
    C.flat[223] = -4*X[10]*x[16]+4*X[16]*x[10]
    C.flat[258] = -4*X[11]*x[17]-4*X[17]*x[11]
    C.flat[269] = -4*X[11]*x[17]+4*X[17]*x[11]
    C.flat[91] = X[1]**2-2*X[1]*x[1]+X[7]**2-2*X[7]*x[7]+X[13]**2-2*X[13]*x[13]+x[1]**2+x[7]**2+x[13]**2-L[1]
    C.flat[70] = X[1]**2-2*X[1]*x[1]+X[7]**2+2*X[7]*x[7]+X[13]**2+2*X[13]*x[13]+x[1]**2+x[7]**2+x[13]**2-L[1]
    C.flat[72] = X[1]**2+2*X[1]*x[1]+X[7]**2-2*X[7]*x[7]+X[13]**2+2*X[13]*x[13]+x[1]**2+x[7]**2+x[13]**2-L[1]
    C.flat[75] = X[1]**2+2*X[1]*x[1]+X[7]**2+2*X[7]*x[7]+X[13]**2-2*X[13]*x[13]+x[1]**2+x[7]**2+x[13]**2-L[1]
    C.flat[137] = X[2]**2-2*X[2]*x[2]+X[8]**2-2*X[8]*x[8]+X[14]**2-2*X[14]*x[14]+x[2]**2+x[8]**2+x[14]**2-L[2]
    C.flat[116] = X[2]**2-2*X[2]*x[2]+X[8]**2+2*X[8]*x[8]+X[14]**2+2*X[14]*x[14]+x[2]**2+x[8]**2+x[14]**2-L[2]
    C.flat[118] = X[2]**2+2*X[2]*x[2]+X[8]**2-2*X[8]*x[8]+X[14]**2+2*X[14]*x[14]+x[2]**2+x[8]**2+x[14]**2-L[2]
    C.flat[121] = X[2]**2+2*X[2]*x[2]+X[8]**2+2*X[8]*x[8]+X[14]**2-2*X[14]*x[14]+x[2]**2+x[8]**2+x[14]**2-L[2]
    C.flat[183] = X[3]**2-2*X[3]*x[3]+X[9]**2-2*X[9]*x[9]+X[15]**2-2*X[15]*x[15]+x[3]**2+x[9]**2+x[15]**2-L[3]
    C.flat[162] = X[3]**2-2*X[3]*x[3]+X[9]**2+2*X[9]*x[9]+X[15]**2+2*X[15]*x[15]+x[3]**2+x[9]**2+x[15]**2-L[3]
    C.flat[164] = X[3]**2+2*X[3]*x[3]+X[9]**2-2*X[9]*x[9]+X[15]**2+2*X[15]*x[15]+x[3]**2+x[9]**2+x[15]**2-L[3]
    C.flat[167] = X[3]**2+2*X[3]*x[3]+X[9]**2+2*X[9]*x[9]+X[15]**2-2*X[15]*x[15]+x[3]**2+x[9]**2+x[15]**2-L[3]
    C.flat[229] = X[4]**2-2*X[4]*x[4]+X[10]**2-2*X[10]*x[10]+X[16]**2-2*X[16]*x[16]+x[4]**2+x[10]**2+x[16]**2-L[4]
    C.flat[208] = X[4]**2-2*X[4]*x[4]+X[10]**2+2*X[10]*x[10]+X[16]**2+2*X[16]*x[16]+x[4]**2+x[10]**2+x[16]**2-L[4]
    C.flat[210] = X[4]**2+2*X[4]*x[4]+X[10]**2-2*X[10]*x[10]+X[16]**2+2*X[16]*x[16]+x[4]**2+x[10]**2+x[16]**2-L[4]
    C.flat[213] = X[4]**2+2*X[4]*x[4]+X[10]**2+2*X[10]*x[10]+X[16]**2-2*X[16]*x[16]+x[4]**2+x[10]**2+x[16]**2-L[4]
    C.flat[275] = X[5]**2-2*X[5]*x[5]+X[11]**2-2*X[11]*x[11]+X[17]**2-2*X[17]*x[17]+x[5]**2+x[11]**2+x[17]**2-L[5]
    C.flat[254] = X[5]**2-2*X[5]*x[5]+X[11]**2+2*X[11]*x[11]+X[17]**2+2*X[17]*x[17]+x[5]**2+x[11]**2+x[17]**2-L[5]
    C.flat[256] = X[5]**2+2*X[5]*x[5]+X[11]**2-2*X[11]*x[11]+X[17]**2+2*X[17]*x[17]+x[5]**2+x[11]**2+x[17]**2-L[5]
    C.flat[259] = X[5]**2+2*X[5]*x[5]+X[11]**2+2*X[11]*x[11]+X[17]**2-2*X[17]*x[17]+x[5]**2+x[11]**2+x[17]**2-L[5]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(a,b,c,u,v,w):
        return np.array([a**2*u**2,b**2*u**2,c**2*u**2,a**2*v**2,b**2*v**2,c**2*v**2,a**2*w**2,b**2*w**2,c**2*w**2,u*a**2,u*b*a,u*b**2,u*c*a,u*c**2,v*a**2,v*b*a,v*b**2,v*c*b,v*c**2,w*a**2,w*b**2,w*c*a,w*c*b,w*c**2,a**2,a*b,b**2,a*c,b*c,c**2,b*u,c*u,u**2,a*v,c*v,v**2,a*w,b*w,w**2,a,b,c,u,v,w,1])

    return C,U