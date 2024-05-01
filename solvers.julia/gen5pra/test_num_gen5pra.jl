include("../_common/header.jl")
include("inidata_num_gen5pra.jl")
include("coefs_gen5pra.jl")
include("red_34x79_gen5pra.jl")

function test_num_gen5pra()

    Random.seed!(23)
    N = 10000
    d = 44

    stats = ini_stats("gen5pra")

    for i in 1:N
        data = inidata_num_gen5pra()
        C,U = coefs_gen5pra(data)

        toc = @elapsed S = red_34x79_gen5pra(C,data[5][1]^2-1)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_gen5pra()