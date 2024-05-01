function inidata_num_rdist9p()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(2,9))
    push!(data,randn(2,9))
    return data

end