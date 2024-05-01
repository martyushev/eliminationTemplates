include("../_common/header.jl")
include("inidata_num_toa_55.jl")
include("coefs_toa_55.jl")
include("red_772x832_toa_55.jl")

function test_num_toa_55()

    Random.seed!(23)
    N = 10000
    d = 42

    stats = ini_stats("toa_55")

    for i in 1:N
        data = inidata_num_toa_55()
        C,U = coefs_toa_55(data)

        toc = @elapsed S = red_772x832_toa_55(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_toa_55()