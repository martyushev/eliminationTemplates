function coefs_stitching(data::Vector{Matrix{Float64}})

    c1 = data[1]
    c2 = data[2]

    C = zeros(2,16)
    C[1] = c1[1]
    C[3] = c1[2]
    C[5] = c1[3]
    C[7] = c1[4]
    C[9] = c1[5]
    C[11] = c1[6]
    C[13] = c1[7]
    C[15] = c1[8]
    C[19] = c1[9]
    C[17] = c1[10]
    C[21] = c1[11]
    C[25] = c1[12]
    C[23] = c1[13]
    C[27] = c1[14]
    C[29] = c1[15]
    C[31] = c1[16]
    C[2] = c2[1]
    C[4] = c2[2]
    C[6] = c2[3]
    C[8] = c2[4]
    C[10] = c2[5]
    C[12] = c2[6]
    C[14] = c2[7]
    C[16] = c2[8]
    C[20] = c2[9]
    C[18] = c2[10]
    C[22] = c2[11]
    C[26] = c2[12]
    C[24] = c2[13]
    C[28] = c2[14]
    C[30] = c2[15]
    C[32] = c2[16]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(x,y) = [x^6*y^3,x^5*y^3,x^4*y^3,x^4*y^2,y^3*x^3,y^2*x^3,y^3*x^2,y^2*x^2,y^3*x,y*x^2,y^2*x,y^3,x*y,y^2,y,1]

    return C,U

end