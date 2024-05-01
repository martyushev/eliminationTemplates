include("../_common/header.jl")
include("inidata_num_p4p_fr_iccv17.jl")
include("coefs_p4p_fr_iccv17.jl")
include("red_28x40_p4p_fr_iccv17.jl")

function test_num_p4p_fr_iccv17()

    Random.seed!(23)
    N = 10000
    d = 12

    stats = ini_stats("p4p_fr_iccv17")

    for i in 1:N
        data = inidata_num_p4p_fr_iccv17()
        C,U = coefs_p4p_fr_iccv17(data)

        toc = @elapsed S = red_28x40_p4p_fr_iccv17(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_p4p_fr_iccv17()