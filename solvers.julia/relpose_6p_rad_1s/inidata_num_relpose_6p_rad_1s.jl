function inidata_num_relpose_6p_rad_1s()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(6,6))
    return data

end