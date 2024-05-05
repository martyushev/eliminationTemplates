function inidata_num_gen6p()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,6))
    push!(data,randn(3,6))
    push!(data,randn(3,6))
    push!(data,randn(3,6))
    for i in 1:6
        data[1][:,i] = data[1][:,i]/norm(data[1][:,i])
        data[2][:,i] = data[2][:,i]/norm(data[2][:,i])
        data[3][:,i] = skew(data[1][:,i])*data[3][:,i]
        data[4][:,i] = skew(data[2][:,i])*data[4][:,i]
    end
    return data
    
end