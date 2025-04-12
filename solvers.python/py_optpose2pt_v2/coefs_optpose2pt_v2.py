import numpy as np

def coefs_optpose2pt_v2(data):
    U = data[0].T.flat
    u = data[1].T.flat

    C = np.zeros((6,21))
    C.flat[62] = -1
    C.flat[[51,56]] = 1
    C.flat[[0,2]] = u[0]
    C.flat[5] = u[3]
    C.flat[[21,23]] = u[4]
    C.flat[26] = u[7]
    C.flat[20] = u[0]*U[0]**2
    C.flat[41] = u[4]*U[3]**2
    C.flat[3] = 2*u[1]
    C.flat[4] = 2*u[2]
    C.flat[24] = 2*u[5]
    C.flat[25] = 2*u[6]
    C.flat[10] = 2*U[1]*u[1]
    C.flat[6] = 2*U[2]*u[1]
    C.flat[31] = 2*U[4]*u[5]
    C.flat[27] = 2*U[5]*u[5]
    C.flat[15] = 2*u[0]*U[0]
    C.flat[17] = 2*u[1]*U[0]
    C.flat[36] = 2*u[4]*U[3]
    C.flat[38] = 2*u[5]*U[3]
    C.flat[19] = 2*u[1]*U[1]*U[0]
    C.flat[18] = 2*u[1]*U[2]*U[0]
    C.flat[40] = 2*u[5]*U[4]*U[3]
    C.flat[39] = 2*u[5]*U[5]*U[3]
    C.flat[11] = 2*U[1]*u[2]-2*U[2]*u[0]
    C.flat[7] = 2*U[1]*u[0]+2*U[2]*u[2]
    C.flat[12] = 2*U[1]*u[3]-2*U[2]*u[2]
    C.flat[8] = 2*U[1]*u[2]+2*U[2]*u[3]
    C.flat[84] = -U[1]*u[1]*u[5]+U[4]*u[1]*u[5]
    C.flat[63] = -U[2]*u[1]*u[5]+U[5]*u[1]*u[5]
    C.flat[32] = 2*U[4]*u[6]-2*U[5]*u[4]
    C.flat[28] = 2*U[4]*u[4]+2*U[5]*u[6]
    C.flat[33] = 2*U[4]*u[7]-2*U[5]*u[6]
    C.flat[29] = 2*U[4]*u[6]+2*U[5]*u[7]
    C.flat[104] = -U[0]*U[1]*U[3]*u[1]*u[5]+U[0]*U[3]*U[4]*u[1]*u[5]
    C.flat[83] = -U[0]*U[2]*U[3]*u[1]*u[5]+U[0]*U[3]*U[5]*u[1]*u[5]
    C.flat[105] = -U[1]*U[5]*u[1]*u[5]+U[2]*U[4]*u[1]*u[5]
    C.flat[125] = -U[0]*U[1]*U[3]*U[5]*u[1]*u[5]+U[0]*U[2]*U[3]*U[4]*u[1]*u[5]
    C.flat[14] = U[1]**2*u[3]-2*U[1]*U[2]*u[2]+U[2]**2*u[0]
    C.flat[9] = U[1]**2*u[0]+2*U[1]*U[2]*u[2]+U[2]**2*u[3]
    C.flat[35] = U[4]**2*u[7]-2*U[4]*U[5]*u[6]+U[5]**2*u[4]
    C.flat[30] = U[4]**2*u[4]+2*U[4]*U[5]*u[6]+U[5]**2*u[7]
    C.flat[13] = 2*U[1]**2*u[2]-2*U[1]*U[2]*u[0]+2*U[1]*U[2]*u[3]-2*U[2]**2*u[2]
    C.flat[34] = 2*U[4]**2*u[6]-2*U[4]*U[5]*u[4]+2*U[4]*U[5]*u[7]-2*U[5]**2*u[6]
    C.flat[99] = -U[0]*U[1]*u[1]*u[5]+U[0]*U[4]*u[1]*u[5]-U[1]*U[3]*u[1]*u[5]+U[3]*U[4]*u[1]*u[5]
    C.flat[78] = -U[0]*U[2]*u[1]*u[5]+U[0]*U[5]*u[1]*u[5]-U[2]*U[3]*u[1]*u[5]+U[3]*U[5]*u[1]*u[5]
    C.flat[120] = -U[0]*U[1]*U[5]*u[1]*u[5]+U[0]*U[2]*U[4]*u[1]*u[5]-U[1]*U[3]*U[5]*u[1]*u[5]+U[2]*U[3]*U[4]*u[1]*u[5]
    C.flat[86] = -U[1]*u[2]*u[6]+U[2]*u[0]*u[6]+U[4]*u[2]*u[6]-U[5]*u[2]*u[4]
    C.flat[65] = -U[1]*u[0]*u[6]-U[2]*u[2]*u[6]+U[4]*u[2]*u[4]+U[5]*u[2]*u[6]
    C.flat[89] = -U[1]*u[3]*u[7]+U[2]*u[2]*u[7]+U[4]*u[3]*u[7]-U[5]*u[3]*u[6]
    C.flat[68] = -U[1]*u[2]*u[7]-U[2]*u[3]*u[7]+U[4]*u[3]*u[6]+U[5]*u[3]*u[7]
    C.flat[85] = -U[1]*u[1]*u[6]-U[1]*u[2]*u[5]+U[2]*u[0]*u[5]+U[4]*u[1]*u[6]+U[4]*u[2]*u[5]-U[5]*u[1]*u[4]
    C.flat[64] = -U[1]*u[0]*u[5]-U[2]*u[1]*u[6]-U[2]*u[2]*u[5]+U[4]*u[1]*u[4]+U[5]*u[1]*u[6]+U[5]*u[2]*u[5]
    C.flat[96] = -U[1]**2*u[3]*u[7]+2*U[1]*U[2]*u[2]*u[7]-U[2]**2*u[0]*u[7]+U[4]**2*u[3]*u[7]-2*U[4]*U[5]*u[3]*u[6]+U[5]**2*u[3]*u[4]
    C.flat[71] = -U[1]**2*u[0]*u[7]-2*U[1]*U[2]*u[2]*u[7]-U[2]**2*u[3]*u[7]+U[4]**2*u[3]*u[4]+2*U[4]*U[5]*u[3]*u[6]+U[5]**2*u[3]*u[7]
    C.flat[66] = -U[1]*u[2]*u[5]-U[2]*u[1]*u[7]-U[2]*u[3]*u[5]+U[4]*u[1]*u[6]+U[5]*u[1]*u[7]+U[5]*u[3]*u[5]
    C.flat[87] = -U[1]*u[1]*u[7]-U[1]*u[3]*u[5]+U[2]*u[2]*u[5]+U[4]*u[1]*u[7]+U[4]*u[3]*u[5]-U[5]*u[1]*u[6]
    C.flat[79] = -U[0]*U[2]*u[1]*u[6]+U[0]*U[4]*u[1]*u[4]+U[0]*U[5]*u[1]*u[6]-U[1]*U[3]*u[0]*u[5]-U[2]*U[3]*u[2]*u[5]+U[3]*U[5]*u[2]*u[5]
    C.flat[100] = -U[0]*U[1]*u[1]*u[6]+U[0]*U[4]*u[1]*u[6]-U[0]*U[5]*u[1]*u[4]-U[1]*U[3]*u[2]*u[5]+U[2]*U[3]*u[0]*u[5]+U[3]*U[4]*u[2]*u[5]
    C.flat[80] = -U[0]*U[2]*u[1]*u[7]+U[0]*U[4]*u[1]*u[6]+U[0]*U[5]*u[1]*u[7]-U[1]*U[3]*u[2]*u[5]-U[2]*U[3]*u[3]*u[5]+U[3]*U[5]*u[3]*u[5]
    C.flat[101] = -U[0]*U[1]*u[1]*u[7]+U[0]*U[4]*u[1]*u[7]-U[0]*U[5]*u[1]*u[6]-U[1]*U[3]*u[3]*u[5]+U[2]*U[3]*u[2]*u[5]+U[3]*U[4]*u[3]*u[5]
    C.flat[107] = U[1]*U[4]*u[0]*u[6]-U[1]*U[4]*u[2]*u[4]-U[1]*U[5]*u[0]*u[4]-U[1]*U[5]*u[2]*u[6]+U[2]*U[4]*u[0]*u[4]+U[2]*U[4]*u[2]*u[6]+U[2]*U[5]*u[0]*u[6]-U[2]*U[5]*u[2]*u[4]
    C.flat[110] = U[1]*U[4]*u[2]*u[7]-U[1]*U[4]*u[3]*u[6]-U[1]*U[5]*u[2]*u[6]-U[1]*U[5]*u[3]*u[7]+U[2]*U[4]*u[2]*u[6]+U[2]*U[4]*u[3]*u[7]+U[2]*U[5]*u[2]*u[7]-U[2]*U[5]*u[3]*u[6]
    C.flat[106] = U[1]*U[4]*u[0]*u[5]-U[1]*U[4]*u[1]*u[4]-U[1]*U[5]*u[1]*u[6]-U[1]*U[5]*u[2]*u[5]+U[2]*U[4]*u[1]*u[6]+U[2]*U[4]*u[2]*u[5]+U[2]*U[5]*u[0]*u[5]-U[2]*U[5]*u[1]*u[4]
    C.flat[88] = -U[1]*u[2]*u[7]-U[1]*u[3]*u[6]+U[2]*u[0]*u[7]+U[2]*u[2]*u[6]+U[4]*u[2]*u[7]+U[4]*u[3]*u[6]-U[5]*u[2]*u[6]-U[5]*u[3]*u[4]
    C.flat[67] = -U[1]*u[0]*u[7]-U[1]*u[2]*u[6]-U[2]*u[2]*u[7]-U[2]*u[3]*u[6]+U[4]*u[2]*u[6]+U[4]*u[3]*u[4]+U[5]*u[2]*u[7]+U[5]*u[3]*u[6]
    C.flat[108] = -U[1]*U[4]*u[1]*u[6]+U[1]*U[4]*u[2]*u[5]-U[1]*U[5]*u[1]*u[7]-U[1]*U[5]*u[3]*u[5]+U[2]*U[4]*u[1]*u[7]+U[2]*U[4]*u[3]*u[5]-U[2]*U[5]*u[1]*u[6]+U[2]*U[5]*u[2]*u[5]
    C.flat[121] = -U[0]*U[1]*U[4]*u[1]*u[4]-U[0]*U[1]*U[5]*u[1]*u[6]+U[0]*U[2]*U[4]*u[1]*u[6]-U[0]*U[2]*U[5]*u[1]*u[4]+U[1]*U[3]*U[4]*u[0]*u[5]-U[1]*U[3]*U[5]*u[2]*u[5]+U[2]*U[3]*U[4]*u[2]*u[5]+U[2]*U[3]*U[5]*u[0]*u[5]
    C.flat[122] = -U[0]*U[1]*U[4]*u[1]*u[6]-U[0]*U[1]*U[5]*u[1]*u[7]+U[0]*U[2]*U[4]*u[1]*u[7]-U[0]*U[2]*U[5]*u[1]*u[6]+U[1]*U[3]*U[4]*u[2]*u[5]-U[1]*U[3]*U[5]*u[3]*u[5]+U[2]*U[3]*U[4]*u[3]*u[5]+U[2]*U[3]*U[5]*u[2]*u[5]
    C.flat[94] = -U[1]**2*u[3]*u[5]+2*U[1]*U[2]*u[2]*u[5]-U[1]*U[4]*u[1]*u[7]+U[1]*U[4]*u[3]*u[5]+U[1]*U[5]*u[1]*u[6]-U[2]**2*u[0]*u[5]-U[2]*U[4]*u[2]*u[5]+U[4]**2*u[1]*u[7]-2*U[4]*U[5]*u[1]*u[6]+U[5]**2*u[1]*u[4]
    C.flat[69] = -U[1]**2*u[0]*u[5]-2*U[1]*U[2]*u[2]*u[5]+U[1]*U[5]*u[2]*u[5]-U[2]**2*u[3]*u[5]-U[2]*U[4]*u[1]*u[6]-U[2]*U[5]*u[1]*u[7]+U[2]*U[5]*u[3]*u[5]+U[4]**2*u[1]*u[4]+2*U[4]*U[5]*u[1]*u[6]+U[5]**2*u[1]*u[7]
    C.flat[81] = -U[0]*U[2]*U[4]*u[1]*u[6]-U[0]*U[2]*U[5]*u[1]*u[7]+U[0]*U[4]**2*u[1]*u[4]+2*U[0]*U[4]*U[5]*u[1]*u[6]+U[0]*U[5]**2*u[1]*u[7]-U[1]**2*U[3]*u[0]*u[5]-2*U[1]*U[2]*U[3]*u[2]*u[5]+U[1]*U[3]*U[5]*u[2]*u[5]-U[2]**2*U[3]*u[3]*u[5]+U[2]*U[3]*U[5]*u[3]*u[5]
    C.flat[103] = -U[0]*U[1]*U[4]*u[1]*u[7]+U[0]*U[1]*U[5]*u[1]*u[6]+U[0]*U[4]**2*u[1]*u[7]-2*U[0]*U[4]*U[5]*u[1]*u[6]+U[0]*U[5]**2*u[1]*u[4]-U[1]**2*U[3]*u[3]*u[5]+2*U[1]*U[2]*U[3]*u[2]*u[5]+U[1]*U[3]*U[4]*u[3]*u[5]-U[2]**2*U[3]*u[0]*u[5]-U[2]*U[3]*U[4]*u[2]*u[5]
    C.flat[109] = U[1]*U[4]*u[0]*u[7]-U[1]*U[4]*u[3]*u[4]-U[1]*U[5]*u[0]*u[6]-U[1]*U[5]*u[2]*u[4]-U[1]*U[5]*u[2]*u[7]-U[1]*U[5]*u[3]*u[6]+U[2]*U[4]*u[0]*u[6]+U[2]*U[4]*u[2]*u[4]+U[2]*U[4]*u[2]*u[7]+U[2]*U[4]*u[3]*u[6]+U[2]*U[5]*u[0]*u[7]-U[2]*U[5]*u[3]*u[4]
    C.flat[98] = -U[1]**2*U[4]*u[3]*u[7]+U[1]**2*U[5]*u[3]*u[6]+2*U[1]*U[2]*U[4]*u[2]*u[7]-2*U[1]*U[2]*U[5]*u[2]*u[6]+U[1]*U[4]**2*u[3]*u[7]-2*U[1]*U[4]*U[5]*u[3]*u[6]+U[1]*U[5]**2*u[3]*u[4]-U[2]**2*U[4]*u[0]*u[7]+U[2]**2*U[5]*u[0]*u[6]-U[2]*U[4]**2*u[2]*u[7]+2*U[2]*U[4]*U[5]*u[2]*u[6]-U[2]*U[5]**2*u[2]*u[4]
    C.flat[72] = -U[1]**2*U[4]*u[0]*u[6]-U[1]**2*U[5]*u[0]*u[7]-2*U[1]*U[2]*U[4]*u[2]*u[6]-2*U[1]*U[2]*U[5]*u[2]*u[7]+U[1]*U[4]**2*u[2]*u[4]+2*U[1]*U[4]*U[5]*u[2]*u[6]+U[1]*U[5]**2*u[2]*u[7]-U[2]**2*U[4]*u[3]*u[6]-U[2]**2*U[5]*u[3]*u[7]+U[2]*U[4]**2*u[3]*u[4]+2*U[2]*U[4]*U[5]*u[3]*u[6]+U[2]*U[5]**2*u[3]*u[7]
    C.flat[73] = -U[1]**2*u[2]*u[5]+U[1]*U[2]*u[0]*u[5]-U[1]*U[2]*u[3]*u[5]+U[1]*U[5]*u[3]*u[5]+U[2]**2*u[2]*u[5]-U[2]*U[4]*u[1]*u[7]+U[2]*U[5]*u[1]*u[6]-U[2]*U[5]*u[2]*u[5]+U[4]**2*u[1]*u[6]-U[4]*U[5]*u[1]*u[4]+U[4]*U[5]*u[1]*u[7]-U[5]**2*u[1]*u[6]
    C.flat[90] = -U[1]**2*u[2]*u[5]+U[1]*U[2]*u[0]*u[5]-U[1]*U[2]*u[3]*u[5]-U[1]*U[4]*u[1]*u[6]+U[1]*U[4]*u[2]*u[5]-U[1]*U[5]*u[1]*u[7]+U[2]**2*u[2]*u[5]+U[2]*U[4]*u[3]*u[5]+U[4]**2*u[1]*u[6]-U[4]*U[5]*u[1]*u[4]+U[4]*U[5]*u[1]*u[7]-U[5]**2*u[1]*u[6]
    C.flat[82] = -U[0]*U[2]*U[4]*u[1]*u[7]+U[0]*U[2]*U[5]*u[1]*u[6]+U[0]*U[4]**2*u[1]*u[6]-U[0]*U[4]*U[5]*u[1]*u[4]+U[0]*U[4]*U[5]*u[1]*u[7]-U[0]*U[5]**2*u[1]*u[6]-U[1]**2*U[3]*u[2]*u[5]+U[1]*U[2]*U[3]*u[0]*u[5]-U[1]*U[2]*U[3]*u[3]*u[5]+U[1]*U[3]*U[5]*u[3]*u[5]+U[2]**2*U[3]*u[2]*u[5]-U[2]*U[3]*U[5]*u[2]*u[5]
    C.flat[102] = -U[0]*U[1]*U[4]*u[1]*u[6]-U[0]*U[1]*U[5]*u[1]*u[7]+U[0]*U[4]**2*u[1]*u[6]-U[0]*U[4]*U[5]*u[1]*u[4]+U[0]*U[4]*U[5]*u[1]*u[7]-U[0]*U[5]**2*u[1]*u[6]-U[1]**2*U[3]*u[2]*u[5]+U[1]*U[2]*U[3]*u[0]*u[5]-U[1]*U[2]*U[3]*u[3]*u[5]+U[1]*U[3]*U[4]*u[2]*u[5]+U[2]**2*U[3]*u[2]*u[5]+U[2]*U[3]*U[4]*u[3]*u[5]
    C.flat[95] = -U[1]**2*u[3]*u[6]+2*U[1]*U[2]*u[2]*u[6]-U[1]*U[4]*u[2]*u[7]+U[1]*U[4]*u[3]*u[6]+U[1]*U[5]*u[2]*u[6]-U[1]*U[5]*u[3]*u[4]-U[2]**2*u[0]*u[6]+U[2]*U[4]*u[0]*u[7]-U[2]*U[4]*u[2]*u[6]-U[2]*U[5]*u[0]*u[6]+U[2]*U[5]*u[2]*u[4]+U[4]**2*u[2]*u[7]-2*U[4]*U[5]*u[2]*u[6]+U[5]**2*u[2]*u[4]
    C.flat[91] = -U[1]**2*u[2]*u[6]+U[1]*U[2]*u[0]*u[6]-U[1]*U[2]*u[3]*u[6]-U[1]*U[5]*u[2]*u[4]-U[1]*U[5]*u[2]*u[7]+U[2]**2*u[2]*u[6]+U[2]*U[4]*u[0]*u[6]+U[2]*U[4]*u[3]*u[6]+U[2]*U[5]*u[0]*u[7]-U[2]*U[5]*u[3]*u[4]+U[4]**2*u[2]*u[6]-U[4]*U[5]*u[2]*u[4]+U[4]*U[5]*u[2]*u[7]-U[5]**2*u[2]*u[6]
    C.flat[74] = -U[1]**2*u[2]*u[6]+U[1]*U[2]*u[0]*u[6]-U[1]*U[2]*u[3]*u[6]-U[1]*U[4]*u[0]*u[7]+U[1]*U[4]*u[3]*u[4]+U[1]*U[5]*u[0]*u[6]+U[1]*U[5]*u[3]*u[6]+U[2]**2*u[2]*u[6]-U[2]*U[4]*u[2]*u[4]-U[2]*U[4]*u[2]*u[7]+U[4]**2*u[2]*u[6]-U[4]*U[5]*u[2]*u[4]+U[4]*U[5]*u[2]*u[7]-U[5]**2*u[2]*u[6]
    C.flat[70] = -U[1]**2*u[0]*u[6]-2*U[1]*U[2]*u[2]*u[6]-U[1]*U[4]*u[0]*u[6]+U[1]*U[4]*u[2]*u[4]-U[1]*U[5]*u[0]*u[7]+U[1]*U[5]*u[2]*u[6]-U[2]**2*u[3]*u[6]-U[2]*U[4]*u[2]*u[6]+U[2]*U[4]*u[3]*u[4]-U[2]*U[5]*u[2]*u[7]+U[2]*U[5]*u[3]*u[6]+U[4]**2*u[2]*u[4]+2*U[4]*U[5]*u[2]*u[6]+U[5]**2*u[2]*u[7]
    C.flat[115] = U[1]**2*U[4]*u[2]*u[5]-U[1]**2*U[5]*u[3]*u[5]-U[1]*U[2]*U[4]*u[0]*u[5]+U[1]*U[2]*U[4]*u[3]*u[5]+2*U[1]*U[2]*U[5]*u[2]*u[5]-U[1]*U[4]**2*u[1]*u[6]+U[1]*U[4]*U[5]*u[1]*u[4]-U[1]*U[4]*U[5]*u[1]*u[7]+U[1]*U[5]**2*u[1]*u[6]-U[2]**2*U[4]*u[2]*u[5]-U[2]**2*U[5]*u[0]*u[5]+U[2]*U[4]**2*u[1]*u[7]-2*U[2]*U[4]*U[5]*u[1]*u[6]+U[2]*U[5]**2*u[1]*u[4]
    C.flat[111] = U[1]**2*U[4]*u[0]*u[5]-U[1]**2*U[5]*u[2]*u[5]+2*U[1]*U[2]*U[4]*u[2]*u[5]+U[1]*U[2]*U[5]*u[0]*u[5]-U[1]*U[2]*U[5]*u[3]*u[5]-U[1]*U[4]**2*u[1]*u[4]-2*U[1]*U[4]*U[5]*u[1]*u[6]-U[1]*U[5]**2*u[1]*u[7]+U[2]**2*U[4]*u[3]*u[5]+U[2]**2*U[5]*u[2]*u[5]+U[2]*U[4]**2*u[1]*u[6]-U[2]*U[4]*U[5]*u[1]*u[4]+U[2]*U[4]*U[5]*u[1]*u[7]-U[2]*U[5]**2*u[1]*u[6]
    C.flat[124] = -U[0]*U[1]*U[4]**2*u[1]*u[6]+U[0]*U[1]*U[4]*U[5]*u[1]*u[4]-U[0]*U[1]*U[4]*U[5]*u[1]*u[7]+U[0]*U[1]*U[5]**2*u[1]*u[6]+U[0]*U[2]*U[4]**2*u[1]*u[7]-2*U[0]*U[2]*U[4]*U[5]*u[1]*u[6]+U[0]*U[2]*U[5]**2*u[1]*u[4]+U[1]**2*U[3]*U[4]*u[2]*u[5]-U[1]**2*U[3]*U[5]*u[3]*u[5]-U[1]*U[2]*U[3]*U[4]*u[0]*u[5]+U[1]*U[2]*U[3]*U[4]*u[3]*u[5]+2*U[1]*U[2]*U[3]*U[5]*u[2]*u[5]-U[2]**2*U[3]*U[4]*u[2]*u[5]-U[2]**2*U[3]*U[5]*u[0]*u[5]
    C.flat[123] = -U[0]*U[1]*U[4]**2*u[1]*u[4]-2*U[0]*U[1]*U[4]*U[5]*u[1]*u[6]-U[0]*U[1]*U[5]**2*u[1]*u[7]+U[0]*U[2]*U[4]**2*u[1]*u[6]-U[0]*U[2]*U[4]*U[5]*u[1]*u[4]+U[0]*U[2]*U[4]*U[5]*u[1]*u[7]-U[0]*U[2]*U[5]**2*u[1]*u[6]+U[1]**2*U[3]*U[4]*u[0]*u[5]-U[1]**2*U[3]*U[5]*u[2]*u[5]+2*U[1]*U[2]*U[3]*U[4]*u[2]*u[5]+U[1]*U[2]*U[3]*U[5]*u[0]*u[5]-U[1]*U[2]*U[3]*U[5]*u[3]*u[5]+U[2]**2*U[3]*U[4]*u[3]*u[5]+U[2]**2*U[3]*U[5]*u[2]*u[5]
    C.flat[75] = -U[1]**2*u[2]*u[7]+U[1]*U[2]*u[0]*u[7]-U[1]*U[2]*u[3]*u[7]-U[1]*U[4]*u[2]*u[7]+U[1]*U[4]*u[3]*u[6]+U[1]*U[5]*u[2]*u[6]+U[1]*U[5]*u[3]*u[7]+U[2]**2*u[2]*u[7]-U[2]*U[4]*u[2]*u[6]-U[2]*U[4]*u[3]*u[7]-U[2]*U[5]*u[2]*u[7]+U[2]*U[5]*u[3]*u[6]+U[4]**2*u[3]*u[6]-U[4]*U[5]*u[3]*u[4]+U[4]*U[5]*u[3]*u[7]-U[5]**2*u[3]*u[6]
    C.flat[92] = -U[1]**2*u[2]*u[7]+U[1]*U[2]*u[0]*u[7]-U[1]*U[2]*u[3]*u[7]+U[1]*U[4]*u[2]*u[7]-U[1]*U[4]*u[3]*u[6]-U[1]*U[5]*u[2]*u[6]-U[1]*U[5]*u[3]*u[7]+U[2]**2*u[2]*u[7]+U[2]*U[4]*u[2]*u[6]+U[2]*U[4]*u[3]*u[7]+U[2]*U[5]*u[2]*u[7]-U[2]*U[5]*u[3]*u[6]+U[4]**2*u[3]*u[6]-U[4]*U[5]*u[3]*u[4]+U[4]*U[5]*u[3]*u[7]-U[5]**2*u[3]*u[6]
    C.flat[77] = -U[1]**2*U[4]*u[2]*u[7]+U[1]**2*U[5]*u[2]*u[6]+U[1]*U[2]*U[4]*u[0]*u[7]-U[1]*U[2]*U[4]*u[3]*u[7]-U[1]*U[2]*U[5]*u[0]*u[6]+U[1]*U[2]*U[5]*u[3]*u[6]+U[1]*U[4]**2*u[3]*u[6]-U[1]*U[4]*U[5]*u[3]*u[4]+U[1]*U[4]*U[5]*u[3]*u[7]-U[1]*U[5]**2*u[3]*u[6]+U[2]**2*U[4]*u[2]*u[7]-U[2]**2*U[5]*u[2]*u[6]-U[2]*U[4]**2*u[2]*u[6]+U[2]*U[4]*U[5]*u[2]*u[4]-U[2]*U[4]*U[5]*u[2]*u[7]+U[2]*U[5]**2*u[2]*u[6]
    C.flat[93] = -U[1]**2*U[4]*u[2]*u[6]-U[1]**2*U[5]*u[2]*u[7]+U[1]*U[2]*U[4]*u[0]*u[6]-U[1]*U[2]*U[4]*u[3]*u[6]+U[1]*U[2]*U[5]*u[0]*u[7]-U[1]*U[2]*U[5]*u[3]*u[7]+U[1]*U[4]**2*u[2]*u[6]-U[1]*U[4]*U[5]*u[2]*u[4]+U[1]*U[4]*U[5]*u[2]*u[7]-U[1]*U[5]**2*u[2]*u[6]+U[2]**2*U[4]*u[2]*u[6]+U[2]**2*U[5]*u[2]*u[7]+U[2]*U[4]**2*u[3]*u[6]-U[2]*U[4]*U[5]*u[3]*u[4]+U[2]*U[4]*U[5]*u[3]*u[7]-U[2]*U[5]**2*u[3]*u[6]
    C.flat[118] = U[1]**2*U[4]**2*u[0]*u[7]-U[1]**2*U[4]**2*u[3]*u[4]-2*U[1]**2*U[4]*U[5]*u[0]*u[6]-2*U[1]**2*U[4]*U[5]*u[3]*u[6]+U[1]**2*U[5]**2*u[0]*u[4]-U[1]**2*U[5]**2*u[3]*u[7]+2*U[1]*U[2]*U[4]**2*u[2]*u[4]+2*U[1]*U[2]*U[4]**2*u[2]*u[7]+2*U[1]*U[2]*U[5]**2*u[2]*u[4]+2*U[1]*U[2]*U[5]**2*u[2]*u[7]-U[2]**2*U[4]**2*u[0]*u[4]+U[2]**2*U[4]**2*u[3]*u[7]-2*U[2]**2*U[4]*U[5]*u[0]*u[6]-2*U[2]**2*U[4]*U[5]*u[3]*u[6]-U[2]**2*U[5]**2*u[0]*u[7]+U[2]**2*U[5]**2*u[3]*u[4]
    C.flat[119] = U[1]**2*U[4]**2*u[2]*u[7]-U[1]**2*U[4]**2*u[3]*u[6]-2*U[1]**2*U[4]*U[5]*u[2]*u[6]+U[1]**2*U[4]*U[5]*u[3]*u[4]-U[1]**2*U[4]*U[5]*u[3]*u[7]+U[1]**2*U[5]**2*u[2]*u[4]+U[1]**2*U[5]**2*u[3]*u[6]-U[1]*U[2]*U[4]**2*u[0]*u[7]+2*U[1]*U[2]*U[4]**2*u[2]*u[6]+U[1]*U[2]*U[4]**2*u[3]*u[7]+2*U[1]*U[2]*U[4]*U[5]*u[0]*u[6]-2*U[1]*U[2]*U[4]*U[5]*u[2]*u[4]+2*U[1]*U[2]*U[4]*U[5]*u[2]*u[7]-2*U[1]*U[2]*U[4]*U[5]*u[3]*u[6]-U[1]*U[2]*U[5]**2*u[0]*u[4]-2*U[1]*U[2]*U[5]**2*u[2]*u[6]+U[1]*U[2]*U[5]**2*u[3]*u[4]-U[2]**2*U[4]**2*u[0]*u[6]-U[2]**2*U[4]**2*u[2]*u[7]+U[2]**2*U[4]*U[5]*u[0]*u[4]-U[2]**2*U[4]*U[5]*u[0]*u[7]+2*U[2]**2*U[4]*U[5]*u[2]*u[6]+U[2]**2*U[5]**2*u[0]*u[6]-U[2]**2*U[5]**2*u[2]*u[4]
    C.flat[114] = U[1]**2*U[4]**2*u[0]*u[6]-U[1]**2*U[4]**2*u[2]*u[4]-U[1]**2*U[4]*U[5]*u[0]*u[4]+U[1]**2*U[4]*U[5]*u[0]*u[7]-2*U[1]**2*U[4]*U[5]*u[2]*u[6]-U[1]**2*U[5]**2*u[0]*u[6]-U[1]**2*U[5]**2*u[2]*u[7]+U[1]*U[2]*U[4]**2*u[0]*u[4]+2*U[1]*U[2]*U[4]**2*u[2]*u[6]-U[1]*U[2]*U[4]**2*u[3]*u[4]+2*U[1]*U[2]*U[4]*U[5]*u[0]*u[6]-2*U[1]*U[2]*U[4]*U[5]*u[2]*u[4]+2*U[1]*U[2]*U[4]*U[5]*u[2]*u[7]-2*U[1]*U[2]*U[4]*U[5]*u[3]*u[6]+U[1]*U[2]*U[5]**2*u[0]*u[7]-2*U[1]*U[2]*U[5]**2*u[2]*u[6]-U[1]*U[2]*U[5]**2*u[3]*u[7]+U[2]**2*U[4]**2*u[2]*u[4]+U[2]**2*U[4]**2*u[3]*u[6]+2*U[2]**2*U[4]*U[5]*u[2]*u[6]-U[2]**2*U[4]*U[5]*u[3]*u[4]+U[2]**2*U[4]*U[5]*u[3]*u[7]+U[2]**2*U[5]**2*u[2]*u[7]-U[2]**2*U[5]**2*u[3]*u[6]
    C.flat[97] = -U[1]**2*U[4]*u[2]*u[7]-U[1]**2*U[4]*u[3]*u[6]+U[1]**2*U[5]*u[2]*u[6]-U[1]**2*U[5]*u[3]*u[7]+U[1]*U[2]*U[4]*u[0]*u[7]+2*U[1]*U[2]*U[4]*u[2]*u[6]-U[1]*U[2]*U[4]*u[3]*u[7]-U[1]*U[2]*U[5]*u[0]*u[6]+2*U[1]*U[2]*U[5]*u[2]*u[7]+U[1]*U[2]*U[5]*u[3]*u[6]+U[1]*U[4]**2*u[2]*u[7]+U[1]*U[4]**2*u[3]*u[6]-2*U[1]*U[4]*U[5]*u[2]*u[6]-U[1]*U[4]*U[5]*u[3]*u[4]+U[1]*U[4]*U[5]*u[3]*u[7]+U[1]*U[5]**2*u[2]*u[4]-U[1]*U[5]**2*u[3]*u[6]-U[2]**2*U[4]*u[0]*u[6]+U[2]**2*U[4]*u[2]*u[7]-U[2]**2*U[5]*u[0]*u[7]-U[2]**2*U[5]*u[2]*u[6]-U[2]*U[4]**2*u[2]*u[6]+U[2]*U[4]**2*u[3]*u[7]+U[2]*U[4]*U[5]*u[2]*u[4]-U[2]*U[4]*U[5]*u[2]*u[7]-2*U[2]*U[4]*U[5]*u[3]*u[6]+U[2]*U[5]**2*u[2]*u[6]+U[2]*U[5]**2*u[3]*u[4]
    C.flat[117] = U[1]**2*U[4]*u[2]*u[7]-U[1]**2*U[4]*u[3]*u[6]-U[1]**2*U[5]*u[2]*u[6]-U[1]**2*U[5]*u[3]*u[7]-U[1]*U[2]*U[4]*u[0]*u[7]+2*U[1]*U[2]*U[4]*u[2]*u[6]+U[1]*U[2]*U[4]*u[3]*u[7]+U[1]*U[2]*U[5]*u[0]*u[6]+2*U[1]*U[2]*U[5]*u[2]*u[7]-U[1]*U[2]*U[5]*u[3]*u[6]+U[1]*U[4]**2*u[2]*u[7]-U[1]*U[4]**2*u[3]*u[6]-2*U[1]*U[4]*U[5]*u[2]*u[6]+U[1]*U[4]*U[5]*u[3]*u[4]-U[1]*U[4]*U[5]*u[3]*u[7]+U[1]*U[5]**2*u[2]*u[4]+U[1]*U[5]**2*u[3]*u[6]-U[2]**2*U[4]*u[0]*u[6]-U[2]**2*U[4]*u[2]*u[7]-U[2]**2*U[5]*u[0]*u[7]+U[2]**2*U[5]*u[2]*u[6]+U[2]*U[4]**2*u[2]*u[6]+U[2]*U[4]**2*u[3]*u[7]-U[2]*U[4]*U[5]*u[2]*u[4]+U[2]*U[4]*U[5]*u[2]*u[7]-2*U[2]*U[4]*U[5]*u[3]*u[6]-U[2]*U[5]**2*u[2]*u[6]+U[2]*U[5]**2*u[3]*u[4]
    C.flat[116] = U[1]**2*U[4]*u[2]*u[6]-U[1]**2*U[4]*u[3]*u[4]-U[1]**2*U[5]*u[2]*u[4]-U[1]**2*U[5]*u[3]*u[6]-U[1]*U[2]*U[4]*u[0]*u[6]+2*U[1]*U[2]*U[4]*u[2]*u[4]+U[1]*U[2]*U[4]*u[3]*u[6]+U[1]*U[2]*U[5]*u[0]*u[4]+2*U[1]*U[2]*U[5]*u[2]*u[6]-U[1]*U[2]*U[5]*u[3]*u[4]+U[1]*U[4]**2*u[0]*u[7]-U[1]*U[4]**2*u[2]*u[6]-2*U[1]*U[4]*U[5]*u[0]*u[6]+U[1]*U[4]*U[5]*u[2]*u[4]-U[1]*U[4]*U[5]*u[2]*u[7]+U[1]*U[5]**2*u[0]*u[4]+U[1]*U[5]**2*u[2]*u[6]-U[2]**2*U[4]*u[0]*u[4]-U[2]**2*U[4]*u[2]*u[6]-U[2]**2*U[5]*u[0]*u[6]+U[2]**2*U[5]*u[2]*u[4]+U[2]*U[4]**2*u[0]*u[6]+U[2]*U[4]**2*u[2]*u[7]-U[2]*U[4]*U[5]*u[0]*u[4]+U[2]*U[4]*U[5]*u[0]*u[7]-2*U[2]*U[4]*U[5]*u[2]*u[6]-U[2]*U[5]**2*u[0]*u[6]+U[2]*U[5]**2*u[2]*u[4]
    C.flat[76] = -U[1]**2*U[4]*u[0]*u[7]-U[1]**2*U[4]*u[2]*u[6]+U[1]**2*U[5]*u[0]*u[6]-U[1]**2*U[5]*u[2]*u[7]+U[1]*U[2]*U[4]*u[0]*u[6]-2*U[1]*U[2]*U[4]*u[2]*u[7]-U[1]*U[2]*U[4]*u[3]*u[6]+U[1]*U[2]*U[5]*u[0]*u[7]+2*U[1]*U[2]*U[5]*u[2]*u[6]-U[1]*U[2]*U[5]*u[3]*u[7]+U[1]*U[4]**2*u[2]*u[6]+U[1]*U[4]**2*u[3]*u[4]-U[1]*U[4]*U[5]*u[2]*u[4]+U[1]*U[4]*U[5]*u[2]*u[7]+2*U[1]*U[4]*U[5]*u[3]*u[6]-U[1]*U[5]**2*u[2]*u[6]+U[1]*U[5]**2*u[3]*u[7]+U[2]**2*U[4]*u[2]*u[6]-U[2]**2*U[4]*u[3]*u[7]+U[2]**2*U[5]*u[2]*u[7]+U[2]**2*U[5]*u[3]*u[6]-U[2]*U[4]**2*u[2]*u[4]+U[2]*U[4]**2*u[3]*u[6]-2*U[2]*U[4]*U[5]*u[2]*u[6]-U[2]*U[4]*U[5]*u[3]*u[4]+U[2]*U[4]*U[5]*u[3]*u[7]-U[2]*U[5]**2*u[2]*u[7]-U[2]*U[5]**2*u[3]*u[6]
    C.flat[113] = U[1]**2*U[4]*u[0]*u[7]-U[1]**2*U[4]*u[2]*u[6]-U[1]**2*U[5]*u[0]*u[6]-U[1]**2*U[5]*u[2]*u[7]+U[1]*U[2]*U[4]*u[0]*u[6]+2*U[1]*U[2]*U[4]*u[2]*u[7]-U[1]*U[2]*U[4]*u[3]*u[6]+U[1]*U[2]*U[5]*u[0]*u[7]-2*U[1]*U[2]*U[5]*u[2]*u[6]-U[1]*U[2]*U[5]*u[3]*u[7]+U[1]*U[4]**2*u[2]*u[6]-U[1]*U[4]**2*u[3]*u[4]-U[1]*U[4]*U[5]*u[2]*u[4]+U[1]*U[4]*U[5]*u[2]*u[7]-2*U[1]*U[4]*U[5]*u[3]*u[6]-U[1]*U[5]**2*u[2]*u[6]-U[1]*U[5]**2*u[3]*u[7]+U[2]**2*U[4]*u[2]*u[6]+U[2]**2*U[4]*u[3]*u[7]+U[2]**2*U[5]*u[2]*u[7]-U[2]**2*U[5]*u[3]*u[6]+U[2]*U[4]**2*u[2]*u[4]+U[2]*U[4]**2*u[3]*u[6]+2*U[2]*U[4]*U[5]*u[2]*u[6]-U[2]*U[4]*U[5]*u[3]*u[4]+U[2]*U[4]*U[5]*u[3]*u[7]+U[2]*U[5]**2*u[2]*u[7]-U[2]*U[5]**2*u[3]*u[6]
    C.flat[112] = U[1]**2*U[4]*u[0]*u[6]-U[1]**2*U[4]*u[2]*u[4]-U[1]**2*U[5]*u[0]*u[4]-U[1]**2*U[5]*u[2]*u[6]+U[1]*U[2]*U[4]*u[0]*u[4]+2*U[1]*U[2]*U[4]*u[2]*u[6]-U[1]*U[2]*U[4]*u[3]*u[4]+U[1]*U[2]*U[5]*u[0]*u[6]-2*U[1]*U[2]*U[5]*u[2]*u[4]-U[1]*U[2]*U[5]*u[3]*u[6]+U[1]*U[4]**2*u[0]*u[6]-U[1]*U[4]**2*u[2]*u[4]-U[1]*U[4]*U[5]*u[0]*u[4]+U[1]*U[4]*U[5]*u[0]*u[7]-2*U[1]*U[4]*U[5]*u[2]*u[6]-U[1]*U[5]**2*u[0]*u[6]-U[1]*U[5]**2*u[2]*u[7]+U[2]**2*U[4]*u[2]*u[4]+U[2]**2*U[4]*u[3]*u[6]+U[2]**2*U[5]*u[2]*u[6]-U[2]**2*U[5]*u[3]*u[4]+U[2]*U[4]**2*u[0]*u[4]+U[2]*U[4]**2*u[2]*u[6]+2*U[2]*U[4]*U[5]*u[0]*u[6]-U[2]*U[4]*U[5]*u[2]*u[4]+U[2]*U[4]*U[5]*u[2]*u[7]+U[2]*U[5]**2*u[0]*u[7]-U[2]*U[5]**2*u[2]*u[6]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(v,w,x,y,z):
        return np.array([v**2,w*v,w**2,x*v,x*w,x**2,v*y,y*w,y*x,y**2,v*z,z*w,z*x,y*z,z**2,v,w,x,y,z,1])

    return C,U