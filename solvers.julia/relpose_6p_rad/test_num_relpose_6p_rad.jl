include("../_common/header.jl")
include("inidata_num_relpose_6p_rad.jl")
include("coefs_relpose_6p_rad.jl")
include("red_39x95_relpose_6p_rad.jl")

function test_num_relpose_6p_rad()

    Random.seed!(23)
    N = 10000
    d = 52

    stats = ini_stats("relpose_6p_rad")

    for i in 1:N
        data = inidata_num_relpose_6p_rad()
        C,U = coefs_relpose_6p_rad(data)

        toc = @elapsed S = red_39x95_relpose_6p_rad(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_6p_rad()