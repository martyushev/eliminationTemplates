include("../_common/header.jl")
include("inidata_num_focal6p_1s.jl")
include("coefs_focal6p_1s.jl")
include("red_11x20_focal6p_1s.jl")

function test_num_focal6p_1s()

    Random.seed!(23)
    N = 10000
    d = 9

    stats = ini_stats("focal6p_1s")

    for i in 1:N
        data = inidata_num_focal6p_1s()
        C,U = coefs_focal6p_1s(data)

        toc = @elapsed S = red_11x20_focal6p_1s(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_focal6p_1s()