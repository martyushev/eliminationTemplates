include("../_common/header.jl")
include("inidata_num_relpose_7p_fr.jl")
include("coefs_relpose_7p_fr.jl")
include("red_138x210_relpose_7p_fr.jl")

function test_num_relpose_7p_fr()

    Random.seed!(23)
    N = 10000
    d = 68

    stats = ini_stats("relpose_7p_fr")

    for i in 1:N
        data = inidata_num_relpose_7p_fr()
        C,U = coefs_relpose_7p_fr(data)

        toc = @elapsed S = red_138x210_relpose_7p_fr(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_7p_fr()