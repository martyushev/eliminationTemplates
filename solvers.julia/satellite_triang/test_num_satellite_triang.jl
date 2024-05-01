include("../_common/header.jl")
include("inidata_num_satellite_triang.jl")
include("coefs_satellite_triang.jl")
include("red_74x104_satellite_triang.jl")

function test_num_satellite_triang()

    Random.seed!(23)
    N = 10000
    d = 27

    stats = ini_stats("satellite_triang")

    for i in 1:N
        data = inidata_num_satellite_triang()
        C,U = coefs_satellite_triang(data)

        toc = @elapsed S = red_74x104_satellite_triang(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_satellite_triang()