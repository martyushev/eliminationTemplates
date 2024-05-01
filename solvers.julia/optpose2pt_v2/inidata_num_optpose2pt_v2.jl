function inidata_num_optpose2pt_v2()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,2))
    push!(data,randn(8,1))
    return data

end