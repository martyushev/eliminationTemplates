function inidata_num_unsynch_relpose()

    data = Vector{Matrix{Float64}}()
    push!(data,randn(15,7))
    return data

end