function inidata_num_stitching()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(16,1))
    push!(data,randn(16,1))
    return data

end