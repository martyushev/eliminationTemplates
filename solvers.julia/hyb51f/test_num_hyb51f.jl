include("../_common/header.jl")
include("inidata_num_hyb51f.jl")
include("coefs_hyb51f.jl")
include("red_598x684_hyb51f.jl")

function test_num_hyb51f()

    Random.seed!(23)
    N = 10000
    d = 56

    stats = ini_stats("hyb51f")

    for i in 1:N
        data = inidata_num_hyb51f()
        C,U = coefs_hyb51f(data)

        toc = @elapsed S = red_598x684_hyb51f(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_hyb51f()