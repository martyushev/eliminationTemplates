include("../_common/header.jl")
include("inidata_num_l2_3view_triang.jl")
include("coefs_l2_3view_triang.jl")
include("red_190x227_l2_3view_triang.jl")

function test_num_l2_3view_triang()

    Random.seed!(23)
    N = 10000
    d = 31

    stats = ini_stats("l2_3view_triang")

    for i in 1:N
        data = inidata_num_l2_3view_triang()
        C,U = coefs_l2_3view_triang(data)

        toc = @elapsed S = red_190x227_l2_3view_triang(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_l2_3view_triang()