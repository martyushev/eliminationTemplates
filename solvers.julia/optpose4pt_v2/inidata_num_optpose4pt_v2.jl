function inidata_num_optpose4pt_v2()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,4))
    push!(data,randn(16,1))
    return data

end