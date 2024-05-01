include("../_common/header.jl")
include("inidata_num_focal6p.jl")
include("coefs_focal6p.jl")
include("red_11x26_focal6p.jl")

function test_num_focal6p()

    Random.seed!(23)
    N = 10000
    d = 15

    stats = ini_stats("focal6p")

    for i in 1:N
        data = inidata_num_focal6p()
        C,U = coefs_focal6p(data)

        toc = @elapsed S = red_11x26_focal6p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_focal6p()