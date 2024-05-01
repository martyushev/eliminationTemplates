function inidata_num_4pra()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,4))
    push!(data,randn(3,4))
    push!(data,randn(1,1))
    return data

end