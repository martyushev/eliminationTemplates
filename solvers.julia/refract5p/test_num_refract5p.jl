include("../_common/header.jl")
include("inidata_num_refract5p.jl")
include("coefs_refract5p.jl")
include("red_38x58_refract5p.jl")

function test_num_refract5p()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("refract5p")

    for i in 1:N
        data = inidata_num_refract5p()
        C,U = coefs_refract5p(data)

        toc = @elapsed S = red_38x58_refract5p(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_refract5p()