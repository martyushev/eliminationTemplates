function coefs_rdist9p(data::Vector{Matrix{Float64}})

    p1 = data[1]
    p2 = data[2]

    C = zeros(9,16)

    C[[136,137,138,139,140,141,142,143,144]] .= 1
    C[1] = p2[1]*p1[1]
    C[19] = p2[1]*p1[2]
    C[10] = p2[2]*p1[1]
    C[28] = p2[2]*p1[2]
    C[2] = p2[3]*p1[3]
    C[20] = p2[3]*p1[4]
    C[11] = p2[4]*p1[3]
    C[29] = p2[4]*p1[4]
    C[3] = p2[5]*p1[5]
    C[21] = p2[5]*p1[6]
    C[12] = p2[6]*p1[5]
    C[30] = p2[6]*p1[6]
    C[4] = p2[7]*p1[7]
    C[22] = p2[7]*p1[8]
    C[13] = p2[8]*p1[7]
    C[31] = p2[8]*p1[8]
    C[5] = p2[9]*p1[9]
    C[23] = p2[9]*p1[10]
    C[14] = p2[10]*p1[9]
    C[32] = p2[10]*p1[10]
    C[6] = p2[11]*p1[11]
    C[24] = p2[11]*p1[12]
    C[15] = p2[12]*p1[11]
    C[33] = p2[12]*p1[12]
    C[7] = p2[13]*p1[13]
    C[25] = p2[13]*p1[14]
    C[16] = p2[14]*p1[13]
    C[34] = p2[14]*p1[14]
    C[8] = p2[15]*p1[15]
    C[26] = p2[15]*p1[16]
    C[17] = p2[16]*p1[15]
    C[35] = p2[16]*p1[16]
    C[9] = p2[17]*p1[17]
    C[27] = p2[17]*p1[18]
    C[18] = p2[18]*p1[17]
    C[36] = p2[18]*p1[18]
    C[118] = p1[1]^2+p1[2]^2
    C[119] = p1[3]^2+p1[4]^2
    C[120] = p1[5]^2+p1[6]^2
    C[121] = p1[7]^2+p1[8]^2
    C[122] = p1[9]^2+p1[10]^2
    C[123] = p1[11]^2+p1[12]^2
    C[124] = p1[13]^2+p1[14]^2
    C[125] = p1[15]^2+p1[16]^2
    C[126] = p1[17]^2+p1[18]^2
    C[127] = p2[1]^2+p2[2]^2
    C[128] = p2[3]^2+p2[4]^2
    C[129] = p2[5]^2+p2[6]^2
    C[130] = p2[7]^2+p2[8]^2
    C[131] = p2[9]^2+p2[10]^2
    C[132] = p2[11]^2+p2[12]^2
    C[133] = p2[13]^2+p2[14]^2
    C[134] = p2[15]^2+p2[16]^2
    C[135] = p2[17]^2+p2[18]^2
    C[37] = p1[1]*p2[1]^2+p1[1]*p2[2]^2
    C[55] = p1[2]*p2[1]^2+p1[2]*p2[2]^2
    C[38] = p1[3]*p2[3]^2+p1[3]*p2[4]^2
    C[56] = p1[4]*p2[3]^2+p1[4]*p2[4]^2
    C[39] = p1[5]*p2[5]^2+p1[5]*p2[6]^2
    C[57] = p1[6]*p2[5]^2+p1[6]*p2[6]^2
    C[40] = p1[7]*p2[7]^2+p1[7]*p2[8]^2
    C[58] = p1[8]*p2[7]^2+p1[8]*p2[8]^2
    C[41] = p1[9]*p2[9]^2+p1[9]*p2[10]^2
    C[59] = p1[10]*p2[9]^2+p1[10]*p2[10]^2
    C[42] = p1[11]*p2[11]^2+p1[11]*p2[12]^2
    C[60] = p1[12]*p2[11]^2+p1[12]*p2[12]^2
    C[43] = p1[13]*p2[13]^2+p1[13]*p2[14]^2
    C[61] = p1[14]*p2[13]^2+p1[14]*p2[14]^2
    C[44] = p1[15]*p2[15]^2+p1[15]*p2[16]^2
    C[62] = p1[16]*p2[15]^2+p1[16]*p2[16]^2
    C[45] = p1[17]*p2[17]^2+p1[17]*p2[18]^2
    C[63] = p1[18]*p2[17]^2+p1[18]*p2[18]^2
    C[73] = p2[1]*p1[1]^2+p2[1]*p1[2]^2
    C[82] = p2[2]*p1[1]^2+p2[2]*p1[2]^2
    C[74] = p2[3]*p1[3]^2+p2[3]*p1[4]^2
    C[83] = p2[4]*p1[3]^2+p2[4]*p1[4]^2
    C[75] = p2[5]*p1[5]^2+p2[5]*p1[6]^2
    C[84] = p2[6]*p1[5]^2+p2[6]*p1[6]^2
    C[76] = p2[7]*p1[7]^2+p2[7]*p1[8]^2
    C[85] = p2[8]*p1[7]^2+p2[8]*p1[8]^2
    C[77] = p2[9]*p1[9]^2+p2[9]*p1[10]^2
    C[86] = p2[10]*p1[9]^2+p2[10]*p1[10]^2
    C[78] = p2[11]*p1[11]^2+p2[11]*p1[12]^2
    C[87] = p2[12]*p1[11]^2+p2[12]*p1[12]^2
    C[79] = p2[13]*p1[13]^2+p2[13]*p1[14]^2
    C[88] = p2[14]*p1[13]^2+p2[14]*p1[14]^2
    C[80] = p2[15]*p1[15]^2+p2[15]*p1[16]^2
    C[89] = p2[16]*p1[15]^2+p2[16]*p1[16]^2
    C[81] = p2[17]*p1[17]^2+p2[17]*p1[18]^2
    C[90] = p2[18]*p1[17]^2+p2[18]*p1[18]^2
    C[91] = p1[1]^2*p2[1]^2+p1[1]^2*p2[2]^2+p1[2]^2*p2[1]^2+p1[2]^2*p2[2]^2
    C[92] = p1[3]^2*p2[3]^2+p1[3]^2*p2[4]^2+p1[4]^2*p2[3]^2+p1[4]^2*p2[4]^2
    C[93] = p1[5]^2*p2[5]^2+p1[5]^2*p2[6]^2+p1[6]^2*p2[5]^2+p1[6]^2*p2[6]^2
    C[94] = p1[7]^2*p2[7]^2+p1[7]^2*p2[8]^2+p1[8]^2*p2[7]^2+p1[8]^2*p2[8]^2
    C[95] = p1[9]^2*p2[9]^2+p1[9]^2*p2[10]^2+p1[10]^2*p2[9]^2+p1[10]^2*p2[10]^2
    C[96] = p1[11]^2*p2[11]^2+p1[11]^2*p2[12]^2+p1[12]^2*p2[11]^2+p1[12]^2*p2[12]^2
    C[97] = p1[13]^2*p2[13]^2+p1[13]^2*p2[14]^2+p1[14]^2*p2[13]^2+p1[14]^2*p2[14]^2
    C[98] = p1[15]^2*p2[15]^2+p1[15]^2*p2[16]^2+p1[16]^2*p2[15]^2+p1[16]^2*p2[16]^2
    C[99] = p1[17]^2*p2[17]^2+p1[17]^2*p2[18]^2+p1[18]^2*p2[17]^2+p1[18]^2*p2[18]^2
    C[46] = p1[1]
    C[64] = p1[2]
    C[47] = p1[3]
    C[65] = p1[4]
    C[48] = p1[5]
    C[66] = p1[6]
    C[49] = p1[7]
    C[67] = p1[8]
    C[50] = p1[9]
    C[68] = p1[10]
    C[51] = p1[11]
    C[69] = p1[12]
    C[52] = p1[13]
    C[70] = p1[14]
    C[53] = p1[15]
    C[71] = p1[16]
    C[54] = p1[17]
    C[72] = p1[18]
    C[100] = p2[1]
    C[109] = p2[2]
    C[101] = p2[3]
    C[110] = p2[4]
    C[102] = p2[5]
    C[111] = p2[6]
    C[103] = p2[7]
    C[112] = p2[8]
    C[104] = p2[9]
    C[113] = p2[10]
    C[105] = p2[11]
    C[114] = p2[12]
    C[106] = p2[13]
    C[115] = p2[14]
    C[107] = p2[15]
    C[116] = p2[16]
    C[108] = p2[17]
    C[117] = p2[18]

    A = C[:,1:9]\C[:,10:end]

    C = zeros(4,52)

    C[179] = 1
    C[125] = -A[6]
    C[126] = -A[8]
    C[113] = -A[15]
    C[114] = -A[17]
    C[153] = -A[24]
    C[154] = -A[26]
    C[161] = -A[33]
    C[162] = -A[35]
    C[149] = -A[51]
    C[150] = -A[53]
    C[20] = A[2]*A[8]-A[6]*A[4]
    C[24] = A[6]*A[3]-A[1]*A[8]
    C[8] = -A[10]*A[17]+A[15]*A[12]
    C[60] = -A[11]*A[12]+A[10]*A[13]
    C[4] = A[11]*A[17]-A[15]*A[13]
    C[88] = -A[24]*A[22]+A[20]*A[26]
    C[112] = A[33]*A[30]-A[28]*A[35]
    C[188] = A[37]*A[40]-A[38]*A[39]
    C[144] = -A[42]*A[40]+A[38]*A[44]
    C[152] = A[46]*A[49]-A[47]*A[48]
    C[92] = A[51]*A[48]-A[46]*A[53]
    C[80] = -A[51]*A[49]+A[47]*A[53]
    C[208] = A[55]*A[58]-A[56]*A[57]
    C[173] = -A[42]+A[14]
    C[174] = -A[44]+A[16]
    C[189] = -A[60]+A[50]
    C[190] = -A[62]+A[52]
    C[16] = -A[1]*A[17]-A[10]*A[8]+A[6]*A[12]+A[15]*A[3]
    C[12] = A[2]*A[17]+A[11]*A[8]-A[6]*A[13]-A[15]*A[4]
    C[44] = A[2]*A[26]+A[20]*A[8]-A[6]*A[22]-A[24]*A[4]
    C[72] = A[2]*A[44]+A[38]*A[8]-A[42]*A[4]-A[6]*A[40]
    C[36] = -A[10]*A[53]-A[46]*A[17]+A[15]*A[48]+A[51]*A[12]
    C[32] = A[11]*A[26]+A[20]*A[17]-A[15]*A[22]-A[24]*A[13]
    C[140] = -A[11]*A[39]-A[38]*A[12]+A[10]*A[40]+A[37]*A[13]
    C[64] = A[11]*A[44]+A[38]*A[17]-A[42]*A[13]-A[15]*A[40]
    C[116] = -A[11]*A[48]-A[47]*A[12]+A[10]*A[49]+A[46]*A[13]
    C[28] = A[11]*A[53]+A[47]*A[17]-A[51]*A[13]-A[15]*A[49]
    C[56] = A[33]*A[3]+A[6]*A[30]-A[1]*A[35]-A[28]*A[8]
    C[104] = A[33]*A[48]+A[51]*A[30]-A[28]*A[53]-A[46]*A[35]
    C[204] = A[37]*A[58]+A[55]*A[40]-A[38]*A[57]-A[56]*A[39]
    C[124] = -A[42]*A[22]-A[24]*A[40]+A[20]*A[44]+A[38]*A[26]
    C[192] = A[46]*A[58]+A[55]*A[49]-A[47]*A[57]-A[56]*A[48]
    C[84] = -A[51]*A[22]-A[24]*A[49]+A[20]*A[53]+A[47]*A[26]
    C[76] = A[1]*A[4]-A[2]*A[3]+A[42]*A[3]+A[6]*A[39]-A[1]*A[44]-A[37]*A[8]
    C[100] = -A[24]*A[31]-A[33]*A[22]+A[24]*A[21]-A[19]*A[26]+A[20]*A[35]+A[29]*A[26]
    C[160] = -A[24]*A[58]-A[60]*A[22]+A[19]*A[22]-A[20]*A[21]+A[20]*A[62]+A[56]*A[26]
    C[108] = -A[33]*A[31]+A[24]*A[30]+A[33]*A[21]+A[29]*A[35]-A[19]*A[35]-A[28]*A[26]
    C[172] = A[33]*A[57]+A[60]*A[30]+A[28]*A[31]-A[29]*A[30]-A[28]*A[62]-A[55]*A[35]
    C[148] = -A[38]*A[3]+A[1]*A[40]+A[37]*A[4]-A[2]*A[39]+A[42]*A[39]-A[37]*A[44]
    C[200] = A[60]*A[57]+A[28]*A[58]+A[55]*A[31]-A[29]*A[57]-A[56]*A[30]-A[55]*A[62]
    C[196] = -A[60]*A[58]+A[19]*A[58]+A[55]*A[22]-A[20]*A[57]-A[56]*A[21]+A[56]*A[62]
    C[52] = -A[1]*A[26]-A[19]*A[8]+A[2]*A[35]+A[29]*A[8]+A[6]*A[21]+A[24]*A[3]-A[6]*A[31]-A[33]*A[4]
    C[48] = -A[1]*A[53]-A[10]*A[35]-A[28]*A[17]-A[46]*A[8]+A[6]*A[48]+A[15]*A[30]+A[33]*A[12]+A[51]*A[3]
    C[68] = -A[10]*A[44]-A[37]*A[17]+A[42]*A[12]+A[15]*A[39]+A[1]*A[13]+A[10]*A[4]-A[2]*A[12]-A[11]*A[3]
    C[176] = -A[11]*A[57]-A[38]*A[48]-A[47]*A[39]-A[56]*A[12]+A[10]*A[58]+A[37]*A[49]+A[46]*A[40]+A[55]*A[13]
    C[96] = -A[19]*A[53]-A[46]*A[26]+A[29]*A[53]+A[47]*A[35]+A[24]*A[48]+A[51]*A[21]-A[33]*A[49]-A[51]*A[31]
    C[180] = -A[20]*A[39]-A[38]*A[21]-A[42]*A[58]-A[60]*A[40]+A[19]*A[40]+A[37]*A[22]+A[38]*A[62]+A[56]*A[44]
    C[156] = -A[20]*A[48]-A[47]*A[21]-A[51]*A[58]-A[60]*A[49]+A[19]*A[49]+A[46]*A[22]+A[47]*A[62]+A[56]*A[53]
    C[164] = -A[29]*A[48]-A[47]*A[30]+A[28]*A[49]+A[46]*A[31]+A[51]*A[57]+A[60]*A[48]-A[46]*A[62]-A[55]*A[53]
    C[184] = -A[2]*A[57]-A[29]*A[39]-A[38]*A[30]-A[56]*A[3]+A[1]*A[58]+A[28]*A[40]+A[37]*A[31]+A[55]*A[4]+A[42]*A[57]+A[60]*A[39]-A[37]*A[62]-A[55]*A[44]
    C[40] = -A[10]*A[26]-A[19]*A[17]+A[2]*A[53]+A[11]*A[35]+A[29]*A[17]+A[47]*A[8]+A[15]*A[21]+A[24]*A[12]-A[6]*A[49]-A[15]*A[31]-A[33]*A[13]-A[51]*A[4]
    C[120] = A[11]*A[62]+A[38]*A[53]+A[47]*A[44]+A[56]*A[17]-A[42]*A[49]-A[51]*A[40]-A[60]*A[13]-A[15]*A[58]+A[10]*A[22]+A[19]*A[13]-A[11]*A[21]-A[20]*A[12]
    C[168] = -A[20]*A[30]-A[29]*A[21]-A[33]*A[58]-A[60]*A[31]+A[19]*A[31]+A[28]*A[22]+A[60]*A[21]+A[24]*A[57]-A[19]*A[62]-A[55]*A[26]+A[29]*A[62]+A[56]*A[35]
    C[136] = -A[29]*A[3]+A[1]*A[31]+A[28]*A[4]-A[2]*A[30]+A[33]*A[39]+A[42]*A[30]+A[60]*A[3]+A[6]*A[57]-A[1]*A[62]-A[28]*A[44]-A[37]*A[35]-A[55]*A[8]
    C[128] = -A[10]*A[62]-A[37]*A[53]-A[46]*A[44]-A[55]*A[17]+A[15]*A[57]+A[42]*A[48]+A[51]*A[39]+A[60]*A[12]+A[1]*A[49]+A[10]*A[31]+A[28]*A[13]+A[46]*A[4]-A[2]*A[48]-A[11]*A[30]-A[29]*A[12]-A[47]*A[3]
    C[132] = -A[19]*A[44]-A[37]*A[26]+A[2]*A[62]+A[29]*A[44]+A[38]*A[35]+A[56]*A[8]+A[24]*A[39]+A[42]*A[21]-A[42]*A[31]-A[60]*A[4]-A[6]*A[58]-A[33]*A[40]+A[1]*A[22]+A[19]*A[4]-A[2]*A[21]-A[20]*A[3]
    C[181] = A[5]
    C[182] = A[7]
    C[183] = A[9]
    C[175] = A[18]
    C[193] = A[23]
    C[194] = A[25]
    C[195] = A[27]
    C[197] = A[32]
    C[198] = A[34]
    C[199] = A[36]
    C[201] = A[41]
    C[202] = A[43]
    C[203] = A[45]
    C[191] = A[54]
    C[205] = A[59]
    C[206] = A[61]
    C[207] = A[63]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(w,x,y,z) = [x*z^2*w^2,y*z^2*w^2,x*z^2*y*w,z^2*y^2*w,x*z^2*y^2,z^2*y^3,x*z*w^2,z*w*x^2,y*z*w^2,y*z*w*x,z*y*x^2,w*z*y^2,z*y^2*x,z*y^3,z^2*w^2,x*z^2*w,z^2*y*w,x*z^2*y,z^2*y^2,x*w^2,x^2*w,x^3,y*w^2,y*w*x,y*x^2,w*y^2,x*y^2,y^3,z*w^2,z*w*x,z*x^2,w*z*y,z*y*x,z*y^2,z^2*w,x*z^2,z^2*y,w^2,w*x,x^2,w*y,x*y,y^2,z*w,z*x,z*y,z^2,w,x,y,z,1]

    return C,U

end