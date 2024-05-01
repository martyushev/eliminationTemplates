function inidata_num_wpnp()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,1))
    push!(data,randn(2,3))
    return data

end