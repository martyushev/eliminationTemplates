include("../_common/header.jl")
include("inidata_num_unsynch_relpose.jl")
include("coefs_unsynch_relpose.jl")
include("red_59x79_unsynch_relpose.jl")

function test_num_unsynch_relpose()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("unsynch_relpose")

    for i in 1:N
        data = inidata_num_unsynch_relpose()
        C,U = coefs_unsynch_relpose(data)

        toc = @elapsed S = red_59x79_unsynch_relpose(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_unsynch_relpose()