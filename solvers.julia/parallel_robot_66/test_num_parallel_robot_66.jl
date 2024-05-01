include("../_common/header.jl")
include("inidata_num_parallel_robot_66.jl")
include("coefs_parallel_robot_66.jl")
include("red_293x362_parallel_robot_66.jl")

function test_num_parallel_robot_66()

    Random.seed!(23)
    N = 10000
    d = 40

    stats = ini_stats("parallel_robot_66")

    for i in 1:N
        data = inidata_num_parallel_robot_66()
        C,U = coefs_parallel_robot_66(data)

        toc = @elapsed S = red_293x362_parallel_robot_66(C,data[3][1])
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_parallel_robot_66()