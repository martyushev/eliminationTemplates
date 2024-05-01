include("../_common/header.jl")
include("inidata_num_toa_46.jl")
include("coefs_toa_46.jl")
include("red_427x475_toa_46.jl")

function test_num_toa_46()

    Random.seed!(23)
    N = 10000
    d = 38

    stats = ini_stats("toa_46")

    for i in 1:N
        data = inidata_num_toa_46()
        C,U = coefs_toa_46(data)

        toc = @elapsed S = red_427x475_toa_46(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_toa_46()