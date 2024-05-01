function inidata_num_3pra_st0()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,3))
    push!(data,randn(3,3))
    push!(data,randn(1,1))
    return data

end