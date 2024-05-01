function inidata_num_r6p()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,3))
    push!(data,randn(3,3))
    push!(data,randn(6,16))
    return data

end