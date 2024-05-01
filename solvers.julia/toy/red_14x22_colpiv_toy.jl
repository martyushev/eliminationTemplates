# Input: coefficient matrix C of size 3x10
# Output: solution matrix S of size 3x8

function red_14x22_colpiv_toy(C::Array{Float64})

    M = sparse([1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,9,9,9,10,10,10,10,11,11,11,12,12,13,13,13,14,14,14],[2,10,11,11,12,19,21,1,4,7,8,9,11,16,18,14,17,21,22,8,10,13,16,7,9,12,20,1,3,19,4,6,16,13,15,18,22,5,10,14,3,20,2,6,17,5,12,15],C[[25,13,19,25,28,13,19,28,25,13,19,25,28,13,19,13,19,25,28,25,28,13,19,11,23,29,17,29,11,17,29,11,17,11,17,23,29,11,29,17,3,6,30,3,6,3,30,6]],14,22)
    M = Matrix(M)

    L,_,p = lu(M[:,1:6])
    Id = Matrix{Float64}(I,14,14)
    M = [L Id[:,7:end]][invperm(p),:]\M[:,7:end]
    M = M[7:end,:]

    L,U,p = lu(M[:,1:6])
    Id = Matrix{Float64}(I,8,8)
    M = [L Id[:,7:end]][invperm(p),:]\M[:,7:end]
    M1 = M[1:6,:]
    M2 = M[7:end,:]

    Q,R,p = qr(M2[:,1:end-4],ColumnNorm())
    A = U\[M1[:,p] M1[:,end-3:end]]
    B = R[:,1:2]\[R[:,3:end] transpose(Q)*M2[:,end-3:end]]
    M = [-A[:,end-7:end]+A[:,1:end-8]*B; -B]

    P1 = Vector{Int}([11:16; p; 7:10])
    P2 = Vector{Int}([11,7,8,12,9,13,14,10,15,16])
    T = getT(M,P1[1:end-8],P1[end-7:end],P2)

    _,V = eigen(T)
    S = V[5:7,:]./repeat(V[8:8,:],3)
    S = S[:,vec(all(c -> !isinf(c) && !isnan(c), S; dims=1))]

    return S

end