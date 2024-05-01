include("../_common/header.jl")
include("inidata_num_optpose2pt_v2.jl")
include("coefs_optpose2pt_v2.jl")
include("red_87x120_optpose2pt_v2.jl")

function test_num_optpose2pt_v2()

    Random.seed!(23)
    N = 10000
    d = 24

    stats = ini_stats("optpose2pt_v2")

    for i in 1:N
        data = inidata_num_optpose2pt_v2()
        C,U = coefs_optpose2pt_v2(data)

        toc = @elapsed S = red_87x120_optpose2pt_v2(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_optpose2pt_v2()