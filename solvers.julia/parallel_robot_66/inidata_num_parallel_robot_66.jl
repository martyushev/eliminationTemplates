function inidata_num_parallel_robot_66()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(6,3))
    push!(data,randn(6,3))
    push!(data,randn(6,1))
    return data

end