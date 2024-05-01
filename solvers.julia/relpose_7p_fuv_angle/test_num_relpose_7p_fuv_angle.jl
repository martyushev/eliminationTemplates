include("../_common/header.jl")
include("inidata_num_relpose_7p_fuv_angle.jl")
include("coefs_relpose_7p_fuv_angle.jl")
include("red_26x33_relpose_7p_fuv_angle.jl")

function test_num_relpose_7p_fuv_angle()

    Random.seed!(23)
    N = 10000
    d = 6

    stats = ini_stats("relpose_7p_fuv_angle")

    for i in 1:N
        data = inidata_num_relpose_7p_fuv_angle()
        C,U = coefs_relpose_7p_fuv_angle(data)

        toc = @elapsed S = red_26x33_relpose_7p_fuv_angle(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_7p_fuv_angle()