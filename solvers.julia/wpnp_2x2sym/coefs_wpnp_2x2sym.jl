function coefs_wpnp_2x2sym(data::Vector{Matrix{Float64}})

    A = data[1]
    B = data[2]

    C = zeros(ComplexF64,4,16)

    C[[14,24,31,33]] .= 64*A[3]^2
    C[[3,5,38,48]] .= -32*A[1]^2+32*A[2]^2
    C[[12,17,26,43]] .= 32*A[1]^2+32*A[2]^2
    C[[56,59]] .= -8*A[3]*B[5]-8*im*A[3]*B[6]
    C[[50,61]] .= 8*im*A[3]*B[6]-8*A[3]*B[5]
    C[60] = -8*A[1]*B[1]+8*A[2]*B[4]-8*im*A[1]*B[2]-8*im*A[2]*B[3]
    C[49] = -8*A[1]*B[1]+8*A[2]*B[4]+8*im*A[1]*B[2]+8*im*A[2]*B[3]
    C[55] = 8*A[1]*B[1]+8*A[2]*B[4]+8*im*A[1]*B[2]-8*im*A[2]*B[3]
    C[62] = -8*im*A[1]*B[2]+8*im*A[2]*B[3]+8*A[1]*B[1]+8*A[2]*B[4]

    C = C./repeat(sqrt.(sum(C.*conj(C),dims=2)),1,size(C,2))

    U(w1,x1,y1,z1) = [x1*w1^2*y1,x1*y1^2*w1,x1*w1^2*z1,x1*y1*z1*w1,x1*z1^2*w1,y1*x1*w1,y1^2*x1,z1*x1*w1,z1*y1*x1,z1^2*x1,x1*y1,x1*z1,w1,y1,z1,1]

    return C,U

end