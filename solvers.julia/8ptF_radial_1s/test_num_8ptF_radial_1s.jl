include("../_common/header.jl")
include("inidata_num_8ptF_radial_1s.jl")
include("coefs_8ptF_radial_1s.jl")
include("red_7x15_8ptF_radial_1s.jl")

function test_num_8ptF_radial_1s()

    Random.seed!(23)
    N = 10000
    d = 8

    stats = ini_stats("8ptF_radial_1s")

    for i in 1:N
        data = inidata_num_8ptF_radial_1s()
        C,U = coefs_8ptF_radial_1s(data)

        toc = @elapsed S = red_7x15_8ptF_radial_1s(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_8ptF_radial_1s()