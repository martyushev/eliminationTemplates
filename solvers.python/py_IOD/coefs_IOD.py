import numpy as np

def coefs_IOD(data):
    A1 = data[0].T.flat
    A2 = data[1].T.flat
    A3 = data[2].T.flat
    A4 = data[3].T.flat
    A5 = data[4].T.flat

    C = np.zeros((14,49))
    C.flat[631] = -2
    C.flat[[258,263,284,334,386,406,483,535,565,569,627,652,678]] = -1
    C.flat[[245,249,288,295,304,310,345,356,361,395,436,446,461,469,496,513,521,546,563,585,597,601,606,636,648]] = 1
    C.flat[88] = 2*A2[0]**2*A2[6]**2+2*A2[2]**2*A2[4]**2-4*A2[0]*A2[2]*A2[4]*A2[6]
    C.flat[92] = 2*A2[1]**2*A2[6]**2+2*A2[2]**2*A2[5]**2-4*A2[1]*A2[2]*A2[5]*A2[6]
    C.flat[96] = 2*A2[2]**2*A2[7]**2+2*A2[3]**2*A2[6]**2-4*A2[2]*A2[3]*A2[6]*A2[7]
    C.flat[100] = -A3[0]**2*A3[5]**2-A3[1]**2*A3[4]**2+2*A3[0]*A3[1]*A3[4]*A3[5]
    C.flat[[98,102]] = -A3[0]**2*A3[6]**2-A3[2]**2*A3[4]**2+2*A3[0]*A3[2]*A3[4]*A3[6]
    C.flat[137] = 2*A3[0]**2*A3[6]**2+2*A3[2]**2*A3[4]**2-4*A3[0]*A3[2]*A3[4]*A3[6]
    C.flat[106] = -A3[0]**2*A3[7]**2-A3[3]**2*A3[4]**2+2*A3[0]*A3[3]*A3[4]*A3[7]
    C.flat[[111,116]] = -A3[1]**2*A3[6]**2-A3[2]**2*A3[5]**2+2*A3[1]*A3[2]*A3[5]*A3[6]
    C.flat[141] = 2*A3[1]**2*A3[6]**2+2*A3[2]**2*A3[5]**2-4*A3[1]*A3[2]*A3[5]*A3[6]
    C.flat[123] = -A3[1]**2*A3[7]**2-A3[3]**2*A3[5]**2+2*A3[1]*A3[3]*A3[5]*A3[7]
    C.flat[131] = -A3[2]**2*A3[7]**2-A3[3]**2*A3[6]**2+2*A3[2]*A3[3]*A3[6]*A3[7]
    C.flat[145] = 2*A3[2]**2*A3[7]**2+2*A3[3]**2*A3[6]**2-4*A3[2]*A3[3]*A3[6]*A3[7]
    C.flat[149] = -A4[0]**2*A4[5]**2-A4[1]**2*A4[4]**2+2*A4[0]*A4[1]*A4[4]*A4[5]
    C.flat[[147,151]] = -A4[0]**2*A4[6]**2-A4[2]**2*A4[4]**2+2*A4[0]*A4[2]*A4[4]*A4[6]
    C.flat[186] = 2*A4[0]**2*A4[6]**2+2*A4[2]**2*A4[4]**2-4*A4[0]*A4[2]*A4[4]*A4[6]
    C.flat[155] = -A4[0]**2*A4[7]**2-A4[3]**2*A4[4]**2+2*A4[0]*A4[3]*A4[4]*A4[7]
    C.flat[[160,165]] = -A4[1]**2*A4[6]**2-A4[2]**2*A4[5]**2+2*A4[1]*A4[2]*A4[5]*A4[6]
    C.flat[190] = 2*A4[1]**2*A4[6]**2+2*A4[2]**2*A4[5]**2-4*A4[1]*A4[2]*A4[5]*A4[6]
    C.flat[172] = -A4[1]**2*A4[7]**2-A4[3]**2*A4[5]**2+2*A4[1]*A4[3]*A4[5]*A4[7]
    C.flat[180] = -A4[2]**2*A4[7]**2-A4[3]**2*A4[6]**2+2*A4[2]*A4[3]*A4[6]*A4[7]
    C.flat[194] = 2*A4[2]**2*A4[7]**2+2*A4[3]**2*A4[6]**2-4*A4[2]*A4[3]*A4[6]*A4[7]
    C.flat[198] = -A5[0]**2*A5[5]**2-A5[1]**2*A5[4]**2+2*A5[0]*A5[1]*A5[4]*A5[5]
    C.flat[[196,200]] = -A5[0]**2*A5[6]**2-A5[2]**2*A5[4]**2+2*A5[0]*A5[2]*A5[4]*A5[6]
    C.flat[235] = 2*A5[0]**2*A5[6]**2+2*A5[2]**2*A5[4]**2-4*A5[0]*A5[2]*A5[4]*A5[6]
    C.flat[204] = -A5[0]**2*A5[7]**2-A5[3]**2*A5[4]**2+2*A5[0]*A5[3]*A5[4]*A5[7]
    C.flat[[209,214]] = -A5[1]**2*A5[6]**2-A5[2]**2*A5[5]**2+2*A5[1]*A5[2]*A5[5]*A5[6]
    C.flat[239] = 2*A5[1]**2*A5[6]**2+2*A5[2]**2*A5[5]**2-4*A5[1]*A5[2]*A5[5]*A5[6]
    C.flat[221] = -A5[1]**2*A5[7]**2-A5[3]**2*A5[5]**2+2*A5[1]*A5[3]*A5[5]*A5[7]
    C.flat[229] = -A5[2]**2*A5[7]**2-A5[3]**2*A5[6]**2+2*A5[2]*A5[3]*A5[6]*A5[7]
    C.flat[243] = 2*A5[2]**2*A5[7]**2+2*A5[3]**2*A5[6]**2-4*A5[2]*A5[3]*A5[6]*A5[7]
    C.flat[2] = 2*A1[0]*A1[1]*A1[4]*A1[5]-A1[0]**2*A1[5]**2-A1[1]**2*A1[4]**2
    C.flat[39] = -4*A1[0]*A1[2]*A1[4]*A1[6]+2*A1[0]**2*A1[6]**2+2*A1[2]**2*A1[4]**2
    C.flat[[0,4]] = 2*A1[0]*A1[2]*A1[4]*A1[6]-A1[0]**2*A1[6]**2-A1[2]**2*A1[4]**2
    C.flat[8] = 2*A1[0]*A1[3]*A1[4]*A1[7]-A1[0]**2*A1[7]**2-A1[3]**2*A1[4]**2
    C.flat[43] = -4*A1[1]*A1[2]*A1[5]*A1[6]+2*A1[1]**2*A1[6]**2+2*A1[2]**2*A1[5]**2
    C.flat[[13,18]] = 2*A1[1]*A1[2]*A1[5]*A1[6]-A1[1]**2*A1[6]**2-A1[2]**2*A1[5]**2
    C.flat[25] = 2*A1[1]*A1[3]*A1[5]*A1[7]-A1[1]**2*A1[7]**2-A1[3]**2*A1[5]**2
    C.flat[47] = -4*A1[2]*A1[3]*A1[6]*A1[7]+2*A1[2]**2*A1[7]**2+2*A1[3]**2*A1[6]**2
    C.flat[33] = 2*A1[2]*A1[3]*A1[6]*A1[7]-A1[2]**2*A1[7]**2-A1[3]**2*A1[6]**2
    C.flat[51] = 2*A2[0]*A2[1]*A2[4]*A2[5]-A2[0]**2*A2[5]**2-A2[1]**2*A2[4]**2
    C.flat[[49,53]] = 2*A2[0]*A2[2]*A2[4]*A2[6]-A2[0]**2*A2[6]**2-A2[2]**2*A2[4]**2
    C.flat[57] = 2*A2[0]*A2[3]*A2[4]*A2[7]-A2[0]**2*A2[7]**2-A2[3]**2*A2[4]**2
    C.flat[[62,67]] = 2*A2[1]*A2[2]*A2[5]*A2[6]-A2[1]**2*A2[6]**2-A2[2]**2*A2[5]**2
    C.flat[74] = 2*A2[1]*A2[3]*A2[5]*A2[7]-A2[1]**2*A2[7]**2-A2[3]**2*A2[5]**2
    C.flat[82] = 2*A2[2]*A2[3]*A2[6]*A2[7]-A2[2]**2*A2[7]**2-A2[3]**2*A2[6]**2
    C.flat[40] = 4*A1[0]*A1[1]*A1[6]**2+4*A1[2]**2*A1[4]*A1[5]-4*A1[0]*A1[2]*A1[5]*A1[6]-4*A1[1]*A1[2]*A1[4]*A1[6]
    C.flat[42] = 4*A1[0]*A1[3]*A1[6]**2+4*A1[2]**2*A1[4]*A1[7]-4*A1[0]*A1[2]*A1[6]*A1[7]-4*A1[2]*A1[3]*A1[4]*A1[6]
    C.flat[45] = 4*A1[1]*A1[3]*A1[6]**2+4*A1[2]**2*A1[5]*A1[7]-4*A1[1]*A1[2]*A1[6]*A1[7]-4*A1[2]*A1[3]*A1[5]*A1[6]
    C.flat[[197,206,212]] = -2*A5[0]*A5[1]*A5[6]**2-2*A5[2]**2*A5[4]*A5[5]+2*A5[1]*A5[2]*A5[4]*A5[6]+2*A5[0]*A5[2]*A5[5]*A5[6]
    C.flat[218] = -2*A5[0]*A5[1]*A5[7]**2-2*A5[3]**2*A5[4]*A5[5]+2*A5[1]*A5[3]*A5[4]*A5[7]+2*A5[0]*A5[3]*A5[5]*A5[7]
    C.flat[231] = 2*A5[0]*A5[1]*A5[7]**2+2*A5[3]**2*A5[4]*A5[5]-2*A5[1]*A5[3]*A5[4]*A5[7]-2*A5[0]*A5[3]*A5[5]*A5[7]
    C.flat[211] = -2*A5[0]*A5[2]*A5[5]**2-2*A5[1]**2*A5[4]*A5[6]+2*A5[1]*A5[2]*A5[4]*A5[5]+2*A5[0]*A5[1]*A5[5]*A5[6]
    C.flat[207] = 2*A5[0]*A5[2]*A5[5]**2+2*A5[1]**2*A5[4]*A5[6]-2*A5[1]*A5[2]*A5[4]*A5[5]-2*A5[0]*A5[1]*A5[5]*A5[6]
    C.flat[225] = -2*A5[0]*A5[2]*A5[7]**2-2*A5[3]**2*A5[4]*A5[6]+2*A5[2]*A5[3]*A5[4]*A5[7]+2*A5[0]*A5[3]*A5[6]*A5[7]
    C.flat[232] = 2*A5[0]*A5[2]*A5[7]**2+2*A5[3]**2*A5[4]*A5[6]-2*A5[2]*A5[3]*A5[4]*A5[7]-2*A5[0]*A5[3]*A5[6]*A5[7]
    C.flat[216] = -2*A5[0]*A5[3]*A5[5]**2-2*A5[1]**2*A5[4]*A5[7]+2*A5[1]*A5[3]*A5[4]*A5[5]+2*A5[0]*A5[1]*A5[5]*A5[7]
    C.flat[[201,224]] = -2*A5[0]*A5[3]*A5[6]**2-2*A5[2]**2*A5[4]*A5[7]+2*A5[2]*A5[3]*A5[4]*A5[6]+2*A5[0]*A5[2]*A5[6]*A5[7]
    C.flat[199] = -2*A5[0]**2*A5[5]*A5[6]-2*A5[1]*A5[2]*A5[4]**2+2*A5[0]*A5[1]*A5[4]*A5[6]+2*A5[0]*A5[2]*A5[4]*A5[5]
    C.flat[210] = 2*A5[0]**2*A5[5]*A5[6]+2*A5[1]*A5[2]*A5[4]**2-2*A5[0]*A5[1]*A5[4]*A5[6]-2*A5[0]*A5[2]*A5[4]*A5[5]
    C.flat[202] = -2*A5[0]**2*A5[5]*A5[7]-2*A5[1]*A5[3]*A5[4]**2+2*A5[0]*A5[1]*A5[4]*A5[7]+2*A5[0]*A5[3]*A5[4]*A5[5]
    C.flat[203] = -2*A5[0]**2*A5[6]*A5[7]-2*A5[2]*A5[3]*A5[4]**2+2*A5[0]*A5[2]*A5[4]*A5[7]+2*A5[0]*A5[3]*A5[4]*A5[6]
    C.flat[222] = 2*A5[0]**2*A5[6]*A5[7]+2*A5[2]*A5[3]*A5[4]**2-2*A5[0]*A5[2]*A5[4]*A5[7]-2*A5[0]*A5[3]*A5[4]*A5[6]
    C.flat[228] = -2*A5[1]*A5[2]*A5[7]**2-2*A5[3]**2*A5[5]*A5[6]+2*A5[2]*A5[3]*A5[5]*A5[7]+2*A5[1]*A5[3]*A5[6]*A5[7]
    C.flat[234] = 2*A5[1]*A5[2]*A5[7]**2+2*A5[3]**2*A5[5]*A5[6]-2*A5[1]*A5[3]*A5[6]*A5[7]-2*A5[2]*A5[3]*A5[5]*A5[7]
    C.flat[[219,227]] = -2*A5[1]*A5[3]*A5[6]**2-2*A5[2]**2*A5[5]*A5[7]+2*A5[2]*A5[3]*A5[5]*A5[6]+2*A5[1]*A5[2]*A5[6]*A5[7]
    C.flat[220] = -2*A5[1]**2*A5[6]*A5[7]-2*A5[2]*A5[3]*A5[5]**2+2*A5[1]*A5[2]*A5[5]*A5[7]+2*A5[1]*A5[3]*A5[5]*A5[6]
    C.flat[226] = 2*A5[1]**2*A5[6]*A5[7]+2*A5[2]*A5[3]*A5[5]**2-2*A5[1]*A5[2]*A5[5]*A5[7]-2*A5[1]*A5[3]*A5[5]*A5[6]
    C.flat[14] = -2*A1[0]*A1[1]*A1[4]*A1[6]-2*A1[0]*A1[2]*A1[4]*A1[5]+2*A1[0]**2*A1[5]*A1[6]+2*A1[1]*A1[2]*A1[4]**2
    C.flat[3] = 2*A1[0]*A1[1]*A1[4]*A1[6]+2*A1[0]*A1[2]*A1[4]*A1[5]-2*A1[0]**2*A1[5]*A1[6]-2*A1[1]*A1[2]*A1[4]**2
    C.flat[6] = 2*A1[0]*A1[1]*A1[4]*A1[7]+2*A1[0]*A1[3]*A1[4]*A1[5]-2*A1[0]**2*A1[5]*A1[7]-2*A1[1]*A1[3]*A1[4]**2
    C.flat[11] = -2*A1[0]*A1[1]*A1[5]*A1[6]-2*A1[1]*A1[2]*A1[4]*A1[5]+2*A1[0]*A1[2]*A1[5]**2+2*A1[1]**2*A1[4]*A1[6]
    C.flat[15] = 2*A1[0]*A1[1]*A1[5]*A1[6]+2*A1[1]*A1[2]*A1[4]*A1[5]-2*A1[0]*A1[2]*A1[5]**2-2*A1[1]**2*A1[4]*A1[6]
    C.flat[20] = 2*A1[0]*A1[1]*A1[5]*A1[7]+2*A1[1]*A1[3]*A1[4]*A1[5]-2*A1[0]*A1[3]*A1[5]**2-2*A1[1]**2*A1[4]*A1[7]
    C.flat[26] = -2*A1[0]*A1[2]*A1[4]*A1[7]-2*A1[0]*A1[3]*A1[4]*A1[6]+2*A1[0]**2*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[4]**2
    C.flat[7] = 2*A1[0]*A1[2]*A1[4]*A1[7]+2*A1[0]*A1[3]*A1[4]*A1[6]-2*A1[0]**2*A1[6]*A1[7]-2*A1[2]*A1[3]*A1[4]**2
    C.flat[[1,10,16]] = 2*A1[0]*A1[2]*A1[5]*A1[6]+2*A1[1]*A1[2]*A1[4]*A1[6]-2*A1[0]*A1[1]*A1[6]**2-2*A1[2]**2*A1[4]*A1[5]
    C.flat[[5,28]] = 2*A1[0]*A1[2]*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[4]*A1[6]-2*A1[0]*A1[3]*A1[6]**2-2*A1[2]**2*A1[4]*A1[7]
    C.flat[35] = -2*A1[0]*A1[3]*A1[5]*A1[7]-2*A1[1]*A1[3]*A1[4]*A1[7]+2*A1[0]*A1[1]*A1[7]**2+2*A1[3]**2*A1[4]*A1[5]
    C.flat[22] = 2*A1[0]*A1[3]*A1[5]*A1[7]+2*A1[1]*A1[3]*A1[4]*A1[7]-2*A1[0]*A1[1]*A1[7]**2-2*A1[3]**2*A1[4]*A1[5]
    C.flat[36] = -2*A1[0]*A1[3]*A1[6]*A1[7]-2*A1[2]*A1[3]*A1[4]*A1[7]+2*A1[0]*A1[2]*A1[7]**2+2*A1[3]**2*A1[4]*A1[6]
    C.flat[29] = 2*A1[0]*A1[3]*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[4]*A1[7]-2*A1[0]*A1[2]*A1[7]**2-2*A1[3]**2*A1[4]*A1[6]
    C.flat[30] = -2*A1[1]*A1[2]*A1[5]*A1[7]-2*A1[1]*A1[3]*A1[5]*A1[6]+2*A1[1]**2*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[5]**2
    C.flat[24] = 2*A1[1]*A1[2]*A1[5]*A1[7]+2*A1[1]*A1[3]*A1[5]*A1[6]-2*A1[1]**2*A1[6]*A1[7]-2*A1[2]*A1[3]*A1[5]**2
    C.flat[[23,31]] = 2*A1[1]*A1[2]*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[5]*A1[6]-2*A1[1]*A1[3]*A1[6]**2-2*A1[2]**2*A1[5]*A1[7]
    C.flat[38] = -2*A1[1]*A1[3]*A1[6]*A1[7]-2*A1[2]*A1[3]*A1[5]*A1[7]+2*A1[1]*A1[2]*A1[7]**2+2*A1[3]**2*A1[5]*A1[6]
    C.flat[32] = 2*A1[1]*A1[3]*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[5]*A1[7]-2*A1[1]*A1[2]*A1[7]**2-2*A1[3]**2*A1[5]*A1[6]
    C.flat[63] = -2*A2[0]*A2[1]*A2[4]*A2[6]-2*A2[0]*A2[2]*A2[4]*A2[5]+2*A2[0]**2*A2[5]*A2[6]+2*A2[1]*A2[2]*A2[4]**2
    C.flat[52] = 2*A2[0]*A2[1]*A2[4]*A2[6]+2*A2[0]*A2[2]*A2[4]*A2[5]-2*A2[0]**2*A2[5]*A2[6]-2*A2[1]*A2[2]*A2[4]**2
    C.flat[55] = 2*A2[0]*A2[1]*A2[4]*A2[7]+2*A2[0]*A2[3]*A2[4]*A2[5]-2*A2[0]**2*A2[5]*A2[7]-2*A2[1]*A2[3]*A2[4]**2
    C.flat[60] = -2*A2[0]*A2[1]*A2[5]*A2[6]-2*A2[1]*A2[2]*A2[4]*A2[5]+2*A2[0]*A2[2]*A2[5]**2+2*A2[1]**2*A2[4]*A2[6]
    C.flat[64] = 2*A2[0]*A2[1]*A2[5]*A2[6]+2*A2[1]*A2[2]*A2[4]*A2[5]-2*A2[0]*A2[2]*A2[5]**2-2*A2[1]**2*A2[4]*A2[6]
    C.flat[69] = 2*A2[0]*A2[1]*A2[5]*A2[7]+2*A2[1]*A2[3]*A2[4]*A2[5]-2*A2[0]*A2[3]*A2[5]**2-2*A2[1]**2*A2[4]*A2[7]
    C.flat[75] = -2*A2[0]*A2[2]*A2[4]*A2[7]-2*A2[0]*A2[3]*A2[4]*A2[6]+2*A2[0]**2*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[4]**2
    C.flat[56] = 2*A2[0]*A2[2]*A2[4]*A2[7]+2*A2[0]*A2[3]*A2[4]*A2[6]-2*A2[0]**2*A2[6]*A2[7]-2*A2[2]*A2[3]*A2[4]**2
    C.flat[89] = -4*A2[0]*A2[2]*A2[5]*A2[6]-4*A2[1]*A2[2]*A2[4]*A2[6]+4*A2[0]*A2[1]*A2[6]**2+4*A2[2]**2*A2[4]*A2[5]
    C.flat[[50,59,65]] = 2*A2[0]*A2[2]*A2[5]*A2[6]+2*A2[1]*A2[2]*A2[4]*A2[6]-2*A2[0]*A2[1]*A2[6]**2-2*A2[2]**2*A2[4]*A2[5]
    C.flat[91] = -4*A2[0]*A2[2]*A2[6]*A2[7]-4*A2[2]*A2[3]*A2[4]*A2[6]+4*A2[0]*A2[3]*A2[6]**2+4*A2[2]**2*A2[4]*A2[7]
    C.flat[[54,77]] = 2*A2[0]*A2[2]*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[4]*A2[6]-2*A2[0]*A2[3]*A2[6]**2-2*A2[2]**2*A2[4]*A2[7]
    C.flat[84] = -2*A2[0]*A2[3]*A2[5]*A2[7]-2*A2[1]*A2[3]*A2[4]*A2[7]+2*A2[0]*A2[1]*A2[7]**2+2*A2[3]**2*A2[4]*A2[5]
    C.flat[71] = 2*A2[0]*A2[3]*A2[5]*A2[7]+2*A2[1]*A2[3]*A2[4]*A2[7]-2*A2[0]*A2[1]*A2[7]**2-2*A2[3]**2*A2[4]*A2[5]
    C.flat[85] = -2*A2[0]*A2[3]*A2[6]*A2[7]-2*A2[2]*A2[3]*A2[4]*A2[7]+2*A2[0]*A2[2]*A2[7]**2+2*A2[3]**2*A2[4]*A2[6]
    C.flat[78] = 2*A2[0]*A2[3]*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[4]*A2[7]-2*A2[0]*A2[2]*A2[7]**2-2*A2[3]**2*A2[4]*A2[6]
    C.flat[79] = -2*A2[1]*A2[2]*A2[5]*A2[7]-2*A2[1]*A2[3]*A2[5]*A2[6]+2*A2[1]**2*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[5]**2
    C.flat[73] = 2*A2[1]*A2[2]*A2[5]*A2[7]+2*A2[1]*A2[3]*A2[5]*A2[6]-2*A2[1]**2*A2[6]*A2[7]-2*A2[2]*A2[3]*A2[5]**2
    C.flat[94] = -4*A2[1]*A2[2]*A2[6]*A2[7]-4*A2[2]*A2[3]*A2[5]*A2[6]+4*A2[1]*A2[3]*A2[6]**2+4*A2[2]**2*A2[5]*A2[7]
    C.flat[[72,80]] = 2*A2[1]*A2[2]*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[5]*A2[6]-2*A2[1]*A2[3]*A2[6]**2-2*A2[2]**2*A2[5]*A2[7]
    C.flat[87] = -2*A2[1]*A2[3]*A2[6]*A2[7]-2*A2[2]*A2[3]*A2[5]*A2[7]+2*A2[1]*A2[2]*A2[7]**2+2*A2[3]**2*A2[5]*A2[6]
    C.flat[81] = 2*A2[1]*A2[3]*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[5]*A2[7]-2*A2[1]*A2[2]*A2[7]**2-2*A2[3]**2*A2[5]*A2[6]
    C.flat[112] = -2*A3[0]*A3[2]*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[4]*A3[6]+2*A3[0]**2*A3[5]*A3[6]+2*A3[1]*A3[2]*A3[4]**2
    C.flat[101] = 2*A3[0]*A3[2]*A3[4]*A3[5]+2*A3[0]*A3[1]*A3[4]*A3[6]-2*A3[0]**2*A3[5]*A3[6]-2*A3[1]*A3[2]*A3[4]**2
    C.flat[124] = -2*A3[0]*A3[2]*A3[4]*A3[7]-2*A3[0]*A3[3]*A3[4]*A3[6]+2*A3[2]*A3[3]*A3[4]**2+2*A3[0]**2*A3[6]*A3[7]
    C.flat[105] = 2*A3[0]*A3[2]*A3[4]*A3[7]+2*A3[0]*A3[3]*A3[4]*A3[6]-2*A3[2]*A3[3]*A3[4]**2-2*A3[0]**2*A3[6]*A3[7]
    C.flat[138] = -4*A3[0]*A3[2]*A3[5]*A3[6]-4*A3[1]*A3[2]*A3[4]*A3[6]+4*A3[0]*A3[1]*A3[6]**2+4*A3[2]**2*A3[4]*A3[5]
    C.flat[[99,108,114]] = 2*A3[0]*A3[2]*A3[5]*A3[6]+2*A3[1]*A3[2]*A3[4]*A3[6]-2*A3[2]**2*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[6]**2
    C.flat[140] = -4*A3[0]*A3[2]*A3[6]*A3[7]-4*A3[2]*A3[3]*A3[4]*A3[6]+4*A3[0]*A3[3]*A3[6]**2+4*A3[2]**2*A3[4]*A3[7]
    C.flat[104] = 2*A3[0]*A3[3]*A3[4]*A3[5]+2*A3[0]*A3[1]*A3[4]*A3[7]-2*A3[1]*A3[3]*A3[4]**2-2*A3[0]**2*A3[5]*A3[7]
    C.flat[109] = -2*A3[1]*A3[2]*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[5]*A3[6]+2*A3[0]*A3[2]*A3[5]**2+2*A3[1]**2*A3[4]*A3[6]
    C.flat[113] = 2*A3[1]*A3[2]*A3[4]*A3[5]+2*A3[0]*A3[1]*A3[5]*A3[6]-2*A3[0]*A3[2]*A3[5]**2-2*A3[1]**2*A3[4]*A3[6]
    C.flat[143] = -4*A3[1]*A3[2]*A3[6]*A3[7]-4*A3[2]*A3[3]*A3[5]*A3[6]+4*A3[1]*A3[3]*A3[6]**2+4*A3[2]**2*A3[5]*A3[7]
    C.flat[118] = 2*A3[1]*A3[3]*A3[4]*A3[5]+2*A3[0]*A3[1]*A3[5]*A3[7]-2*A3[0]*A3[3]*A3[5]**2-2*A3[1]**2*A3[4]*A3[7]
    C.flat[133] = -2*A3[1]*A3[3]*A3[4]*A3[7]-2*A3[0]*A3[3]*A3[5]*A3[7]+2*A3[3]**2*A3[4]*A3[5]+2*A3[0]*A3[1]*A3[7]**2
    C.flat[120] = 2*A3[1]*A3[3]*A3[4]*A3[7]+2*A3[0]*A3[3]*A3[5]*A3[7]-2*A3[3]**2*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[7]**2
    C.flat[128] = -2*A3[1]*A3[3]*A3[5]*A3[6]-2*A3[1]*A3[2]*A3[5]*A3[7]+2*A3[1]**2*A3[6]*A3[7]+2*A3[2]*A3[3]*A3[5]**2
    C.flat[122] = 2*A3[1]*A3[3]*A3[5]*A3[6]+2*A3[1]*A3[2]*A3[5]*A3[7]-2*A3[1]**2*A3[6]*A3[7]-2*A3[2]*A3[3]*A3[5]**2
    C.flat[136] = -2*A3[1]*A3[3]*A3[6]*A3[7]-2*A3[2]*A3[3]*A3[5]*A3[7]+2*A3[1]*A3[2]*A3[7]**2+2*A3[3]**2*A3[5]*A3[6]
    C.flat[130] = 2*A3[1]*A3[3]*A3[6]*A3[7]+2*A3[2]*A3[3]*A3[5]*A3[7]-2*A3[3]**2*A3[5]*A3[6]-2*A3[1]*A3[2]*A3[7]**2
    C.flat[[103,126]] = 2*A3[2]*A3[3]*A3[4]*A3[6]+2*A3[0]*A3[2]*A3[6]*A3[7]-2*A3[2]**2*A3[4]*A3[7]-2*A3[0]*A3[3]*A3[6]**2
    C.flat[134] = -2*A3[2]*A3[3]*A3[4]*A3[7]-2*A3[0]*A3[3]*A3[6]*A3[7]+2*A3[3]**2*A3[4]*A3[6]+2*A3[0]*A3[2]*A3[7]**2
    C.flat[127] = 2*A3[2]*A3[3]*A3[4]*A3[7]+2*A3[0]*A3[3]*A3[6]*A3[7]-2*A3[3]**2*A3[4]*A3[6]-2*A3[0]*A3[2]*A3[7]**2
    C.flat[[121,129]] = 2*A3[2]*A3[3]*A3[5]*A3[6]+2*A3[1]*A3[2]*A3[6]*A3[7]-2*A3[1]*A3[3]*A3[6]**2-2*A3[2]**2*A3[5]*A3[7]
    C.flat[161] = -2*A4[0]*A4[1]*A4[4]*A4[6]-2*A4[0]*A4[2]*A4[4]*A4[5]+2*A4[1]*A4[2]*A4[4]**2+2*A4[0]**2*A4[5]*A4[6]
    C.flat[150] = 2*A4[0]*A4[1]*A4[4]*A4[6]+2*A4[0]*A4[2]*A4[4]*A4[5]-2*A4[1]*A4[2]*A4[4]**2-2*A4[0]**2*A4[5]*A4[6]
    C.flat[153] = 2*A4[0]*A4[1]*A4[4]*A4[7]+2*A4[0]*A4[3]*A4[4]*A4[5]-2*A4[1]*A4[3]*A4[4]**2-2*A4[0]**2*A4[5]*A4[7]
    C.flat[158] = -2*A4[0]*A4[1]*A4[5]*A4[6]-2*A4[1]*A4[2]*A4[4]*A4[5]+2*A4[1]**2*A4[4]*A4[6]+2*A4[0]*A4[2]*A4[5]**2
    C.flat[162] = 2*A4[0]*A4[1]*A4[5]*A4[6]+2*A4[1]*A4[2]*A4[4]*A4[5]-2*A4[0]*A4[2]*A4[5]**2-2*A4[1]**2*A4[4]*A4[6]
    C.flat[173] = -2*A4[0]*A4[2]*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[4]*A4[6]+2*A4[2]*A4[3]*A4[4]**2+2*A4[0]**2*A4[6]*A4[7]
    C.flat[154] = 2*A4[0]*A4[2]*A4[4]*A4[7]+2*A4[0]*A4[3]*A4[4]*A4[6]-2*A4[2]*A4[3]*A4[4]**2-2*A4[0]**2*A4[6]*A4[7]
    C.flat[187] = -4*A4[0]*A4[2]*A4[5]*A4[6]-4*A4[1]*A4[2]*A4[4]*A4[6]+4*A4[0]*A4[1]*A4[6]**2+4*A4[2]**2*A4[4]*A4[5]
    C.flat[189] = -4*A4[0]*A4[2]*A4[6]*A4[7]-4*A4[2]*A4[3]*A4[4]*A4[6]+4*A4[0]*A4[3]*A4[6]**2+4*A4[2]**2*A4[4]*A4[7]
    C.flat[[148,157,163]] = 2*A4[1]*A4[2]*A4[4]*A4[6]+2*A4[0]*A4[2]*A4[5]*A4[6]-2*A4[2]**2*A4[4]*A4[5]-2*A4[0]*A4[1]*A4[6]**2
    C.flat[177] = -2*A4[1]*A4[2]*A4[5]*A4[7]-2*A4[1]*A4[3]*A4[5]*A4[6]+2*A4[2]*A4[3]*A4[5]**2+2*A4[1]**2*A4[6]*A4[7]
    C.flat[171] = 2*A4[1]*A4[2]*A4[5]*A4[7]+2*A4[1]*A4[3]*A4[5]*A4[6]-2*A4[2]*A4[3]*A4[5]**2-2*A4[1]**2*A4[6]*A4[7]
    C.flat[192] = -4*A4[1]*A4[2]*A4[6]*A4[7]-4*A4[2]*A4[3]*A4[5]*A4[6]+4*A4[1]*A4[3]*A4[6]**2+4*A4[2]**2*A4[5]*A4[7]
    C.flat[[170,178]] = 2*A4[1]*A4[2]*A4[6]*A4[7]+2*A4[2]*A4[3]*A4[5]*A4[6]-2*A4[1]*A4[3]*A4[6]**2-2*A4[2]**2*A4[5]*A4[7]
    C.flat[167] = 2*A4[1]*A4[3]*A4[4]*A4[5]+2*A4[0]*A4[1]*A4[5]*A4[7]-2*A4[1]**2*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[5]**2
    C.flat[182] = -2*A4[1]*A4[3]*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[5]*A4[7]+2*A4[3]**2*A4[4]*A4[5]+2*A4[0]*A4[1]*A4[7]**2
    C.flat[169] = 2*A4[1]*A4[3]*A4[4]*A4[7]+2*A4[0]*A4[3]*A4[5]*A4[7]-2*A4[3]**2*A4[4]*A4[5]-2*A4[0]*A4[1]*A4[7]**2
    C.flat[185] = -2*A4[1]*A4[3]*A4[6]*A4[7]-2*A4[2]*A4[3]*A4[5]*A4[7]+2*A4[1]*A4[2]*A4[7]**2+2*A4[3]**2*A4[5]*A4[6]
    C.flat[[152,175]] = 2*A4[2]*A4[3]*A4[4]*A4[6]+2*A4[0]*A4[2]*A4[6]*A4[7]-2*A4[2]**2*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[6]**2
    C.flat[183] = -2*A4[2]*A4[3]*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[6]*A4[7]+2*A4[3]**2*A4[4]*A4[6]+2*A4[0]*A4[2]*A4[7]**2
    C.flat[176] = 2*A4[2]*A4[3]*A4[4]*A4[7]+2*A4[0]*A4[3]*A4[6]*A4[7]-2*A4[3]**2*A4[4]*A4[6]-2*A4[0]*A4[2]*A4[7]**2
    C.flat[179] = 2*A4[2]*A4[3]*A4[5]*A4[7]+2*A4[1]*A4[3]*A4[6]*A4[7]-2*A4[3]**2*A4[5]*A4[6]-2*A4[1]*A4[2]*A4[7]**2
    C.flat[236] = -4*A5[0]*A5[2]*A5[5]*A5[6]-4*A5[1]*A5[2]*A5[4]*A5[6]+4*A5[0]*A5[1]*A5[6]**2+4*A5[2]**2*A5[4]*A5[5]
    C.flat[238] = -4*A5[0]*A5[2]*A5[6]*A5[7]-4*A5[2]*A5[3]*A5[4]*A5[6]+4*A5[0]*A5[3]*A5[6]**2+4*A5[2]**2*A5[4]*A5[7]
    C.flat[241] = -4*A5[1]*A5[2]*A5[6]*A5[7]-4*A5[2]*A5[3]*A5[5]*A5[6]+4*A5[1]*A5[3]*A5[6]**2+4*A5[2]**2*A5[5]*A5[7]
    C.flat[230] = A5[0]**2*A5[7]**2-A5[2]**2*A5[7]**2+A5[3]**2*A5[4]**2-A5[3]**2*A5[6]**2+2*A5[2]*A5[3]*A5[6]*A5[7]-2*A5[0]*A5[3]*A5[4]*A5[7]
    C.flat[233] = A5[1]**2*A5[7]**2-A5[2]**2*A5[7]**2+A5[3]**2*A5[5]**2-A5[3]**2*A5[6]**2+2*A5[2]*A5[3]*A5[6]*A5[7]-2*A5[1]*A5[3]*A5[5]*A5[7]
    C.flat[17] = -2*A1[0]*A1[1]*A1[6]*A1[7]-2*A1[0]*A1[2]*A1[5]*A1[7]+4*A1[0]*A1[3]*A1[5]*A1[6]+4*A1[1]*A1[2]*A1[4]*A1[7]-2*A1[1]*A1[3]*A1[4]*A1[6]-2*A1[2]*A1[3]*A1[4]*A1[5]
    C.flat[21] = -2*A1[0]*A1[1]*A1[6]*A1[7]+4*A1[0]*A1[2]*A1[5]*A1[7]-2*A1[0]*A1[3]*A1[5]*A1[6]-2*A1[1]*A1[2]*A1[4]*A1[7]+4*A1[1]*A1[3]*A1[4]*A1[6]-2*A1[2]*A1[3]*A1[4]*A1[5]
    C.flat[27] = 4*A1[0]*A1[1]*A1[6]*A1[7]-2*A1[0]*A1[2]*A1[5]*A1[7]-2*A1[0]*A1[3]*A1[5]*A1[6]-2*A1[1]*A1[2]*A1[4]*A1[7]-2*A1[1]*A1[3]*A1[4]*A1[6]+4*A1[2]*A1[3]*A1[4]*A1[5]
    C.flat[34] = -2*A1[0]*A1[3]*A1[4]*A1[7]+2*A1[2]*A1[3]*A1[6]*A1[7]+A1[0]**2*A1[7]**2-A1[2]**2*A1[7]**2+A1[3]**2*A1[4]**2-A1[3]**2*A1[6]**2
    C.flat[37] = -2*A1[1]*A1[3]*A1[5]*A1[7]+2*A1[2]*A1[3]*A1[6]*A1[7]+A1[1]**2*A1[7]**2-A1[2]**2*A1[7]**2+A1[3]**2*A1[5]**2-A1[3]**2*A1[6]**2
    C.flat[66] = -2*A2[0]*A2[1]*A2[6]*A2[7]-2*A2[0]*A2[2]*A2[5]*A2[7]+4*A2[0]*A2[3]*A2[5]*A2[6]+4*A2[1]*A2[2]*A2[4]*A2[7]-2*A2[1]*A2[3]*A2[4]*A2[6]-2*A2[2]*A2[3]*A2[4]*A2[5]
    C.flat[70] = -2*A2[0]*A2[1]*A2[6]*A2[7]+4*A2[0]*A2[2]*A2[5]*A2[7]-2*A2[0]*A2[3]*A2[5]*A2[6]-2*A2[1]*A2[2]*A2[4]*A2[7]+4*A2[1]*A2[3]*A2[4]*A2[6]-2*A2[2]*A2[3]*A2[4]*A2[5]
    C.flat[76] = 4*A2[0]*A2[1]*A2[6]*A2[7]-2*A2[0]*A2[2]*A2[5]*A2[7]-2*A2[0]*A2[3]*A2[5]*A2[6]-2*A2[1]*A2[2]*A2[4]*A2[7]-2*A2[1]*A2[3]*A2[4]*A2[6]+4*A2[2]*A2[3]*A2[4]*A2[5]
    C.flat[83] = -2*A2[0]*A2[3]*A2[4]*A2[7]+2*A2[2]*A2[3]*A2[6]*A2[7]+A2[0]**2*A2[7]**2-A2[2]**2*A2[7]**2+A2[3]**2*A2[4]**2-A2[3]**2*A2[6]**2
    C.flat[86] = -2*A2[1]*A2[3]*A2[5]*A2[7]+2*A2[2]*A2[3]*A2[6]*A2[7]-A2[3]**2*A2[6]**2+A2[1]**2*A2[7]**2-A2[2]**2*A2[7]**2+A2[3]**2*A2[5]**2
    C.flat[115] = -2*A3[1]*A3[3]*A3[4]*A3[6]-2*A3[2]*A3[3]*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[6]*A3[7]-2*A3[0]*A3[2]*A3[5]*A3[7]+4*A3[0]*A3[3]*A3[5]*A3[6]+4*A3[1]*A3[2]*A3[4]*A3[7]
    C.flat[125] = -2*A3[1]*A3[3]*A3[4]*A3[6]+4*A3[2]*A3[3]*A3[4]*A3[5]+4*A3[0]*A3[1]*A3[6]*A3[7]-2*A3[0]*A3[2]*A3[5]*A3[7]-2*A3[0]*A3[3]*A3[5]*A3[6]-2*A3[1]*A3[2]*A3[4]*A3[7]
    C.flat[119] = 4*A3[1]*A3[3]*A3[4]*A3[6]-2*A3[2]*A3[3]*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[6]*A3[7]+4*A3[0]*A3[2]*A3[5]*A3[7]-2*A3[0]*A3[3]*A3[5]*A3[6]-2*A3[1]*A3[2]*A3[4]*A3[7]
    C.flat[135] = -2*A3[1]*A3[3]*A3[5]*A3[7]+2*A3[2]*A3[3]*A3[6]*A3[7]+A3[1]**2*A3[7]**2-A3[2]**2*A3[7]**2+A3[3]**2*A3[5]**2-A3[3]**2*A3[6]**2
    C.flat[132] = 2*A3[2]*A3[3]*A3[6]*A3[7]-2*A3[0]*A3[3]*A3[4]*A3[7]+A3[0]**2*A3[7]**2-A3[2]**2*A3[7]**2+A3[3]**2*A3[4]**2-A3[3]**2*A3[6]**2
    C.flat[174] = -2*A4[1]*A4[2]*A4[4]*A4[7]-2*A4[1]*A4[3]*A4[4]*A4[6]+4*A4[2]*A4[3]*A4[4]*A4[5]+4*A4[0]*A4[1]*A4[6]*A4[7]-2*A4[0]*A4[2]*A4[5]*A4[7]-2*A4[0]*A4[3]*A4[5]*A4[6]
    C.flat[168] = -2*A4[1]*A4[2]*A4[4]*A4[7]+4*A4[1]*A4[3]*A4[4]*A4[6]-2*A4[2]*A4[3]*A4[4]*A4[5]-2*A4[0]*A4[1]*A4[6]*A4[7]+4*A4[0]*A4[2]*A4[5]*A4[7]-2*A4[0]*A4[3]*A4[5]*A4[6]
    C.flat[164] = 4*A4[1]*A4[2]*A4[4]*A4[7]-2*A4[1]*A4[3]*A4[4]*A4[6]-2*A4[2]*A4[3]*A4[4]*A4[5]-2*A4[0]*A4[1]*A4[6]*A4[7]-2*A4[0]*A4[2]*A4[5]*A4[7]+4*A4[0]*A4[3]*A4[5]*A4[6]
    C.flat[184] = -2*A4[1]*A4[3]*A4[5]*A4[7]+2*A4[2]*A4[3]*A4[6]*A4[7]+A4[1]**2*A4[7]**2-A4[2]**2*A4[7]**2+A4[3]**2*A4[5]**2-A4[3]**2*A4[6]**2
    C.flat[181] = 2*A4[2]*A4[3]*A4[6]*A4[7]-2*A4[0]*A4[3]*A4[4]*A4[7]+A4[0]**2*A4[7]**2-A4[2]**2*A4[7]**2+A4[3]**2*A4[4]**2-A4[3]**2*A4[6]**2
    C.flat[223] = -2*A5[1]*A5[2]*A5[4]*A5[7]-2*A5[1]*A5[3]*A5[4]*A5[6]+4*A5[2]*A5[3]*A5[4]*A5[5]+4*A5[0]*A5[1]*A5[6]*A5[7]-2*A5[0]*A5[2]*A5[5]*A5[7]-2*A5[0]*A5[3]*A5[5]*A5[6]
    C.flat[217] = -2*A5[1]*A5[2]*A5[4]*A5[7]+4*A5[1]*A5[3]*A5[4]*A5[6]-2*A5[2]*A5[3]*A5[4]*A5[5]-2*A5[0]*A5[1]*A5[6]*A5[7]+4*A5[0]*A5[2]*A5[5]*A5[7]-2*A5[0]*A5[3]*A5[5]*A5[6]
    C.flat[213] = 4*A5[1]*A5[2]*A5[4]*A5[7]-2*A5[1]*A5[3]*A5[4]*A5[6]-2*A5[2]*A5[3]*A5[4]*A5[5]-2*A5[0]*A5[1]*A5[6]*A5[7]-2*A5[0]*A5[2]*A5[5]*A5[7]+4*A5[0]*A5[3]*A5[5]*A5[6]
    C.flat[208] = 2*A5[0]*A5[3]*A5[5]**2-2*A5[0]*A5[3]*A5[6]**2+2*A5[1]**2*A5[4]*A5[7]-2*A5[2]**2*A5[4]*A5[7]-2*A5[1]*A5[3]*A5[4]*A5[5]+2*A5[2]*A5[3]*A5[4]*A5[6]-2*A5[0]*A5[1]*A5[5]*A5[7]+2*A5[0]*A5[2]*A5[6]*A5[7]
    C.flat[215] = 2*A5[0]**2*A5[5]*A5[7]+2*A5[1]*A5[3]*A5[4]**2-2*A5[1]*A5[3]*A5[6]**2-2*A5[2]**2*A5[5]*A5[7]+2*A5[1]*A5[2]*A5[6]*A5[7]+2*A5[2]*A5[3]*A5[5]*A5[6]-2*A5[0]*A5[1]*A5[4]*A5[7]-2*A5[0]*A5[3]*A5[4]*A5[5]
    C.flat[19] = -2*A1[0]*A1[1]*A1[4]*A1[7]-2*A1[0]*A1[3]*A1[4]*A1[5]+2*A1[1]*A1[2]*A1[6]*A1[7]+2*A1[2]*A1[3]*A1[5]*A1[6]+2*A1[0]**2*A1[5]*A1[7]+2*A1[1]*A1[3]*A1[4]**2-2*A1[1]*A1[3]*A1[6]**2-2*A1[2]**2*A1[5]*A1[7]
    C.flat[12] = -2*A1[0]*A1[1]*A1[5]*A1[7]+2*A1[0]*A1[2]*A1[6]*A1[7]-2*A1[1]*A1[3]*A1[4]*A1[5]+2*A1[2]*A1[3]*A1[4]*A1[6]+2*A1[0]*A1[3]*A1[5]**2-2*A1[0]*A1[3]*A1[6]**2+2*A1[1]**2*A1[4]*A1[7]-2*A1[2]**2*A1[4]*A1[7]
    C.flat[68] = -2*A2[0]*A2[1]*A2[4]*A2[7]-2*A2[0]*A2[3]*A2[4]*A2[5]+2*A2[1]*A2[2]*A2[6]*A2[7]+2*A2[2]*A2[3]*A2[5]*A2[6]+2*A2[0]**2*A2[5]*A2[7]+2*A2[1]*A2[3]*A2[4]**2-2*A2[1]*A2[3]*A2[6]**2-2*A2[2]**2*A2[5]*A2[7]
    C.flat[61] = -2*A2[0]*A2[1]*A2[5]*A2[7]+2*A2[0]*A2[2]*A2[6]*A2[7]-2*A2[1]*A2[3]*A2[4]*A2[5]+2*A2[2]*A2[3]*A2[4]*A2[6]+2*A2[0]*A2[3]*A2[5]**2-2*A2[0]*A2[3]*A2[6]**2+2*A2[1]**2*A2[4]*A2[7]-2*A2[2]**2*A2[4]*A2[7]
    C.flat[117] = 2*A3[1]*A3[2]*A3[6]*A3[7]+2*A3[2]*A3[3]*A3[5]*A3[6]-2*A3[0]*A3[3]*A3[4]*A3[5]-2*A3[0]*A3[1]*A3[4]*A3[7]+2*A3[1]*A3[3]*A3[4]**2-2*A3[1]*A3[3]*A3[6]**2-2*A3[2]**2*A3[5]*A3[7]+2*A3[0]**2*A3[5]*A3[7]
    C.flat[110] = -2*A3[1]*A3[3]*A3[4]*A3[5]+2*A3[2]*A3[3]*A3[4]*A3[6]-2*A3[0]*A3[1]*A3[5]*A3[7]+2*A3[0]*A3[2]*A3[6]*A3[7]-2*A3[2]**2*A3[4]*A3[7]+2*A3[0]*A3[3]*A3[5]**2-2*A3[0]*A3[3]*A3[6]**2+2*A3[1]**2*A3[4]*A3[7]
    C.flat[166] = 2*A4[1]*A4[2]*A4[6]*A4[7]+2*A4[2]*A4[3]*A4[5]*A4[6]-2*A4[0]*A4[1]*A4[4]*A4[7]-2*A4[0]*A4[3]*A4[4]*A4[5]+2*A4[1]*A4[3]*A4[4]**2-2*A4[1]*A4[3]*A4[6]**2-2*A4[2]**2*A4[5]*A4[7]+2*A4[0]**2*A4[5]*A4[7]
    C.flat[159] = -2*A4[1]*A4[3]*A4[4]*A4[5]+2*A4[2]*A4[3]*A4[4]*A4[6]-2*A4[0]*A4[1]*A4[5]*A4[7]+2*A4[0]*A4[2]*A4[6]*A4[7]+2*A4[1]**2*A4[4]*A4[7]-2*A4[2]**2*A4[4]*A4[7]+2*A4[0]*A4[3]*A4[5]**2-2*A4[0]*A4[3]*A4[6]**2
    C.flat[205] = A5[0]**2*A5[5]**2-A5[0]**2*A5[6]**2+A5[1]**2*A5[4]**2-A5[1]**2*A5[6]**2-A5[2]**2*A5[4]**2-A5[2]**2*A5[5]**2+2*A5[1]*A5[2]*A5[5]*A5[6]-2*A5[0]*A5[1]*A5[4]*A5[5]+2*A5[0]*A5[2]*A5[4]*A5[6]
    C.flat[9] = -2*A1[0]*A1[1]*A1[4]*A1[5]+2*A1[0]*A1[2]*A1[4]*A1[6]+2*A1[1]*A1[2]*A1[5]*A1[6]+A1[0]**2*A1[5]**2-A1[0]**2*A1[6]**2+A1[1]**2*A1[4]**2-A1[1]**2*A1[6]**2-A1[2]**2*A1[4]**2-A1[2]**2*A1[5]**2
    C.flat[58] = -2*A2[0]*A2[1]*A2[4]*A2[5]+2*A2[0]*A2[2]*A2[4]*A2[6]+2*A2[1]*A2[2]*A2[5]*A2[6]+A2[0]**2*A2[5]**2-A2[0]**2*A2[6]**2+A2[1]**2*A2[4]**2-A2[1]**2*A2[6]**2-A2[2]**2*A2[4]**2-A2[2]**2*A2[5]**2
    C.flat[107] = 2*A3[1]*A3[2]*A3[5]*A3[6]+2*A3[0]*A3[2]*A3[4]*A3[6]-2*A3[0]*A3[1]*A3[4]*A3[5]+A3[0]**2*A3[5]**2-A3[0]**2*A3[6]**2+A3[1]**2*A3[4]**2-A3[1]**2*A3[6]**2-A3[2]**2*A3[4]**2-A3[2]**2*A3[5]**2
    C.flat[156] = 2*A4[1]*A4[2]*A4[5]*A4[6]+2*A4[0]*A4[2]*A4[4]*A4[6]-2*A4[0]*A4[1]*A4[4]*A4[5]+A4[0]**2*A4[5]**2-A4[0]**2*A4[6]**2+A4[1]**2*A4[4]**2-A4[1]**2*A4[6]**2-A4[2]**2*A4[4]**2-A4[2]**2*A4[5]**2

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x11,x12,x13,x14,x22,x23,x24,x34,x44):
        return np.array([x11**2,x12*x11,x12**2,x13*x12,x13**2,x14*x11,x14*x12,x14*x13,x14**2,x22*x11,x12*x22,x22*x13,x22*x14,x22**2,x11*x23,x12*x23,x13*x23,x23*x14,x23**2,x24*x11,x12*x24,x24*x13,x14*x24,x22*x24,x23*x24,x24**2,x11*x34,x12*x34,x13*x34,x14*x34,x22*x34,x23*x34,x24*x34,x34**2,x11*x44,x12*x44,x13*x44,x22*x44,x23*x44,x11,x12,x13,x14,x22,x23,x24,x34,x44,1])

    return C,U