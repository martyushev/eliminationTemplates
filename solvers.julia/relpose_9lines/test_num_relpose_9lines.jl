include("../_common/header.jl")
include("inidata_num_relpose_9lines.jl")
include("coefs_relpose_9lines.jl")
include("red_1610x1726_relpose_9lines.jl")

function test_num_relpose_9lines()

    Random.seed!(23)
    N = 1000
    d = 36

    stats = ini_stats("relpose_9lines")

    for i in 1:N
        data = inidata_num_relpose_9lines()
        C,U = coefs_relpose_9lines(data)

        toc = @elapsed S = red_1610x1726_relpose_9lines(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_9lines()