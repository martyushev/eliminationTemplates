include("../_common/header.jl")
include("inidata_num_rdist9p.jl")
include("coefs_rdist9p.jl")
include("red_73x97_rdist9p.jl")

function test_num_rdist9p()

    Random.seed!(23)
    N = 10000
    d = 24

    stats = ini_stats("rdist9p")

    for i in 1:N
        data = inidata_num_rdist9p()
        C,U = coefs_rdist9p(data)

        toc = @elapsed S = red_73x97_rdist9p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_rdist9p()