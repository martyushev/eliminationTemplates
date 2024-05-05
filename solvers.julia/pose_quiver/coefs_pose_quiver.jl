function coefs_pose_quiver(data::Vector{Matrix{Float64}})

    M = data[1]

    C = zeros(4,18)

    C[25] = -2*M[9]
    C[5] = 2*M[9]
    C[26] = -2*M[10]
    C[6] = 2*M[10]
    C[27] = -2*M[11]
    C[7] = 2*M[11]
    C[28] = -2*M[12]
    C[8] = 2*M[12]
    C[[9,21]] .= 2*M[21]
    C[[10,22]] .= 2*M[22]
    C[[11,23]] .= 2*M[23]
    C[[12,24]] .= 2*M[24]
    C[[45,57]] .= 2*M[25]
    C[[46,58]] .= 2*M[26]
    C[[47,59]] .= 2*M[27]
    C[[48,60]] .= 2*M[28]
    C[49] = -2*M[29]
    C[53] = 2*M[29]
    C[50] = -2*M[30]
    C[54] = 2*M[30]
    C[51] = -2*M[31]
    C[55] = 2*M[31]
    C[52] = -2*M[32]
    C[56] = 2*M[32]
    C[[1,17]] .= -M[33]
    C[[2,18]] .= -M[34]
    C[[3,19]] .= -M[35]
    C[[4,20]] .= -M[36]
    C[61] = -M[1]-M[17]
    C[37] = -M[1]+M[17]
    C[13] = M[1]-M[17]
    C[69] = M[1]+M[17]
    C[62] = -M[2]-M[18]
    C[38] = -M[2]+M[18]
    C[14] = M[2]-M[18]
    C[70] = M[2]+M[18]
    C[63] = -M[3]-M[19]
    C[39] = -M[3]+M[19]
    C[15] = M[3]-M[19]
    C[71] = M[3]+M[19]
    C[64] = -M[4]-M[20]
    C[40] = -M[4]+M[20]
    C[16] = M[4]-M[20]
    C[72] = M[4]+M[20]
    C[65] = 2*M[5]-2*M[13]
    C[41] = 2*M[5]+2*M[13]
    C[66] = 2*M[6]-2*M[14]
    C[42] = 2*M[6]+2*M[14]
    C[67] = 2*M[7]-2*M[15]
    C[43] = 2*M[7]+2*M[15]
    C[68] = 2*M[8]-2*M[16]
    C[44] = 2*M[8]+2*M[16]
    C[[29,33]] .= M[33]
    C[[30,34]] .= M[34]
    C[[31,35]] .= M[35]
    C[[32,36]] .= M[36]

    A = C[:,1:4]\C[:,5:end]

    C = zeros(4,18)

    C[[17,30,40,53]] .= -1
    C[[1,5,10,15,23,28]] .= 1
    C[33] = A[25]
    C[34] = A[26]
    C[35] = A[27]
    C[36] = A[28]
    C[41] = A[29]
    C[42] = A[30]
    C[43] = A[31]
    C[44] = A[32]
    C[57] = A[33]
    C[58] = A[34]
    C[59] = A[35]
    C[60] = A[36]
    C[45] = A[37]
    C[46] = A[38]
    C[47] = A[39]
    C[48] = A[40]
    C[61] = A[41]
    C[62] = A[42]
    C[63] = A[43]
    C[64] = A[44]
    C[49] = A[45]
    C[50] = A[46]
    C[51] = A[47]
    C[52] = A[48]
    C[65] = A[49]
    C[66] = A[50]
    C[67] = A[51]
    C[68] = A[52]
    C[69] = A[53]
    C[70] = A[54]
    C[71] = A[55]
    C[72] = A[56]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(w,x,y,z) = [w*x^2,w*y^2,w*x*z,w*y*z,w*z^2,w*x,x^2,w*y,x*y,y^2,x*z,y*z,z^2,w,x,y,z,1]

    return C,U

end