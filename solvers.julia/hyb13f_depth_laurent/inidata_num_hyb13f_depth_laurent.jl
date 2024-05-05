function inidata_num_hyb13f_depth_laurent()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,4))
    push!(data,randn(2,1))
    push!(data,randn(3,3))
    return data

end