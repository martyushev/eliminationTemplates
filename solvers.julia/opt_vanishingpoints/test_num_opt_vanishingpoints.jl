include("../_common/header.jl")
include("inidata_num_opt_vanishingpoints.jl")
include("coefs_opt_vanishingpoints.jl")
include("red_136x194_opt_vanishingpoints.jl")

function test_num_opt_vanishingpoints()

    Random.seed!(23)
    N = 10000
    d = 40

    stats = ini_stats("opt_vanishingpoints")

    for i in 1:N
        data = inidata_num_opt_vanishingpoints()
        C,U = coefs_opt_vanishingpoints(data)

        toc = @elapsed S = red_136x194_opt_vanishingpoints(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_opt_vanishingpoints()