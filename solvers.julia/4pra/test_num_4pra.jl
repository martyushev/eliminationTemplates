include("../_common/header.jl")
include("inidata_num_4pra.jl")
include("coefs_4pra.jl")
include("red_12x36_4pra.jl")

function test_num_4pra()

    Random.seed!(23)
    N = 10000
    d = 20

    stats = ini_stats("4pra")

    for i in 1:N
        data = inidata_num_4pra()
        C,U = coefs_4pra(data)

        toc = @elapsed S = red_12x36_4pra(C,data[3][1]^2-1)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_4pra()