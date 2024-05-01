include("../_common/header.jl")
include("inidata_num_pose_35pt.jl")
include("coefs_pose_35pt.jl")
include("red_12x26_pose_35pt.jl")

function test_num_pose_35pt()

    Random.seed!(23)
    N = 10000
    d = 10

    stats = ini_stats("pose_35pt")

    for i in 1:N
        data = inidata_num_pose_35pt()
        C,U = coefs_pose_35pt(data)

        toc = @elapsed S = red_12x26_pose_35pt(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_pose_35pt()