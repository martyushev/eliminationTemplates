include("../_common/header.jl")
include("inidata_num_opt_pnp_zheng.jl")
include("coefs_opt_pnp_zheng.jl")
include("red_109x161_opt_pnp_zheng.jl")

function test_num_opt_pnp_zheng()

    Random.seed!(23)
    N = 10000
    d = 40

    stats = ini_stats("opt_pnp_zheng")

    for i in 1:N
        data = inidata_num_opt_pnp_zheng()
        C,U = coefs_opt_pnp_zheng(data)

        toc = @elapsed S = red_109x161_opt_pnp_zheng(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_opt_pnp_zheng()