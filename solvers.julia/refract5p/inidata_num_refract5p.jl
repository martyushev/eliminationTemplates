function inidata_num_refract5p()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,5))
    push!(data,randn(3,5))
    return data

end