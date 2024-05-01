include("../_common/header.jl")
include("inidata_num_stitching.jl")
include("coefs_stitching.jl")
include("red_6x30_stitching.jl")

function test_num_stitching()

    Random.seed!(23)
    N = 10000
    d = 18

    stats = ini_stats("stitching")

    for i in 1:N
        data = inidata_num_stitching()
        C,U = coefs_stitching(data)

        toc = @elapsed S = red_6x30_stitching(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_stitching()