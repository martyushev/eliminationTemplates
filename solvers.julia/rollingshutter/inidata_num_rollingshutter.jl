function inidata_num_rollingshutter()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(9,1))
    push!(data,randn(9,1))
    push!(data,randn(9,1))
    push!(data,randn(9,1))
    push!(data,randn(9,1))
    push!(data,randn(9,1))
    return data

end