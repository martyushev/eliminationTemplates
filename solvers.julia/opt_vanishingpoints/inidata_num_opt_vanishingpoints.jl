function inidata_num_opt_vanishingpoints()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(6,1))
    push!(data,randn(6,1))
    push!(data,randn(6,1))
    return data

end