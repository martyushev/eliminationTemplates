include("../_common/header.jl")
include("inidata_num_relpose_4pt.jl")
include("coefs_relpose_4pt.jl")
include("red_72x108_relpose_4pt.jl")

function test_num_relpose_4pt()

    Random.seed!(23)
    N = 10000
    d = 20

    stats = ini_stats("relpose_4pt")

    for i in 1:N
        data = inidata_num_relpose_4pt()
        C,U = coefs_relpose_4pt(data)

        toc = @elapsed S = red_72x108_relpose_4pt(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_relpose_4pt()