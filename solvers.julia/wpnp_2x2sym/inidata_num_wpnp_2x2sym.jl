function inidata_num_wpnp_2x2sym()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,1))
    push!(data,randn(2,3))
    return data

end