include("../_common/header.jl")
include("inidata_num_gen6p.jl")
include("coefs_gen6p.jl")
include("red_78x155_gen6p.jl")

function test_num_gen6p()

    Random.seed!(23)
    N = 10000
    d = 64

    stats = ini_stats("gen6p")

    for i in 1:N
        data = inidata_num_gen6p()
        C,U = coefs_gen6p(data)

        toc = @elapsed S = red_78x155_gen6p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_gen6p()