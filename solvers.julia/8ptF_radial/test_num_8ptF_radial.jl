include("../_common/header.jl")
include("inidata_num_8ptF_radial.jl")
include("coefs_8ptF_radial.jl")
include("red_19x39_8ptF_radial.jl")

function test_num_8ptF_radial()

    Random.seed!(23)
    N = 10000
    d = 16

    stats = ini_stats("8ptF_radial")

    for i in 1:N
        data = inidata_num_8ptF_radial()
        C,U = coefs_8ptF_radial(data)

        toc = @elapsed S = red_19x39_8ptF_radial(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_8ptF_radial()