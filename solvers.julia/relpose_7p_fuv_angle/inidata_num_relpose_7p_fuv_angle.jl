function inidata_num_relpose_7p_fuv_angle()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,2))
    data[1] = [data[1] data[1][:,1]*randn()+data[1][:,2]*randn()]
    push!(data,randn(1,1))
    return data

end