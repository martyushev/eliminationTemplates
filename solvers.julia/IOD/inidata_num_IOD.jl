function inidata_num_IOD()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(4,2))
    push!(data,randn(4,2))
    push!(data,randn(4,2))
    push!(data,randn(4,2))
    push!(data,randn(4,2))
    return data

end