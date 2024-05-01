function inidata_num_3v_triang_laurent()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,4))
    push!(data,randn(2,4))
    push!(data,randn(2,4))
    push!(data,randn(2,1))
    push!(data,randn(2,1))
    push!(data,randn(2,1))
    return data

end