function inidata_num_hyb51f()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,5))
    push!(data,randn(2,5))
    push!(data,randn(3,5))
    return data

end