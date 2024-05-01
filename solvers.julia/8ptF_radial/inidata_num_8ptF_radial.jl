function inidata_num_8ptF_radial()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(6,7))
    push!(data,randn(2,2))
    push!(data,randn(2,2))
    return data

end