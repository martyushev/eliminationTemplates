include("../_common/header.jl")
include("inidata_num_relpose_7p_fr_1s_elr.jl")
include("coefs_relpose_7p_fr_1s_elr.jl")
include("red_22x41_relpose_7p_fr_1s_elr.jl")

function test_num_relpose_7p_fr_1s_elr()

    Random.seed!(23)
    N = 10000
    d = 19

    stats = ini_stats("relpose_7p_fr_1s_elr")

    for i in 1:N
        data = inidata_num_relpose_7p_fr_1s_elr()
        C,U = coefs_relpose_7p_fr_1s_elr(data)

        toc = @elapsed S = red_22x41_relpose_7p_fr_1s_elr(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_7p_fr_1s_elr()