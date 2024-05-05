include("../_common/header.jl")
include("inidata_num_wpnp_2x2sym.jl")
include("coefs_wpnp_2x2sym.jl")
include("red_10x20_wpnp_2x2sym.jl")

function test_num_wpnp_2x2sym()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("wpnp_2x2sym")

    for i in 1:N
        data = inidata_num_wpnp_2x2sym()
        C,U = coefs_wpnp_2x2sym(data)

        toc = @elapsed S = red_10x20_wpnp_2x2sym(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_wpnp_2x2sym()