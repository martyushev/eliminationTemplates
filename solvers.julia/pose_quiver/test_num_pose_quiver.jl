include("../_common/header.jl")
include("inidata_num_pose_quiver.jl")
include("coefs_pose_quiver.jl")
include("red_38x74_pose_quiver.jl")

function test_num_pose_quiver()

    Random.seed!(23)
    N = 10000
    d = 20

    stats = ini_stats("pose_quiver")

    for i in 1:N
        data = inidata_num_pose_quiver()
        C,U = coefs_pose_quiver(data)

        toc = @elapsed S = red_38x74_pose_quiver(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_pose_quiver()