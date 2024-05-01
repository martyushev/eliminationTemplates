function inidata_num_optpose3pt_v2()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,3))
    push!(data,randn(12,1))
    return data

end