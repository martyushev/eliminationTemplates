include("../_common/header.jl")
include("inidata_num_opt_pnp_nakanoC.jl")
include("coefs_opt_pnp_nakanoC.jl")
include("red_78x131_opt_pnp_nakanoC.jl")

function test_num_opt_pnp_nakanoC()

    Random.seed!(23)
    N = 10000
    d = 40

    stats = ini_stats("opt_pnp_nakanoC")

    for i in 1:N
        data = inidata_num_opt_pnp_nakanoC()
        C,U = coefs_opt_pnp_nakanoC(data)

        toc = @elapsed S = red_78x131_opt_pnp_nakanoC(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_opt_pnp_nakanoC()