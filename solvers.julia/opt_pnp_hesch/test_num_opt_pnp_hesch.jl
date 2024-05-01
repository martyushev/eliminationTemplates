include("../_common/header.jl")
include("inidata_num_opt_pnp_hesch.jl")
include("coefs_opt_pnp_hesch.jl")
include("red_62x97_opt_pnp_hesch.jl")

function test_num_opt_pnp_hesch()

    Random.seed!(23)
    N = 10000
    d = 27

    stats = ini_stats("opt_pnp_hesch")

    for i in 1:N
        data = inidata_num_opt_pnp_hesch()
        C,U = coefs_opt_pnp_hesch(data)

        toc = @elapsed S = red_62x97_opt_pnp_hesch(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_opt_pnp_hesch()