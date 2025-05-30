function coefs_optpose2pt_v2(data::Vector{Matrix{Float64}})

    U = data[1]
    u = data[2]

    C = zeros(6,21)
    C[123] = -1
    C[[57,87]] .= 1
    C[121] = u[1]*U[1]^2
    C[122] = u[5]*U[4]^2
    C[61] = 2*U[2]*u[2]
    C[37] = 2*U[3]*u[2]
    C[62] = 2*U[5]*u[6]
    C[38] = 2*U[6]*u[6]
    C[91] = 2*u[1]*U[1]
    C[103] = 2*u[2]*U[1]
    C[92] = 2*u[5]*U[4]
    C[104] = 2*u[6]*U[4]
    C[115] = 2*u[2]*U[2]*U[1]
    C[109] = 2*u[2]*U[3]*U[1]
    C[116] = 2*u[6]*U[5]*U[4]
    C[110] = 2*u[6]*U[6]*U[4]
    C[19] = 2*u[2]
    C[25] = 2*u[3]
    C[20] = 2*u[6]
    C[26] = 2*u[7]
    C[43] = 2*U[2]*u[1]+2*U[3]*u[3]
    C[73] = 2*U[2]*u[4]-2*U[3]*u[3]
    C[67] = -2*U[3]*u[1]+2*U[2]*u[3]
    C[49] = 2*U[3]*u[4]+2*U[2]*u[3]
    C[44] = 2*U[5]*u[5]+2*U[6]*u[7]
    C[74] = 2*U[5]*u[8]-2*U[6]*u[7]
    C[68] = -2*U[6]*u[5]+2*U[5]*u[7]
    C[50] = 2*U[6]*u[8]+2*U[5]*u[7]
    C[5] = -u[2]*U[2]*u[6]+u[2]*u[6]*U[5]
    C[4] = u[2]*U[6]*u[6]-u[2]*U[3]*u[6]
    C[6] = -u[2]*U[2]*U[6]*u[6]+u[2]*U[3]*u[6]*U[5]
    C[125] = -U[1]*u[2]*U[2]*u[6]*U[4]+U[1]*u[2]*u[6]*U[4]*U[5]
    C[124] = -U[1]*u[2]*U[3]*u[6]*U[4]+U[1]*u[2]*U[6]*u[6]*U[4]
    C[126] = -U[1]*u[2]*U[2]*U[6]*u[6]*U[4]+U[1]*u[2]*U[3]*u[6]*U[4]*U[5]
    C[55] = u[1]*U[2]^2+u[4]*U[3]^2+2*u[3]*U[2]*U[3]
    C[85] = u[1]*U[3]^2+u[4]*U[2]^2-2*u[3]*U[2]*U[3]
    C[56] = u[5]*U[5]^2+u[8]*U[6]^2+2*u[7]*U[5]*U[6]
    C[86] = u[5]*U[6]^2+u[8]*U[5]^2-2*u[7]*U[5]*U[6]
    C[79] = 2*u[3]*U[2]^2-2*u[3]*U[3]^2-2*u[1]*U[2]*U[3]+2*u[4]*U[2]*U[3]
    C[80] = 2*u[7]*U[5]^2-2*u[7]*U[6]^2-2*u[5]*U[5]*U[6]+2*u[8]*U[5]*U[6]
    C[17] = -U[2]*u[3]*u[7]+U[3]*u[7]*u[1]-u[3]*U[6]*u[5]+u[3]*U[5]*u[7]
    C[34] = -U[2]*u[3]*u[8]-U[3]*u[4]*u[8]+u[4]*U[6]*u[8]+u[4]*U[5]*u[7]
    C[35] = -U[2]*u[4]*u[8]+U[3]*u[3]*u[8]-u[4]*U[6]*u[7]+u[4]*U[5]*u[8]
    C[16] = -U[2]*u[7]*u[1]-U[3]*u[3]*u[7]+u[3]*U[6]*u[7]+u[3]*U[5]*u[5]
    C[95] = -U[1]*u[2]*U[2]*u[6]+U[1]*u[2]*u[6]*U[5]-u[2]*U[2]*u[6]*U[4]+u[2]*u[6]*U[4]*U[5]
    C[94] = -U[1]*u[2]*U[3]*u[6]+U[1]*u[2]*U[6]*u[6]-u[2]*U[3]*u[6]*U[4]+u[2]*U[6]*u[6]*U[4]
    C[96] = -U[1]*u[2]*U[2]*U[6]*u[6]+U[1]*u[2]*U[3]*u[6]*U[5]-u[2]*U[2]*U[6]*u[6]*U[4]+u[2]*U[3]*u[6]*U[4]*U[5]
    C[11] = -u[2]*U[2]*u[7]-u[2]*U[6]*u[5]+u[2]*U[5]*u[7]-U[2]*u[3]*u[6]+U[3]*u[6]*u[1]+u[3]*u[6]*U[5]
    C[23] = -u[2]*U[2]*u[8]-u[2]*U[6]*u[7]+u[2]*U[5]*u[8]-U[2]*u[4]*u[6]+U[3]*u[3]*u[6]+u[4]*u[6]*U[5]
    C[10] = -u[2]*U[3]*u[7]+u[2]*U[6]*u[7]+u[2]*U[5]*u[5]-U[2]*u[6]*u[1]-U[3]*u[3]*u[6]+u[3]*U[6]*u[6]
    C[22] = -u[2]*U[3]*u[8]+u[2]*U[6]*u[8]+u[2]*U[5]*u[7]-U[2]*u[3]*u[6]-U[3]*u[4]*u[6]+u[4]*U[6]*u[6]
    C[101] = -U[1]*u[2]*U[2]*u[7]-U[1]*u[2]*U[6]*u[5]+U[1]*u[2]*U[5]*u[7]-U[2]*u[3]*u[6]*U[4]+U[3]*u[6]*U[4]*u[1]+u[3]*u[6]*U[4]*U[5]
    C[107] = -U[1]*u[2]*U[2]*u[8]-U[1]*u[2]*U[6]*u[7]+U[1]*u[2]*U[5]*u[8]-U[2]*u[4]*u[6]*U[4]+U[3]*u[3]*u[6]*U[4]+u[4]*u[6]*U[4]*U[5]
    C[100] = -U[1]*u[2]*U[3]*u[7]+U[1]*u[2]*U[6]*u[7]+U[1]*u[2]*U[5]*u[5]-U[2]*u[6]*U[4]*u[1]-U[3]*u[3]*u[6]*U[4]+u[3]*U[6]*u[6]*U[4]
    C[106] = -U[1]*u[2]*U[3]*u[8]+U[1]*u[2]*U[6]*u[8]+U[1]*u[2]*U[5]*u[7]-U[2]*u[3]*u[6]*U[4]-U[3]*u[4]*u[6]*U[4]+u[4]*U[6]*u[6]*U[4]
    C[52] = -2*U[2]*U[3]*u[3]*u[8]+2*u[4]*U[6]*U[5]*u[7]-U[2]^2*u[8]*u[1]-U[3]^2*u[4]*u[8]+u[4]*U[6]^2*u[8]+u[4]*U[5]^2*u[5]
    C[77] = 2*U[2]*U[3]*u[3]*u[8]-2*u[4]*U[6]*U[5]*u[7]-U[2]^2*u[4]*u[8]-U[3]^2*u[8]*u[1]+u[4]*U[6]^2*u[5]+u[4]*U[5]^2*u[8]
    C[28] = -U[2]*u[3]*u[7]-U[2]*u[8]*u[1]-U[3]*u[3]*u[8]-U[3]*u[4]*u[7]+u[3]*U[6]*u[8]+u[3]*U[5]*u[7]+u[4]*U[6]*u[7]+u[4]*U[5]*u[5]
    C[29] = -U[2]*u[3]*u[8]-U[2]*u[4]*u[7]+U[3]*u[3]*u[7]+U[3]*u[8]*u[1]-u[3]*U[6]*u[7]+u[3]*U[5]*u[8]-u[4]*U[6]*u[5]+u[4]*U[5]*u[7]
    C[18] = -U[2]*u[3]*U[6]*u[7]-U[2]*u[3]*U[5]*u[5]-U[2]*U[6]*u[5]*u[1]+U[2]*U[5]*u[7]*u[1]-U[3]*u[3]*U[6]*u[5]+U[3]*u[3]*U[5]*u[7]+U[3]*U[6]*u[7]*u[1]+U[3]*U[5]*u[5]*u[1]
    C[36] = -U[2]*u[3]*U[6]*u[7]+U[2]*u[3]*U[5]*u[8]-U[2]*u[4]*U[6]*u[8]-U[2]*u[4]*U[5]*u[7]+U[3]*u[3]*U[6]*u[8]+U[3]*u[3]*U[5]*u[7]-U[3]*u[4]*U[6]*u[7]+U[3]*u[4]*U[5]*u[8]
    C[12] = -u[2]*U[2]*U[6]*u[7]-u[2]*U[2]*U[5]*u[5]-u[2]*U[3]*U[6]*u[5]+u[2]*U[3]*U[5]*u[7]-U[2]*u[3]*U[6]*u[6]+U[2]*u[6]*U[5]*u[1]+U[3]*u[3]*u[6]*U[5]+U[3]*U[6]*u[6]*u[1]
    C[24] = -u[2]*U[2]*U[6]*u[8]-u[2]*U[2]*U[5]*u[7]-u[2]*U[3]*U[6]*u[7]+u[2]*U[3]*U[5]*u[8]+U[2]*u[3]*u[6]*U[5]-U[2]*u[4]*U[6]*u[6]+U[3]*u[3]*U[6]*u[6]+U[3]*u[4]*u[6]*U[5]
    C[102] = -U[1]*u[2]*U[2]*U[6]*u[7]-U[1]*u[2]*U[2]*U[5]*u[5]-U[1]*u[2]*U[3]*U[6]*u[5]+U[1]*u[2]*U[3]*U[5]*u[7]-U[2]*u[3]*U[6]*u[6]*U[4]+U[2]*u[6]*U[4]*U[5]*u[1]+U[3]*u[3]*u[6]*U[4]*U[5]+U[3]*U[6]*u[6]*U[4]*u[1]
    C[108] = -U[1]*u[2]*U[2]*U[6]*u[8]-U[1]*u[2]*U[2]*U[5]*u[7]-U[1]*u[2]*U[3]*U[6]*u[7]+U[1]*u[2]*U[3]*U[5]*u[8]+U[2]*u[3]*u[6]*U[4]*U[5]-U[2]*u[4]*U[6]*u[6]*U[4]+U[3]*u[3]*U[6]*u[6]*U[4]+U[3]*u[4]*u[6]*U[4]*U[5]
    C[65] = u[2]*U[2]*U[6]*u[7]-u[2]*U[2]*U[5]*u[8]-2*u[2]*U[6]*U[5]*u[7]+2*U[2]*U[3]*u[3]*u[6]+U[2]*u[4]*u[6]*U[5]-U[3]*u[3]*u[6]*U[5]+u[2]*U[6]^2*u[5]+u[2]*U[5]^2*u[8]-U[2]^2*u[4]*u[6]-U[3]^2*u[6]*u[1]
    C[40] = -u[2]*U[3]*U[6]*u[8]-u[2]*U[3]*U[5]*u[7]+2*u[2]*U[6]*U[5]*u[7]-2*U[2]*U[3]*u[3]*u[6]+U[2]*u[3]*U[6]*u[6]+U[3]*u[4]*U[6]*u[6]+u[2]*U[6]^2*u[8]+u[2]*U[5]^2*u[5]-U[2]^2*u[6]*u[1]-U[3]^2*u[4]*u[6]
    C[119] = U[1]*u[2]*U[2]*U[6]*u[7]-U[1]*u[2]*U[2]*U[5]*u[8]-2*U[1]*u[2]*U[6]*U[5]*u[7]+2*U[2]*U[3]*u[3]*u[6]*U[4]+U[2]*u[4]*u[6]*U[4]*U[5]-U[3]*u[3]*u[6]*U[4]*U[5]+U[1]*u[2]*U[6]^2*u[5]+U[1]*u[2]*U[5]^2*u[8]-U[2]^2*u[4]*u[6]*U[4]-U[3]^2*u[6]*U[4]*u[1]
    C[112] = -U[1]*u[2]*U[3]*U[6]*u[8]-U[1]*u[2]*U[3]*U[5]*u[7]+2*U[1]*u[2]*U[6]*U[5]*u[7]-2*U[2]*U[3]*u[3]*u[6]*U[4]+U[2]*u[3]*U[6]*u[6]*U[4]+U[3]*u[4]*U[6]*u[6]*U[4]+U[1]*u[2]*U[6]^2*u[8]+U[1]*u[2]*U[5]^2*u[5]-U[2]^2*u[6]*U[4]*u[1]-U[3]^2*u[4]*u[6]*U[4]
    C[30] = -U[2]*u[3]*U[6]*u[5]-U[2]*u[3]*U[6]*u[8]-U[2]*u[4]*U[6]*u[7]-U[2]*u[4]*U[5]*u[5]-U[2]*U[6]*u[7]*u[1]+U[2]*U[5]*u[8]*u[1]+U[3]*u[3]*U[5]*u[5]+U[3]*u[3]*U[5]*u[8]-U[3]*u[4]*U[6]*u[5]+U[3]*u[4]*U[5]*u[7]+U[3]*U[6]*u[8]*u[1]+U[3]*U[5]*u[7]*u[1]
    C[41] = -u[2]*U[2]*U[6]*u[8]-u[2]*U[2]*U[5]*u[7]-u[2]*U[6]*U[5]*u[5]+u[2]*U[6]*U[5]*u[8]-U[2]*U[3]*u[4]*u[6]+U[2]*U[3]*u[6]*u[1]+U[2]*u[3]*u[6]*U[5]+U[3]*u[4]*u[6]*U[5]-u[2]*U[6]^2*u[7]+u[2]*U[5]^2*u[7]-U[2]^2*u[3]*u[6]+U[3]^2*u[3]*u[6]
    C[64] = u[2]*U[3]*U[6]*u[7]-u[2]*U[3]*U[5]*u[8]-u[2]*U[6]*U[5]*u[5]+u[2]*U[6]*U[5]*u[8]-U[2]*U[3]*u[4]*u[6]+U[2]*U[3]*u[6]*u[1]+U[2]*u[4]*U[6]*u[6]-U[3]*u[3]*U[6]*u[6]-u[2]*U[6]^2*u[7]+u[2]*U[5]^2*u[7]-U[2]^2*u[3]*u[6]+U[3]^2*u[3]*u[6]
    C[113] = -U[1]*u[2]*U[2]*U[6]*u[8]-U[1]*u[2]*U[2]*U[5]*u[7]-U[1]*u[2]*U[6]*U[5]*u[5]+U[1]*u[2]*U[6]*U[5]*u[8]-U[2]*U[3]*u[4]*u[6]*U[4]+U[2]*U[3]*u[6]*U[4]*u[1]+U[2]*u[3]*u[6]*U[4]*U[5]+U[3]*u[4]*u[6]*U[4]*U[5]-U[1]*u[2]*U[6]^2*u[7]+U[1]*u[2]*U[5]^2*u[7]-U[2]^2*u[3]*u[6]*U[4]+U[3]^2*u[3]*u[6]*U[4]
    C[118] = U[1]*u[2]*U[3]*U[6]*u[7]-U[1]*u[2]*U[3]*U[5]*u[8]-U[1]*u[2]*U[6]*U[5]*u[5]+U[1]*u[2]*U[6]*U[5]*u[8]-U[2]*U[3]*u[4]*u[6]*U[4]+U[2]*U[3]*u[6]*U[4]*u[1]+U[2]*u[4]*U[6]*u[6]*U[4]-U[3]*u[3]*U[6]*u[6]*U[4]-U[1]*u[2]*U[6]^2*u[7]+U[1]*u[2]*U[5]^2*u[7]-U[2]^2*u[3]*u[6]*U[4]+U[3]^2*u[3]*u[6]*U[4]
    C[89] = -2*U[2]*U[3]*u[3]*U[6]*u[7]+2*U[2]*U[3]*u[3]*U[5]*u[8]-2*U[2]*u[4]*U[6]*U[5]*u[7]+2*U[3]*u[3]*U[6]*U[5]*u[7]+U[2]^2*u[4]*U[6]*u[7]-U[2]^2*u[4]*U[5]*u[8]+U[2]*u[4]*U[6]^2*u[5]+U[2]*u[4]*U[5]^2*u[8]+U[3]^2*U[6]*u[7]*u[1]-U[3]^2*U[5]*u[8]*u[1]-U[3]*u[3]*U[6]^2*u[5]-U[3]*u[3]*U[5]^2*u[8]
    C[58] = -2*U[2]*U[3]*u[3]*U[6]*u[8]-2*U[2]*U[3]*u[3]*U[5]*u[7]+2*U[2]*u[3]*U[6]*U[5]*u[7]+2*U[3]*u[4]*U[6]*U[5]*u[7]-U[2]^2*U[6]*u[8]*u[1]-U[2]^2*U[5]*u[7]*u[1]+U[2]*u[3]*U[6]^2*u[8]+U[2]*u[3]*U[5]^2*u[5]-U[3]^2*u[4]*U[6]*u[8]-U[3]^2*u[4]*U[5]*u[7]+U[3]*u[4]*U[6]^2*u[8]+U[3]*u[4]*U[5]^2*u[5]
    C[46] = -2*U[2]*U[3]*u[3]*u[7]+U[2]*u[3]*U[6]*u[7]+U[2]*u[3]*U[5]*u[5]-U[2]*U[6]*u[8]*u[1]-U[2]*U[5]*u[7]*u[1]-U[3]*u[3]*U[6]*u[8]-U[3]*u[3]*U[5]*u[7]+U[3]*u[4]*U[6]*u[7]+U[3]*u[4]*U[5]*u[5]+2*u[3]*U[6]*U[5]*u[7]-U[2]^2*u[7]*u[1]-U[3]^2*u[4]*u[7]+u[3]*U[6]^2*u[8]+u[3]*U[5]^2*u[5]
    C[71] = 2*U[2]*U[3]*u[3]*u[7]+U[2]*u[3]*U[6]*u[7]-U[2]*u[3]*U[5]*u[8]-U[2]*u[4]*U[6]*u[5]+U[2]*u[4]*U[5]*u[7]+U[3]*u[3]*U[6]*u[5]-U[3]*u[3]*U[5]*u[7]-U[3]*U[6]*u[7]*u[1]+U[3]*U[5]*u[8]*u[1]-2*u[3]*U[6]*U[5]*u[7]-U[2]^2*u[4]*u[7]-U[3]^2*u[7]*u[1]+u[3]*U[6]^2*u[5]+u[3]*U[5]^2*u[8]
    C[47] = -U[2]*U[3]*u[4]*u[7]+U[2]*U[3]*u[7]*u[1]-U[2]*u[3]*U[6]*u[5]-U[2]*u[3]*U[6]*u[8]-U[3]*u[4]*U[6]*u[5]+U[3]*u[4]*U[5]*u[7]+U[3]*U[6]*u[8]*u[1]+U[3]*U[5]*u[7]*u[1]-u[3]*U[6]*U[5]*u[5]+u[3]*U[6]*U[5]*u[8]-U[2]^2*u[3]*u[7]+U[3]^2*u[3]*u[7]-u[3]*U[6]^2*u[7]+u[3]*U[5]^2*u[7]
    C[70] = -U[2]*U[3]*u[4]*u[7]+U[2]*U[3]*u[7]*u[1]+U[2]*u[4]*U[6]*u[7]+U[2]*u[4]*U[5]*u[5]+U[2]*U[6]*u[7]*u[1]-U[2]*U[5]*u[8]*u[1]-U[3]*u[3]*U[5]*u[5]-U[3]*u[3]*U[5]*u[8]-u[3]*U[6]*U[5]*u[5]+u[3]*U[6]*U[5]*u[8]-U[2]^2*u[3]*u[7]+U[3]^2*u[3]*u[7]-u[3]*U[6]^2*u[7]+u[3]*U[5]^2*u[7]
    C[66] = u[2]*U[2]*U[6]*U[5]*u[5]-u[2]*U[2]*U[6]*U[5]*u[8]-2*u[2]*U[3]*U[6]*U[5]*u[7]+2*U[2]*U[3]*u[3]*U[6]*u[6]+U[2]*U[3]*u[4]*u[6]*U[5]-U[2]*U[3]*u[6]*U[5]*u[1]+u[2]*U[2]*U[6]^2*u[7]-u[2]*U[2]*U[5]^2*u[7]+u[2]*U[3]*U[6]^2*u[5]+u[2]*U[3]*U[5]^2*u[8]+U[2]^2*u[3]*u[6]*U[5]-U[2]^2*u[4]*U[6]*u[6]-U[3]^2*u[3]*u[6]*U[5]-U[3]^2*U[6]*u[6]*u[1]
    C[42] = -2*u[2]*U[2]*U[6]*U[5]*u[7]-u[2]*U[3]*U[6]*U[5]*u[5]+u[2]*U[3]*U[6]*U[5]*u[8]+2*U[2]*U[3]*u[3]*u[6]*U[5]-U[2]*U[3]*u[4]*U[6]*u[6]+U[2]*U[3]*U[6]*u[6]*u[1]-u[2]*U[2]*U[6]^2*u[8]-u[2]*U[2]*U[5]^2*u[5]-u[2]*U[3]*U[6]^2*u[7]+u[2]*U[3]*U[5]^2*u[7]-U[2]^2*u[3]*U[6]*u[6]+U[2]^2*u[6]*U[5]*u[1]+U[3]^2*u[3]*U[6]*u[6]+U[3]^2*u[4]*u[6]*U[5]
    C[120] = U[1]*u[2]*U[2]*U[6]*U[5]*u[5]-U[1]*u[2]*U[2]*U[6]*U[5]*u[8]-2*U[1]*u[2]*U[3]*U[6]*U[5]*u[7]+2*U[2]*U[3]*u[3]*U[6]*u[6]*U[4]+U[2]*U[3]*u[4]*u[6]*U[4]*U[5]-U[2]*U[3]*u[6]*U[4]*U[5]*u[1]+U[1]*u[2]*U[2]*U[6]^2*u[7]-U[1]*u[2]*U[2]*U[5]^2*u[7]+U[1]*u[2]*U[3]*U[6]^2*u[5]+U[1]*u[2]*U[3]*U[5]^2*u[8]+U[2]^2*u[3]*u[6]*U[4]*U[5]-U[2]^2*u[4]*U[6]*u[6]*U[4]-U[3]^2*u[3]*u[6]*U[4]*U[5]-U[3]^2*U[6]*u[6]*U[4]*u[1]
    C[114] = -2*U[1]*u[2]*U[2]*U[6]*U[5]*u[7]-U[1]*u[2]*U[3]*U[6]*U[5]*u[5]+U[1]*u[2]*U[3]*U[6]*U[5]*u[8]+2*U[2]*U[3]*u[3]*u[6]*U[4]*U[5]-U[2]*U[3]*u[4]*U[6]*u[6]*U[4]+U[2]*U[3]*U[6]*u[6]*U[4]*u[1]-U[1]*u[2]*U[2]*U[6]^2*u[8]-U[1]*u[2]*U[2]*U[5]^2*u[5]-U[1]*u[2]*U[3]*U[6]^2*u[7]+U[1]*u[2]*U[3]*U[5]^2*u[7]-U[2]^2*u[3]*U[6]*u[6]*U[4]+U[2]^2*u[6]*U[4]*U[5]*u[1]+U[3]^2*u[3]*U[6]*u[6]*U[4]+U[3]^2*u[4]*u[6]*U[4]*U[5]
    C[53] = -U[2]*U[3]*u[4]*u[8]+U[2]*U[3]*u[8]*u[1]-U[2]*u[3]*U[6]*u[7]+U[2]*u[3]*U[5]*u[8]-U[2]*u[4]*U[6]*u[8]-U[2]*u[4]*U[5]*u[7]+U[3]*u[3]*U[6]*u[8]+U[3]*u[3]*U[5]*u[7]-U[3]*u[4]*U[6]*u[7]+U[3]*u[4]*U[5]*u[8]-u[4]*U[6]*U[5]*u[5]+u[4]*U[6]*U[5]*u[8]-U[2]^2*u[3]*u[8]+U[3]^2*u[3]*u[8]-u[4]*U[6]^2*u[7]+u[4]*U[5]^2*u[7]
    C[76] = -U[2]*U[3]*u[4]*u[8]+U[2]*U[3]*u[8]*u[1]+U[2]*u[3]*U[6]*u[7]-U[2]*u[3]*U[5]*u[8]+U[2]*u[4]*U[6]*u[8]+U[2]*u[4]*U[5]*u[7]-U[3]*u[3]*U[6]*u[8]-U[3]*u[3]*U[5]*u[7]+U[3]*u[4]*U[6]*u[7]-U[3]*u[4]*U[5]*u[8]-u[4]*U[6]*U[5]*u[5]+u[4]*U[6]*U[5]*u[8]-U[2]^2*u[3]*u[8]+U[3]^2*u[3]*u[8]-u[4]*U[6]^2*u[7]+u[4]*U[5]^2*u[7]
    C[88] = U[2]*U[3]*u[4]*U[6]*u[7]-U[2]*U[3]*u[4]*U[5]*u[8]-U[2]*U[3]*U[6]*u[7]*u[1]+U[2]*U[3]*U[5]*u[8]*u[1]-U[2]*u[4]*U[6]*U[5]*u[5]+U[2]*u[4]*U[6]*U[5]*u[8]+U[3]*u[3]*U[6]*U[5]*u[5]-U[3]*u[3]*U[6]*U[5]*u[8]+U[2]^2*u[3]*U[6]*u[7]-U[2]^2*u[3]*U[5]*u[8]-U[2]*u[4]*U[6]^2*u[7]+U[2]*u[4]*U[5]^2*u[7]-U[3]^2*u[3]*U[6]*u[7]+U[3]^2*u[3]*U[5]*u[8]+U[3]*u[3]*U[6]^2*u[7]-U[3]*u[3]*U[5]^2*u[7]
    C[59] = -U[2]*U[3]*u[4]*U[6]*u[8]-U[2]*U[3]*u[4]*U[5]*u[7]+U[2]*U[3]*U[6]*u[8]*u[1]+U[2]*U[3]*U[5]*u[7]*u[1]-U[2]*u[3]*U[6]*U[5]*u[5]+U[2]*u[3]*U[6]*U[5]*u[8]-U[3]*u[4]*U[6]*U[5]*u[5]+U[3]*u[4]*U[6]*U[5]*u[8]-U[2]^2*u[3]*U[6]*u[8]-U[2]^2*u[3]*U[5]*u[7]-U[2]*u[3]*U[6]^2*u[7]+U[2]*u[3]*U[5]^2*u[7]+U[3]^2*u[3]*U[6]*u[8]+U[3]^2*u[3]*U[5]*u[7]-U[3]*u[4]*U[6]^2*u[7]+U[3]*u[4]*U[5]^2*u[7]
    C[84] = -2*U[2]^2*u[4]*U[6]*U[5]*u[7]-2*U[2]^2*U[6]*U[5]*u[7]*u[1]+2*U[2]*U[3]*u[3]*U[6]^2*u[5]+2*U[2]*U[3]*u[3]*U[6]^2*u[8]+2*U[2]*U[3]*u[3]*U[5]^2*u[5]+2*U[2]*U[3]*u[3]*U[5]^2*u[8]-2*U[3]^2*u[4]*U[6]*U[5]*u[7]-2*U[3]^2*U[6]*U[5]*u[7]*u[1]-U[2]^2*u[4]*U[6]^2*u[8]-U[2]^2*u[4]*U[5]^2*u[5]+U[2]^2*U[6]^2*u[5]*u[1]+U[2]^2*U[5]^2*u[8]*u[1]+U[3]^2*u[4]*U[6]^2*u[5]+U[3]^2*u[4]*U[5]^2*u[8]-U[3]^2*U[6]^2*u[8]*u[1]-U[3]^2*U[5]^2*u[5]*u[1]
    C[90] = U[2]^2*u[3]*U[6]^2*u[5]+U[2]^2*u[3]*U[5]^2*u[8]+U[2]^2*u[4]*U[6]^2*u[7]-U[2]^2*u[4]*U[5]^2*u[7]-U[3]^2*u[3]*U[6]^2*u[5]-U[3]^2*u[3]*U[5]^2*u[8]+U[3]^2*U[6]^2*u[7]*u[1]-U[3]^2*U[5]^2*u[7]*u[1]-2*U[2]*U[3]*u[3]*U[6]*U[5]*u[5]+2*U[2]*U[3]*u[3]*U[6]*U[5]*u[8]-2*U[2]*U[3]*u[4]*U[6]*U[5]*u[7]+2*U[2]*U[3]*U[6]*U[5]*u[7]*u[1]-2*U[2]^2*u[3]*U[6]*U[5]*u[7]+U[2]^2*u[4]*U[6]*U[5]*u[5]-U[2]^2*u[4]*U[6]*U[5]*u[8]-2*U[2]*U[3]*u[3]*U[6]^2*u[7]+2*U[2]*U[3]*u[3]*U[5]^2*u[7]+U[2]*U[3]*u[4]*U[6]^2*u[5]+U[2]*U[3]*u[4]*U[5]^2*u[8]-U[2]*U[3]*U[6]^2*u[5]*u[1]-U[2]*U[3]*U[5]^2*u[8]*u[1]+2*U[3]^2*u[3]*U[6]*U[5]*u[7]+U[3]^2*U[6]*U[5]*u[5]*u[1]-U[3]^2*U[6]*U[5]*u[8]*u[1]
    C[60] = -U[2]^2*u[3]*U[6]^2*u[8]-U[2]^2*u[3]*U[5]^2*u[5]-U[2]^2*U[6]^2*u[7]*u[1]+U[2]^2*U[5]^2*u[7]*u[1]+U[3]^2*u[3]*U[6]^2*u[8]+U[3]^2*u[3]*U[5]^2*u[5]-U[3]^2*u[4]*U[6]^2*u[7]+U[3]^2*u[4]*U[5]^2*u[7]-2*U[2]*U[3]*u[3]*U[6]*U[5]*u[5]+2*U[2]*U[3]*u[3]*U[6]*U[5]*u[8]-2*U[2]*U[3]*u[4]*U[6]*U[5]*u[7]+2*U[2]*U[3]*U[6]*U[5]*u[7]*u[1]-2*U[2]^2*u[3]*U[6]*U[5]*u[7]-U[2]^2*U[6]*U[5]*u[5]*u[1]+U[2]^2*U[6]*U[5]*u[8]*u[1]-2*U[2]*U[3]*u[3]*U[6]^2*u[7]+2*U[2]*U[3]*u[3]*U[5]^2*u[7]-U[2]*U[3]*u[4]*U[6]^2*u[8]-U[2]*U[3]*u[4]*U[5]^2*u[5]+U[2]*U[3]*U[6]^2*u[8]*u[1]+U[2]*U[3]*U[5]^2*u[5]*u[1]+2*U[3]^2*u[3]*U[6]*U[5]*u[7]-U[3]^2*u[4]*U[6]*U[5]*u[5]+U[3]^2*u[4]*U[6]*U[5]*u[8]
    C[54] = U[2]*u[3]*U[5]^2*u[7]-U[2]*u[4]*U[6]^2*u[8]-U[2]*u[4]*U[5]^2*u[5]+U[3]^2*u[3]*U[6]*u[8]+U[3]^2*u[3]*U[5]*u[7]-U[3]^2*u[4]*U[6]*u[7]+U[3]^2*u[4]*U[5]*u[8]+U[3]*u[3]*U[6]^2*u[8]+U[3]*u[3]*U[5]^2*u[5]-U[3]*u[4]*U[6]^2*u[7]+U[3]*u[4]*U[5]^2*u[7]-U[2]^2*u[3]*U[6]*u[8]-U[2]^2*u[3]*U[5]*u[7]-U[2]^2*U[6]*u[7]*u[1]+U[2]^2*U[5]*u[8]*u[1]-U[2]*u[3]*U[6]^2*u[7]-U[3]*u[4]*U[6]*U[5]*u[5]+U[3]*u[4]*U[6]*U[5]*u[8]-2*U[2]*U[3]*u[3]*U[6]*u[7]+2*U[2]*U[3]*u[3]*U[5]*u[8]-U[2]*U[3]*u[4]*U[6]*u[8]-U[2]*U[3]*u[4]*U[5]*u[7]+U[2]*U[3]*U[6]*u[8]*u[1]+U[2]*U[3]*U[5]*u[7]*u[1]-U[2]*u[3]*U[6]*U[5]*u[5]+U[2]*u[3]*U[6]*U[5]*u[8]-2*U[2]*u[4]*U[6]*U[5]*u[7]+2*U[3]*u[3]*U[6]*U[5]*u[7]
    C[82] = U[2]*u[3]*U[5]^2*u[7]+U[2]*u[4]*U[6]^2*u[8]+U[2]*u[4]*U[5]^2*u[5]+U[3]^2*u[3]*U[6]*u[8]+U[3]^2*u[3]*U[5]*u[7]+U[3]^2*u[4]*U[6]*u[7]-U[3]^2*u[4]*U[5]*u[8]-U[3]*u[3]*U[6]^2*u[8]-U[3]*u[3]*U[5]^2*u[5]-U[3]*u[4]*U[6]^2*u[7]+U[3]*u[4]*U[5]^2*u[7]-U[2]^2*u[3]*U[6]*u[8]-U[2]^2*u[3]*U[5]*u[7]+U[2]^2*U[6]*u[7]*u[1]-U[2]^2*U[5]*u[8]*u[1]-U[2]*u[3]*U[6]^2*u[7]-U[3]*u[4]*U[6]*U[5]*u[5]+U[3]*u[4]*U[6]*U[5]*u[8]+2*U[2]*U[3]*u[3]*U[6]*u[7]-2*U[2]*U[3]*u[3]*U[5]*u[8]-U[2]*U[3]*u[4]*U[6]*u[8]-U[2]*U[3]*u[4]*U[5]*u[7]+U[2]*U[3]*U[6]*u[8]*u[1]+U[2]*U[3]*U[5]*u[7]*u[1]-U[2]*u[3]*U[6]*U[5]*u[5]+U[2]*u[3]*U[6]*U[5]*u[8]+2*U[2]*u[4]*U[6]*U[5]*u[7]-2*U[3]*u[3]*U[6]*U[5]*u[7]
    C[48] = -U[2]^2*u[3]*U[5]*u[5]-U[2]^2*U[6]*u[5]*u[1]-U[2]*U[6]^2*u[7]*u[1]+U[2]*U[5]^2*u[7]*u[1]+U[3]^2*u[3]*U[5]*u[5]-U[3]^2*u[4]*U[6]*u[5]+U[3]*U[6]^2*u[8]*u[1]+U[3]*U[5]^2*u[5]*u[1]+U[3]^2*u[3]*U[6]*u[7]+U[3]^2*u[4]*U[5]*u[7]-U[3]*u[3]*U[6]^2*u[7]+U[3]*u[3]*U[5]^2*u[7]+U[2]^2*U[5]*u[7]*u[1]-U[2]*u[3]*U[6]^2*u[8]-U[2]*u[3]*U[5]^2*u[5]-U[2]^2*u[3]*U[6]*u[7]+2*U[2]*U[3]*u[3]*U[5]*u[7]-U[2]*U[3]*u[4]*U[6]*u[7]+U[2]*U[3]*U[6]*u[7]*u[1]-2*U[2]*u[3]*U[6]*U[5]*u[7]-U[3]*u[3]*U[6]*U[5]*u[5]+U[3]*u[3]*U[6]*U[5]*u[8]-2*U[2]*U[3]*u[3]*U[6]*u[5]-U[2]*U[3]*u[4]*U[5]*u[5]+U[2]*U[3]*U[5]*u[5]*u[1]-U[2]*U[6]*U[5]*u[5]*u[1]+U[2]*U[6]*U[5]*u[8]*u[1]+2*U[3]*U[6]*U[5]*u[7]*u[1]
    C[72] = -U[2]^2*u[3]*U[6]*u[5]-U[2]^2*u[4]*U[5]*u[5]+U[2]*U[6]^2*u[5]*u[1]+U[2]*U[5]^2*u[8]*u[1]+U[3]^2*u[3]*U[6]*u[5]-U[3]^2*U[5]*u[5]*u[1]-U[3]*U[6]^2*u[7]*u[1]+U[3]*U[5]^2*u[7]*u[1]-U[3]^2*U[6]*u[7]*u[1]+U[3]*u[3]*U[6]^2*u[5]+U[3]*u[3]*U[5]^2*u[8]-U[2]^2*u[4]*U[6]*u[7]-U[2]*u[3]*U[5]^2*u[7]-U[3]^2*u[3]*U[5]*u[7]+U[2]^2*u[3]*U[5]*u[7]+U[2]*u[3]*U[6]^2*u[7]+2*U[2]*U[3]*u[3]*U[6]*u[7]+U[2]*U[3]*u[4]*U[5]*u[7]-U[2]*U[3]*U[5]*u[7]*u[1]+U[2]*u[3]*U[6]*U[5]*u[5]-U[2]*u[3]*U[6]*U[5]*u[8]-2*U[3]*u[3]*U[6]*U[5]*u[7]+2*U[2]*U[3]*u[3]*U[5]*u[5]-U[2]*U[3]*u[4]*U[6]*u[5]+U[2]*U[3]*U[6]*u[5]*u[1]-2*U[2]*U[6]*U[5]*u[7]*u[1]-U[3]*U[6]*U[5]*u[5]*u[1]+U[3]*U[6]*U[5]*u[8]*u[1]
    C[83] = -U[3]^2*U[6]*u[8]*u[1]-U[3]^2*U[5]*u[7]*u[1]+U[3]*u[4]*U[6]^2*u[5]+U[3]*u[4]*U[5]^2*u[8]-U[2]^2*u[4]*U[6]*u[8]-U[2]^2*u[4]*U[5]*u[7]+U[2]*u[3]*U[6]^2*u[5]+U[2]*u[3]*U[5]^2*u[8]-U[2]*u[4]*U[6]^2*u[7]+U[2]*u[4]*U[5]^2*u[7]-U[3]^2*u[3]*U[6]*u[7]+U[3]^2*u[3]*U[5]*u[8]+U[3]*u[3]*U[6]^2*u[7]-U[3]*u[3]*U[5]^2*u[7]+U[2]^2*u[3]*U[6]*u[7]-U[2]^2*u[3]*U[5]*u[8]+2*U[2]*U[3]*u[3]*U[6]*u[8]+2*U[2]*U[3]*u[3]*U[5]*u[7]+U[2]*U[3]*u[4]*U[6]*u[7]-U[2]*U[3]*u[4]*U[5]*u[8]-U[2]*U[3]*U[6]*u[7]*u[1]+U[2]*U[3]*U[5]*u[8]*u[1]-2*U[2]*u[3]*U[6]*U[5]*u[7]-U[2]*u[4]*U[6]*U[5]*u[5]+U[2]*u[4]*U[6]*U[5]*u[8]+U[3]*u[3]*U[6]*U[5]*u[5]-U[3]*u[3]*U[6]*U[5]*u[8]-2*U[3]*u[4]*U[6]*U[5]*u[7]
    C[78] = -U[3]^2*U[6]*u[8]*u[1]-U[3]^2*U[5]*u[7]*u[1]+U[3]*u[4]*U[6]^2*u[5]+U[3]*u[4]*U[5]^2*u[8]-U[2]^2*u[4]*U[6]*u[8]-U[2]^2*u[4]*U[5]*u[7]+U[2]*u[3]*U[6]^2*u[5]+U[2]*u[3]*U[5]^2*u[8]+U[2]*u[4]*U[6]^2*u[7]-U[2]*u[4]*U[5]^2*u[7]+U[3]^2*u[3]*U[6]*u[7]-U[3]^2*u[3]*U[5]*u[8]-U[3]*u[3]*U[6]^2*u[7]+U[3]*u[3]*U[5]^2*u[7]-U[2]^2*u[3]*U[6]*u[7]+U[2]^2*u[3]*U[5]*u[8]+2*U[2]*U[3]*u[3]*U[6]*u[8]+2*U[2]*U[3]*u[3]*U[5]*u[7]-U[2]*U[3]*u[4]*U[6]*u[7]+U[2]*U[3]*u[4]*U[5]*u[8]+U[2]*U[3]*U[6]*u[7]*u[1]-U[2]*U[3]*U[5]*u[8]*u[1]-2*U[2]*u[3]*U[6]*U[5]*u[7]+U[2]*u[4]*U[6]*U[5]*u[5]-U[2]*u[4]*U[6]*U[5]*u[8]-U[3]*u[3]*U[6]*U[5]*u[5]+U[3]*u[3]*U[6]*U[5]*u[8]-2*U[3]*u[4]*U[6]*U[5]*u[7]
    C[[1,13]] .= u[1]
    C[31] = u[4]
    C[[2,14]] .= u[5]
    C[32] = u[8]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(v,w,x,y,z) = [v^2,w*v,w^2,x*v,w*x,x^2,v*y,w*y,x*y,y^2,v*z,w*z,x*z,y*z,z^2,v,w,x,y,z,1]

    return C,U

end