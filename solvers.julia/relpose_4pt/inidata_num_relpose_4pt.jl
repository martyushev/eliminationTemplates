function inidata_num_relpose_4pt()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,4))
    push!(data,randn(2,4))
    push!(data,randn(1,1))
    return data

end