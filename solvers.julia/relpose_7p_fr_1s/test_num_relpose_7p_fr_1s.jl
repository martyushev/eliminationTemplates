include("../_common/header.jl")
include("inidata_num_relpose_7p_fr_1s.jl")
include("coefs_relpose_7p_fr_1s.jl")
include("red_34x56_relpose_7p_fr_1s.jl")

function test_num_relpose_7p_fr_1s()

    Random.seed!(23)
    N = 10000
    d = 19

    stats = ini_stats("relpose_7p_fr_1s")

    for i in 1:N
        data = inidata_num_relpose_7p_fr_1s()
        C,U = coefs_relpose_7p_fr_1s(data)

        toc = @elapsed S = red_34x56_relpose_7p_fr_1s(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_7p_fr_1s()