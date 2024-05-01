include("../_common/header.jl")
include("inidata_num_toy.jl")
include("coefs_toy.jl")
include("red_14x22_toy.jl")

function test_num_toy()

    Random.seed!(23)
    N = 10000
    d = 8

    stats = ini_stats("toy")

    for i in 1:N
        data = inidata_num_toy()
        C,U = coefs_toy(data)

        toc = @elapsed S = red_14x22_toy(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_toy()