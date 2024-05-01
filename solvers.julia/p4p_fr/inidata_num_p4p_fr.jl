function inidata_num_p4p_fr()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(4,4))
    push!(data,randn(4,4))
    push!(data,randn(4,8))
    return data

end