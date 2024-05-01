include("../_common/header.jl")
include("inidata_num_p4p_fr.jl")
include("coefs_p4p_fr.jl")
include("red_42x60_p4p_fr.jl")

function test_num_p4p_fr()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("p4p_fr")

    for i in 1:N
        data = inidata_num_p4p_fr()
        C,U = coefs_p4p_fr(data)

        toc = @elapsed S = red_42x60_p4p_fr(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_p4p_fr()