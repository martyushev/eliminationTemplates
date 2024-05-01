# get action matrix
function getT(M::Matrix{Float64},RP::Vector{Int},B::Vector{Int},xP::Vector{Int})

    d = length(B)
    T = zeros(d,d)
    for i in 1:d
        r = findall(RP.==xP[B[i]])
        if isempty(r); T[i,findall(B.==xP[B[i]])] .= 1; else; T[i,:] = M[r,:]; end
    end

    return T

end