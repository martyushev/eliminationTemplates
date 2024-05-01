include("../_common/header.jl")
include("inidata_num_wpnp.jl")
include("coefs_wpnp.jl")
include("red_85x107_wpnp.jl")

function test_num_wpnp()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("wpnp")

    for i in 1:N
        data = inidata_num_wpnp()
        C,U = coefs_wpnp(data)

        toc = @elapsed S = red_85x107_wpnp(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_wpnp()