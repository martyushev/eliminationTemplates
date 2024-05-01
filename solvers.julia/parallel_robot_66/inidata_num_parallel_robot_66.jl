function inidata_num_parallel_robot_66()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,6))
    push!(data,randn(3,6))
    push!(data,randn(1,6))
    return data

end