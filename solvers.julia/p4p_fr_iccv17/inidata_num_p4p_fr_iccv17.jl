function inidata_num_p4p_fr_iccv17()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(8,4))
    push!(data,randn(4,8))
    return data

end