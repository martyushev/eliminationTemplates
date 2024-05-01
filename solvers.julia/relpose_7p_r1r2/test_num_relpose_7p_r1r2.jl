include("../_common/header.jl")
include("inidata_num_relpose_7p_r1r2.jl")
include("coefs_relpose_7p_r1r2.jl")
include("red_204x289_relpose_7p_r1r2.jl")

function test_num_relpose_7p_r1r2()

    Random.seed!(23)
    N = 10000
    d = 76

    stats = ini_stats("relpose_7p_r1r2")

    for i in 1:N
        data = inidata_num_relpose_7p_r1r2()
        C,U = coefs_relpose_7p_r1r2(data)

        toc = @elapsed S = red_204x289_relpose_7p_r1r2(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_7p_r1r2()