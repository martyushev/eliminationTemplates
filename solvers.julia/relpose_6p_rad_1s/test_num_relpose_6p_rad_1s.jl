include("../_common/header.jl")
include("inidata_num_relpose_6p_rad_1s.jl")
include("coefs_relpose_6p_rad_1s.jl")
include("red_14x40_relpose_6p_rad_1s.jl")

function test_num_relpose_6p_rad_1s()

    Random.seed!(23)
    N = 10000
    d = 26

    stats = ini_stats("relpose_6p_rad_1s")

    for i in 1:N
        data = inidata_num_relpose_6p_rad_1s()
        C,U = coefs_relpose_6p_rad_1s(data)

        toc = @elapsed S = red_14x40_relpose_6p_rad_1s(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_6p_rad_1s()