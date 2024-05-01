function inidata_num_relpose_6p_rad()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,6))
    push!(data,randn(2,6))
    return data

end