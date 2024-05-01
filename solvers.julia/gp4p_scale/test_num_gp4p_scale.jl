include("../_common/header.jl")
include("inidata_num_gp4p_scale.jl")
include("coefs_gp4p_scale.jl")
include("red_40x52_gp4p_scale.jl")

function test_num_gp4p_scale()

    Random.seed!(23)
    N = 10000
    d = 8

    stats = ini_stats("gp4p_scale")

    for i in 1:N
        data = inidata_num_gp4p_scale()
        C,U = coefs_gp4p_scale(data)

        toc = @elapsed S = red_40x52_gp4p_scale(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_gp4p_scale()