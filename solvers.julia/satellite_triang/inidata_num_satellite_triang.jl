function inidata_num_satellite_triang()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(20,1))
    push!(data,randn(20,1))
    push!(data,randn(20,1))
    return data

end