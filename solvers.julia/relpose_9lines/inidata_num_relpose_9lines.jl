function inidata_num_relpose_9lines()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,7))
    push!(data,randn(3,7))
    push!(data,randn(3,7))
    return data

end