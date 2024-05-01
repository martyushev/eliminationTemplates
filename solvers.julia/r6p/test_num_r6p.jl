include("../_common/header.jl")
include("inidata_num_r6p.jl")
include("coefs_r6p.jl")
include("red_66x92_r6p.jl")

function test_num_r6p()

    Random.seed!(23)
    N = 10000
    d = 20

    stats = ini_stats("r6p")

    for i in 1:N
        data = inidata_num_r6p()
        C,U = coefs_r6p(data)

        toc = @elapsed S = red_66x92_r6p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_r6p()