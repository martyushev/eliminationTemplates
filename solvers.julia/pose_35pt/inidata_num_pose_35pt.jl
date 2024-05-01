function inidata_num_pose_35pt()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,4))
    push!(data,randn(4,1))
    push!(data,randn(3,1))
    return data

end