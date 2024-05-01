include("../_common/header.jl")
include("inidata_num_rollingshutter.jl")
include("coefs_rollingshutter.jl")
include("red_40x52_rollingshutter.jl")

function test_num_rollingshutter()

    Random.seed!(23)
    N = 10000
    d = 8

    stats = ini_stats("rollingshutter")

    for i in 1:N
        data = inidata_num_rollingshutter()
        C,U = coefs_rollingshutter(data)

        toc = @elapsed S = red_40x52_rollingshutter(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_rollingshutter()