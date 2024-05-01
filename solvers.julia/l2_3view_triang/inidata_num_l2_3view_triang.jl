function inidata_num_l2_3view_triang()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,3))
    push!(data,randn(3,3))
    push!(data,randn(2,3))
    return data

end