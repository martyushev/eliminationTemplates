function coefs_toy(data::Vector{Matrix{Float64}})

    A = data[1]

    C = zeros(3,10)

    C[[3,6,9,11,13,17,19,23,25]] .= 1
    C[28] = A[1]
    C[29] = A[2]
    C[30] = A[3]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(x,y,z) = [x^3,y^3,z^2*x,x^2,y*x,y^2,y*z,z^2,z,1]

    return C,U

end