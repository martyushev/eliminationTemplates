function inidata_num_gen5pra()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(3,5))
    push!(data,randn(3,5))
    push!(data,randn(3,5))
    push!(data,randn(3,5))
    for i in 1:5
        data[1][:,i] = data[1][:,i]/norm(data[1][:,i])
        data[2][:,i] = data[2][:,i]/norm(data[2][:,i])
        data[3][:,i] = skew(data[1][:,i])*data[3][:,i]
        data[4][:,i] = skew(data[2][:,i])*data[4][:,i]
    end
    push!(data,randn(1,1))
    return data
    
end