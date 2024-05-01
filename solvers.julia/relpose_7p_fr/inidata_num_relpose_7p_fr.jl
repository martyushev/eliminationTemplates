function inidata_num_relpose_7p_fr()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,7))
    push!(data,randn(2,7))
    return data

end