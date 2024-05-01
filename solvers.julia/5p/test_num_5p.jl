include("../_common/header.jl")
include("inidata_num_5p.jl")
include("coefs_5p.jl")
include("red_10x20_5p.jl")

function test_num_5p()

    Random.seed!(23)
    N = 10000
    d = 10

    stats = ini_stats("5p")

    for i in 1:N
        data = inidata_num_5p()
        C,U = coefs_5p(data)

        toc = @elapsed S = red_10x20_5p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_5p()